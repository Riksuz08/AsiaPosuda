import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  AppStyles._();

  static const appBarTitle = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const appBarDarkTitle = TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const buttonStyle = TextStyle(
    color: AppColors.white,
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  static const borderRadiusMain = BorderRadius.all(Radius.circular(15));
}
