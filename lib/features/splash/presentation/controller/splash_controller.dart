

import 'package:get/get.dart';
import 'package:interview_prectical/app/routes/app_routes.dart';

class SplashController extends GetxController {


  @override
  void onInit()async {

    super.onInit();
    goToHome();

    /*await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(AppRoutes.home);*/

  }
  Future<void> goToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(AppRoutes.home); // removes splash completely
  }
}