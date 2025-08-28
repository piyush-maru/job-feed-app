import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:interview_prectical/core/theme/app_colors.dart';
import 'package:interview_prectical/core/utils/my_size.dart';

class CustomSwitch extends StatelessWidget {
  final bool initialValue;
  final ValueChanged<dynamic>? onChanged;

  const CustomSwitch({super.key, required this.initialValue, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      initialValue: initialValue,
      activeColor: AppColors.primaryGreen,
      inactiveColor: AppColors.secondaryGreen,
      borderRadius: BorderRadius.all(const Radius.circular(15)),
      width: MySize.w(51).toDouble(),
      height: MySize.w(31).toDouble(),
      enabled: true,
      disabledOpacity: 0.5,
      onChanged: onChanged,
    );
  }
}
