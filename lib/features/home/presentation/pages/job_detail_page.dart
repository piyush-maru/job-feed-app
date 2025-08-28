import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:interview_prectical/core/constants/app_strings.dart';
import 'package:interview_prectical/core/utils/my_size.dart';
import 'package:interview_prectical/features/home/presentation/controller/job_detail_controller.dart';

class JobDetailPage extends StatelessWidget {
  JobDetailPage({super.key});

  final JobDetailController controller = Get.put(JobDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppStrings.jobDetail,style:Theme.of(context).textTheme.headlineLarge),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Padding(
          padding: MySize.symmetric(horizontal: 12,vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.job.value?.profilePic == ""
                    ? Image(image: NetworkImage("https://dummyjson.com/icon/emilys/128"), height: MySize.screenHeight*0.6, width: double.infinity, fit: BoxFit.fill)
                    :Image(image: NetworkImage(controller.job.value!.profilePic), height: MySize.screenHeight*0.4, width: double.infinity, fit: BoxFit.fill),
                Gap(MySize.h(18)),
                infoRow(context:context,title: AppStrings.company,subtitle: "${controller.job.value?.company?.name}"),
                infoRow(context:context,title: AppStrings.department,subtitle: "${controller.job.value?.company?.department}"),
                infoRow(context:context,title: AppStrings.title,subtitle: "${controller.job.value?.company?.title}"),
                infoRow(context:context,title: AppStrings.jobTitle,subtitle: "${controller.job.value?.description}"),

              ],
            ),
          ),
        )

    );
  }

  Widget infoRow({required BuildContext context,required String title, required String subtitle}) {
    return Padding(
      padding:MySize.paddingBottom(8),
      child: Row(
        children: [
          Text(
            "$title : ",
            style: Theme.of(context).textTheme.headlineLarge
          ),
          Gap(MySize.w(8)),
          Expanded(
            child: Text(
              subtitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
