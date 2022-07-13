import 'package:flutter/material.dart';

import 'app_colors.dart';

const sfPro = 'SFPro';

class AppStyles {
  AppStyles._();

  static const appBarTitle = TextStyle(
    fontFamily: "SFPro",
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const appBarDarkTitle = TextStyle(
    fontFamily: "SFPro",
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const borderRadiusMain = BorderRadius.all(Radius.circular(15));
}
