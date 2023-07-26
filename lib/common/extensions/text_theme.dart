import 'package:flutter/cupertino.dart';

extension TextThemeExtension on CupertinoTextThemeData {
  TextStyle get title => const TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 30,
        letterSpacing: 2,
        fontWeight: FontWeight.w500,
      );

  TextStyle get subtitle => const TextStyle(
      fontFamily: 'SF Pro Display',
      fontSize: 12,
      color: CupertinoColors.systemGrey,
      letterSpacing: 2);
}
