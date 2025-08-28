import 'dart:async';
import 'dart:developer';

import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:interview_prectical/core/utils/auth_storage.dart';
import 'package:logger/logger.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;
final Logger _logger = Logger();

Alice alice = Alice();

class DioClient {
  final String baseUrl;
  final Dio _dio = Dio();
  Completer<bool>? _refreshCompleter;

  DioClient(this.baseUrl) {
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(milliseconds: _defaultConnectTimeout)
      ..options.receiveTimeout = const Duration(milliseconds: _defaultReceiveTimeout)
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'}
      ..interceptors.add(
        InterceptorsWrapper(
          /*onRequest: (options, handler) async {
          _logger.i("📤 API Request: ${options.method} ${options.uri}");
          _logger.d("🔹 Headers: ${options.headers}");

          if (options.data != null) {
            _logger.d("📦 Request Body: ${options.data}");
          }
          if (options.queryParameters.isNotEmpty) {
            _logger.d("🔍 Query Parameters: ${options.queryParameters}");
          }

          String? accessToken = await AuthStorage().getAccessToken();
          _logger.i("📤 TOKEN---:--> $accessToken");
          if (accessToken != null && accessToken.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $accessToken";
          }
          return handler.next(options);
        },*/
          onRequest: (options, handler) async {
            _logger.i("📤 API Request: ${options.method} ${options.uri}");
            _logger.d("🔹 Headers: ${options.headers}");

            // if request wants NO AUTH, skip token injection
            if (options.extra["noAuth"] == true) {
              return handler.next(options);
            }

            // else normal behavior with token
            String? accessToken = await AuthStorage().getAccessToken();
            _logger.i("📤 TOKEN---:--> $accessToken");
            if (accessToken != null && accessToken.isNotEmpty) {
              options.headers["Authorization"] = "Bearer $accessToken";
            }
            return handler.next(options);
          },

          onResponse: (response, handler) {
            _logger.i("✅ API Response (${response.statusCode}): ${response.requestOptions.uri}");
            _logger.d("📥 Response Data: ${response.data}");
            return handler.next(response);
          },
          onError: (DioException err, handler) async {
            _logger.e("❌ API Error: ${err.response?.statusCode} ${err.requestOptions.uri}");
            _logger.w("⚠️ Error Message: ${err.response?.data ?? err.message}");

            // 401 handling with refresh flow
            if (err.response?.statusCode == 401) {
              final path = err.requestOptions.path;

              // Prevent retry on refresh token failure
              if (path.contains("auth/refresh-tokens")) {
                _logger.e("🛑 Refresh token also expired, logging out...");
                await AuthStorage().delete();
                if (Get.isRegistered<GetMaterialController>()) {
                  // Get.offAllNamed(AppRoutes.login);
                }
                return;
              }

              _logger.e("🔄 Attempting token refresh...");
              bool refreshed = await _refreshToken();

              if (refreshed) {
                String? newAccessToken = await AuthStorage().getAccessToken();
                _logger.e("🔑 New Access Token: $newAccessToken");
                if (newAccessToken != null && newAccessToken.isNotEmpty) {
                  final cloneRequest = err.requestOptions.copyWith(headers: {...err.requestOptions.headers, "Authorization": "Bearer $newAccessToken"});
                  return _dio.fetch(cloneRequest).then((r) {
                    return handler.resolve(r); // ✅ Auto Retry Request
                  });
                }
              } else {
                await AuthStorage().delete();
                if (Get.isRegistered<GetMaterialController>()) {
                  //Get.offAllNamed(AppRoutes.login); // ✅ Auto Logout
                }
              }
            } else if (err.response?.statusCode == 403) {
              // Reserved for custom permission handling
            } else if (err.response?.statusCode == 400) {
              /*if (err.requestOptions.path.contains(AppRoutes.signUp)) {
              _logger.w("⚠️ Email already taken (400 on signUp)");
              // You can show snackbar here as needed.
              return;
            }*/
            } else if (err.response?.statusCode == 404) {
              _logger.e("❌ API 404 Not Found");
            }
            return handler.next(err);
          },
        ),
      );

    // Alice inspector (optional)
    //_dio.interceptors.add(aliceDioAdapter);
  }

  Future<bool> _refreshToken() async {
    // For demo with ReqRes, we don't have refresh tokens.
    // This method returns false, but the structure is kept for your real API.
    if (_refreshCompleter != null) return _refreshCompleter!.future;
    _refreshCompleter = Completer<bool>();
    try {
      String? refreshToken = await AuthStorage().getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        _refreshCompleter?.complete(false);
        _refreshCompleter = null;
        return false;
      }

      //AppUtils.dartPrint("Attempting refresh with token: $refreshToken");

      final response = await _dio.post("auth/refresh-tokens", data: {"refreshToken": refreshToken});

      //  AppUtils.dartPrint("🔁 Refresh Response status code: ${response.statusCode}");
      if ((response.statusCode == 200 || response.statusCode == 201) && (response.data is Map && (response.data["success"] == true))) {
        final String newAccessToken = response.data["data"]["access"]["token"];
        final String newRefreshToken = response.data["data"]["refresh"]["token"];
        await AuthStorage().saveTokenAndUserInfo(accessToken: newAccessToken, refreshToken: newRefreshToken);
        _refreshCompleter?.complete(true);
        _refreshCompleter = null;
        log("🔁 Token refreshed successfully.");
        return true;
      }
    } catch (e, st) {
      _logger.e("❌ Token refresh failed", error: e, stackTrace: st);
      _refreshCompleter?.complete(false);
    }
    _refreshCompleter = null;
    return false;
  }

  Future<dynamic> get(String uri, {Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken, ProgressCallback? onReceiveProgress}) async {
    try {
      final response = await _dio.get(uri, queryParameters: queryParameters, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    //AppUtils.dartPrint("-----DATA-->$data");
    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch(String uri, {dynamic data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) async {
    try {
      final response = await _dio.patch(uri, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(String uri, {dynamic data, Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) async {
    try {
      final response = await _dio.request(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options?.copyWith(method: 'DELETE') ?? Options(method: 'DELETE'),
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
