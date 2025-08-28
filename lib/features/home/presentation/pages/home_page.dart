import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:interview_prectical/app/routes/app_routes.dart';
import 'package:interview_prectical/core/constants/app_images.dart';
import 'package:interview_prectical/core/constants/app_strings.dart';
import 'package:interview_prectical/core/theme/app_colors.dart';
import 'package:interview_prectical/core/theme/app_text_styles.dart';
import 'package:interview_prectical/core/utils/my_size.dart';
import 'package:interview_prectical/core/widgets/common_home_app_bar.dart';
import 'package:interview_prectical/core/widgets/custom_switch.dart';
import 'package:interview_prectical/core/widgets/custom_textfield.dart';
import 'package:interview_prectical/features/home/presentation/controller/home_controller.dart';
import 'package:interview_prectical/main.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController(Get.find()));
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CommonHomeAppBar(
        onTap: () {},
        action: Obx(
          () => Padding(
            padding: MySize.paddingRight(16),
            child: CustomSwitch(
              initialValue: themeController!.isDarkMode.value,
              onChanged: (value) {
                themeController.saveTheme(value);
              },
            ),
          ),
        ),
      ),

      body: Padding(
        padding: MySize.symmetric(horizontal: 12, vertical: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(MySize.w(8)),
            CommonTextField(
              controller: controller.search,
              hintText: AppStrings.search,
              prefixIcon: Padding(
                padding: MySize.all(12),
                child: Image(
                  image: AssetImage(AppImage.search),
                  height: MySize.h(24),
                  width: MySize.w(24),
                  fit: BoxFit.fill,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors
                            .white // Dark mode color
                      : null,
                ),
              ),

              suffixIcon: GestureDetector(
                onTap: () {
                  controller.search.clear();
                  controller.searchText.value = "";
                },
                child: Padding(
                  padding: MySize.all(12),
                  child: Image(
                    image: AssetImage(AppImage.roundCross),
                    height: MySize.h(24),
                    width: MySize.w(24),
                    fit: BoxFit.fill,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors
                              .white // Dark mode color
                        : null,
                  ),
                ),
              ),
              onChanged: (value) => controller.searchText.value = value,
            ),
            Gap(MySize.w(8)),

            Obx(() {
              if (controller.isLoading.value) {
                return _buildShimmerLoader();
              }

              if (controller.filteredJobList.isEmpty) {
                return Center(child: Text(AppStrings.noJobFound, style: AppTextStyles.bolt600));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: controller.filteredJobList.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 12),
                  itemBuilder: (context, index) {
                    final job = controller.filteredJobList[index];

                    return Padding(
                      padding: MySize.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.jobDetail, arguments: controller.filteredJobList[index]);
                        },
                        child: Container(
                          width: MySize.screenWidth,
                          decoration: BoxDecoration(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.grey[800] // Dark mode color
                                : AppColors.secondaryGreen,

                            borderRadius: MySize.radius(8),
                          ),
                          child: Padding(
                            padding: MySize.padding(12, 16, 12, 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    job.profilePic != ""
                                        ? ClipOval(
                                            child: Image.network(job.profilePic, height: MySize.h(40), width: MySize.w(40), fit: BoxFit.cover, errorBuilder: (c, e, s) => Icon(Icons.person, size: 40)),
                                          )
                                        : Container(
                                            height: MySize.h(40),
                                            width: MySize.w(40),
                                            decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                                            child: Image(image: AssetImage(AppImage.splash), fit: BoxFit.cover),
                                          ),
                                    Gap(MySize.w(12)),
                                    Text(job.fullName, style: Theme.of(context).textTheme.headlineLarge),
                                  ],
                                ),
                                Gap(MySize.h(16)),
                                infoRow(context: context, title: AppStrings.company, subtitle: "${job.company?.name}"),
                                infoRow(context: context, title: AppStrings.department, subtitle: "${job.company?.department}"),
                                infoRow(context: context, title: AppStrings.jobTitle, subtitle: "${job.company?.title}"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget infoRow({required BuildContext context, required String title, required String subtitle}) {
    return Padding(
      padding: MySize.paddingBottom(8),
      child: Row(
        children: [
          Text("$title : ", style: Theme.of(context).textTheme.headlineLarge),
          Gap(MySize.w(8)),
          Expanded(child: Text(subtitle, style: Theme.of(context).textTheme.labelMedium)),
        ],
      ),
    );
  }
}

Widget _buildShimmerLoader() {
  return Expanded(
    child: ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 12),
      itemBuilder: (context, index) {
        return Padding(
          padding: MySize.only(bottom: 12),
          child: Shimmer.fromColors(
            baseColor: AppColors.secondaryGreen,
            highlightColor: const Color(0xFFB2DFBD).withOpacity(0.9),
            child: Container(
              alignment: Alignment.centerLeft,
              height: MySize.screenHeight * 0.25,
              width: MySize.screenWidth,
              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
            ),
          ),
        );
      },
    ),
  );
}
