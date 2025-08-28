import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:interview_prectical/features/home/model/job_data_model.dart';

class JobDetailController extends GetxController {
  RxString title = ''.obs;
  RxString description = ''.obs;

  var job = Rx<JobUser?>(null);

  @override
  void onInit() {
    super.onInit();
    job.value = Get.arguments as JobUser;
    debugPrint("Job detail: ${job.value}");
  }
}
