import 'package:flutter/cupertino.dart';

class AppColors {
  Color primaryColor;
  Color barBackgroundColor;
  Color scaffoldBackgroundColor;

  AppColors({
    required this.primaryColor,
    required this.barBackgroundColor,
    required this.scaffoldBackgroundColor,
  });

  factory AppColors.light() {
    return AppColors(
      primaryColor: const Color(0xFF4332CA),
      barBackgroundColor: const Color(0xFFFFFFFF),
      scaffoldBackgroundColor: const Color(0xFFF3F4F6),
    );
  }
}
