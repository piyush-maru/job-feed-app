import 'package:flutter/material.dart';
import 'package:interview_prectical/core/theme/app_colors.dart';
import 'package:interview_prectical/core/theme/app_text_styles.dart';
import 'package:interview_prectical/core/utils/my_size.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    MySize.init(context); // ensure initialized

    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.white,

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(AppColors.primaryGreen), // circle
        trackColor: WidgetStateProperty.all(AppColors.secondaryGreen), // background
      ),

      textTheme: TextTheme(headlineLarge: AppTextStyles.bolt600, labelMedium: AppTextStyles.smallText400),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    MySize.init(context);

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(AppColors.white), // white knob
        trackColor: WidgetStateProperty.all(AppColors.primaryGreen), // green track
      ),

      textTheme: TextTheme(
        headlineLarge: AppTextStyles.bolt600.copyWith(color: AppColors.white),

        labelMedium: AppTextStyles.smallText400.copyWith(color: AppColors.white),
      ),
    );
  }
}
