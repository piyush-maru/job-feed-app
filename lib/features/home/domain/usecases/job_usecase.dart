import 'package:interview_prectical/features/home/domain/repositories/job_repository.dart';
import 'package:interview_prectical/features/home/model/job_data_model.dart';

class JobUseCase {
  final JobRepository repository;

  JobUseCase(this.repository);

  Future<JobDataModel> call() {
    return repository.getJob();
  }
}
