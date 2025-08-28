import 'package:interview_prectical/features/home/model/job_data_model.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';

abstract class JobRemoteDataSource {
  Future<JobDataModel> getJob();
}

class JobRemoteDataSourceImpl implements JobRemoteDataSource {
  final DioClient dioClient;

  JobRemoteDataSourceImpl(this.dioClient);

  @override
  Future<JobDataModel> getJob() async {
    final response = await dioClient.get(ApiEndpoints.getJobs, queryParameters: {"limit": 20});

    return JobDataModel.fromJson(response);
  }
}
