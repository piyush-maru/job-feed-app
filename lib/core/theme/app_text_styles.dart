import 'package:flutter/material.dart';
import 'package:interview_prectical/core/utils/my_size.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle bolt600 = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: MySize.font(16),
    height: 24 / 16,
    letterSpacing: 0,
    fontVariations: const [FontVariation('wght', 600)],
  );

  static TextStyle smallText400 = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: MySize.font(14),
    height: 22 / 14,
    letterSpacing: 0,
    fontVariations: const [FontVariation('wght', 400)],
  );
}
