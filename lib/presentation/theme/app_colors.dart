import 'package:flutter/material.dart';

class AppColors {
  Color primaryColor = const Color(0xFFff0084);
  Color normalWhiteColor = const Color(0xFFF5F5F8);
  Color normalGreyColor = const Color(0xFF7D8588);
  Color darkGreyColor = const Color(0xFF333333);
  Color normalBlackColor = const Color(0xFF151515);
  Color lightPinkColor = const Color(0xFFFF4DA9);
  Color normalGreenColor = const Color(0xFF02B300);
  Color normalYellowColor = const Color(0xFFFFE419);
  Color normalRedColor = const Color(0xFFFF2F0D);

  MaterialColor primarySwatch = const MaterialColor(0xFFff0084, {
    50: Color(0xFFF5F5F8),
    100: Color(0xFFF5F5F8),
    200: Color(0xFFF5F5F8),
    300: Color(0xFFF5F5F8),
    400: Color(0xFFF5F5F8),
    500: Color(0xFFff0084),
    600: Color(0xFFff0084),
    700: Color(0xFFff0084),
    800: Color(0xFFff0084),
    900: Color(0xFFff0084),
  });

  LinearGradient primaryGradient = const LinearGradient(
    colors: [
      Color(0xFFff0084),
      Color(0xFFFF4DA9),
    ],
  );
}
