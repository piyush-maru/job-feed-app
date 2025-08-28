import 'package:flutter/material.dart';
import 'package:interview_prectical/core/constants/app_images.dart';
import 'package:interview_prectical/core/constants/app_strings.dart';
import 'package:interview_prectical/core/utils/my_size.dart';

class CommonHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? profile;
  final VoidCallback? onTap;
  final Widget? action;

  const CommonHomeAppBar({Key? key, this.profile, this.onTap, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 2,
      shadowColor: Colors.black38,
      centerTitle: true,
      surfaceTintColor: Colors.white,
      leadingWidth: MySize.w(56),
      leading: Padding(
        padding: MySize.paddingLeft(16),
        child: Center(
          child: Image(image: AssetImage(profile ?? AppImage.splash), height: MySize.h(32), width: MySize.w(32), fit: BoxFit.fill),
        ),
      ),
      title: Center(child: Text(AppStrings.job, style: Theme.of(context).textTheme.headlineLarge /*AppTextStyles.bolt600*/)),
      actions: [action!],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
