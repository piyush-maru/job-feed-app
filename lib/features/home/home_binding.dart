
import 'package:get/get.dart';
import 'package:interview_prectical/core/constants/api_endpoints.dart';
import 'package:interview_prectical/core/network/dio_client.dart';
import 'package:interview_prectical/features/home/data/datasources/job_remote_data_source.dart';
import 'package:interview_prectical/features/home/data/repositories_impl/job_repository_impl.dart';
import 'package:interview_prectical/features/home/domain/repositories/job_repository.dart';
import 'package:interview_prectical/features/home/domain/usecases/job_usecase.dart';
import 'package:interview_prectical/features/home/presentation/controller/home_controller.dart';
import 'package:interview_prectical/features/home/presentation/controller/job_detail_controller.dart';



class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DioClient(ApiEndpoints.baseUrl));
    Get.lazyPut<JobRemoteDataSource>(() => JobRemoteDataSourceImpl(Get.find()));
    Get.lazyPut<JobRepository>(() => JobRepositoryImpl(Get.find()));
    Get.lazyPut(() => JobUseCase(Get.find()));
    Get.lazyPut(() => HomeController(Get.find()));


  }
}


class JobDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobDetailController());
  }
}