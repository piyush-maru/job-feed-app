import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:interview_prectical/app/routes/app_routes.dart';
import 'package:interview_prectical/core/constants/api_endpoints.dart';

class AuthStorage {
  // Hive box name
  static const String _boxName = 'authBox';

  /// Save token and user info
  Future<void> saveTokenAndUserInfo({required String accessToken, required String refreshToken}) async {
    final box = await Hive.openBox(_boxName);
    await box.put(ApiEndpoints.accessToken, accessToken);
    await box.put(ApiEndpoints.refreshToken, refreshToken);
  }

  Future<String?> getAccessToken() async {
    final box = await Hive.openBox(_boxName);
    return box.get(ApiEndpoints.accessToken);
  }

  Future<String?> getRefreshToken() async {
    final box = await Hive.openBox(_boxName);
    return box.get(ApiEndpoints.refreshToken);
  }

  Future<void> tempSaveToken({required String tempAccessToken, required String tempRefreshToken}) async {
    final box = await Hive.openBox(_boxName);
    await box.put(ApiEndpoints.tempAccessToken, tempAccessToken);
    await box.put(ApiEndpoints.tempRefreshToken, tempRefreshToken);
  }

  Future<String?> getTempAccessToken() async {
    final box = await Hive.openBox(_boxName);
    return box.get(ApiEndpoints.tempAccessToken);
  }

  Future<String?> getTempRefreshToken() async {
    final box = await Hive.openBox(_boxName);
    return box.get(ApiEndpoints.tempRefreshToken);
  }

  Future<void> deleteTokens() async {
    final box = await Hive.openBox(_boxName);
    await box.delete(ApiEndpoints.accessToken);
    await box.delete(ApiEndpoints.refreshToken);
  }

  Future<bool> isLoggedIn() async {
    final box = await Hive.openBox(_boxName);
    return box.get(ApiEndpoints.accessToken) != null;
  }

  Future<void> logOut() async {
    final box = await Hive.openBox(_boxName);
    await box.clear();
    Get.offAllNamed(AppRoutes.splash);
  }

  Future<void> delete() async {
    final box = await Hive.openBox(_boxName);
    await box.clear();
  }
}
