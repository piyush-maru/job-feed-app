
import 'package:get/get.dart';
import 'package:interview_prectical/features/splash/presentation/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}

