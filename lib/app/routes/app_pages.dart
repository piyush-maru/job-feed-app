import 'package:get/get.dart';
import 'package:interview_prectical/app/routes/app_routes.dart';
import 'package:interview_prectical/features/home/home_binding.dart';
import 'package:interview_prectical/features/home/presentation/pages/home_page.dart';
import 'package:interview_prectical/features/home/presentation/pages/job_detail_page.dart';
import 'package:interview_prectical/features/splash/presentation/pages/splash_page.dart';
import 'package:interview_prectical/features/splash/splash_binding.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: AppRoutes.home, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: AppRoutes.jobDetail, page: () => JobDetailPage(), binding: JobDetailBinding()),
  ];
}
