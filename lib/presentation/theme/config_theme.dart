import 'package:flutter/material.dart';

import 'app_colors.dart';

class ConfigTheme {
  ConfigTheme._internal();
  factory ConfigTheme.instance() => ConfigTheme._internal();
  static TextTheme get textTheme => TextTheme(
        bodySmall: ConfigTheme.instance().textStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        labelMedium: ConfigTheme.instance().textStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: ConfigTheme.instance().textStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      );

  TextStyle textStyle({
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: fontSize,
      color: AppColors().normalWhiteColor,
      fontWeight: fontWeight,
    );
  }
}
