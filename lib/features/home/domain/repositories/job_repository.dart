import 'package:interview_prectical/features/home/model/job_data_model.dart';

abstract class JobRepository {
  Future<JobDataModel> getJob();
}
