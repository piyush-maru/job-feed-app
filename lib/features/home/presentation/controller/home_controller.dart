import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:interview_prectical/features/home/domain/usecases/job_usecase.dart';
import 'package:interview_prectical/features/home/model/job_data_model.dart';

class HomeController extends GetxController {
  final JobUseCase jobUseCase;

  HomeController(this.jobUseCase);

  RxBool modeSwitch = false.obs;

  var search = TextEditingController();
  var searchText = ''.obs;

  var jobList = <JobUser>[].obs;
  var filteredJobList = <JobUser>[].obs;
  var isLoading = false.obs;

  late Box _jobBox;

  @override
  void onInit() async {
    super.onInit();
    _jobBox = await Hive.openBox("jobBox");
    getJob();

    ever(searchText, (_) => applyFilter());
  }

  /// Fetch from API or load from cache

  Future<void> getJob() async {
    try {
      isLoading.value = true;

      final res = await jobUseCase();
      if (res.users.isNotEmpty) {
        jobList.value = res.users;
        filteredJobList.value = jobList;

        _jobBox.put("jobs", jsonEncode(res.toJson()));
      }
    } catch (e) {
      final cached = _jobBox.get("jobs");
      if (cached != null) {
        final decoded = jsonDecode(cached);
        final res = JobDataModel.fromJson(decoded);
        jobList.value = res.users;
        filteredJobList.value = jobList;
      } else {
        Get.snackbar("Error", "No jobs found (offline, no cache)");
      }
    } finally {
      isLoading.value = false;
    }
  }

  /// Filter search
  void applyFilter() {
    if (searchText.value.isEmpty) {
      filteredJobList.value = jobList; // default all
    } else {
      filteredJobList.value = jobList
          .where(
            (job) =>
                job.fullName.toLowerCase().contains(searchText.value.toLowerCase()) ||
                job.company!.name.toLowerCase().contains(searchText.value.toLowerCase()) ||
                job.company!.title.toLowerCase().contains(searchText.value.toLowerCase()),
          )
          .toList();
    }
  }
}
