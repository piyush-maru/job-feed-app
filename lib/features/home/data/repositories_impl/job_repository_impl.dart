import 'package:interview_prectical/features/home/data/datasources/job_remote_data_source.dart';
import 'package:interview_prectical/features/home/domain/repositories/job_repository.dart';
import 'package:interview_prectical/features/home/model/job_data_model.dart';

class JobRepositoryImpl implements JobRepository {
  final JobRemoteDataSource remoteDataSource;

  JobRepositoryImpl(this.remoteDataSource);

  @override
  Future<JobDataModel> getJob() {
    return remoteDataSource.getJob();
  }
}
