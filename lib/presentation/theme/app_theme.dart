import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';
import 'config_theme.dart';

OutlineInputBorder defaultTextFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(13),
  borderSide: BorderSide(
    style: BorderStyle.solid,
    color: AppColors().normalGreyColor,
    width: 1.5,
  ),
);

class AppTheme {
  AppTheme._internal();
  factory AppTheme.instance() => AppTheme._internal();

  static ThemeData get theme => ThemeData(
        platform: TargetPlatform.iOS,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(16),
          isCollapsed: false,
          hintStyle: Get.textTheme.titleSmall,
          filled: true,
          fillColor: AppColors().darkGreyColor,
          border: defaultTextFieldBorder,
          errorBorder: defaultTextFieldBorder.copyWith(
            borderSide: defaultTextFieldBorder.borderSide
                .copyWith(color: AppColors().normalRedColor),
          ),
          focusedErrorBorder: defaultTextFieldBorder.copyWith(
            borderSide: defaultTextFieldBorder.borderSide
                .copyWith(color: AppColors().normalRedColor),
          ),
          focusedBorder: defaultTextFieldBorder.copyWith(
            borderSide: defaultTextFieldBorder.borderSide
                .copyWith(color: AppColors().primaryColor),
          ),
          enabledBorder: defaultTextFieldBorder,
          disabledBorder: defaultTextFieldBorder.copyWith(
            borderSide: defaultTextFieldBorder.borderSide
                .copyWith(color: AppColors().normalGreyColor),
          ),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: Get.textTheme.titleSmall,
          iconTheme: IconThemeData(
            color: AppColors().primaryColor,
          ),
          color: Colors.transparent,
          toolbarHeight: 71,
          centerTitle: true,
        ),
        primaryColor: AppColors().primaryColor,
        primarySwatch: AppColors().primarySwatch,
        textTheme: ConfigTheme.textTheme,
        scaffoldBackgroundColor: AppColors().normalBlackColor,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: AppColors().primaryColor),
      );
}
