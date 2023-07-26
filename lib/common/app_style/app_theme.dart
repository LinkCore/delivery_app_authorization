import 'package:authorization/common/app_style/app_colors.dart';
import 'package:flutter/cupertino.dart';

abstract class AppTheme {
  static final AppColors _lightColors = AppColors.light();

  static CupertinoThemeData light = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: _lightColors.primaryColor,
    barBackgroundColor: _lightColors.barBackgroundColor,
    scaffoldBackgroundColor: _lightColors.scaffoldBackgroundColor,
  );
}
