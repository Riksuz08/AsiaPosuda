import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_colors.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_styles.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData light = ThemeData(
    canvasColor: Colors.transparent,
    primaryColor: AppColors.blue,
    scaffoldBackgroundColor: AppColors.background,
    backgroundColor: AppColors.backgroundLight,
    cardColor: AppColors.cardBackgroundLight,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme(
      primary: AppColors.blue,
      secondary: AppColors.white,
      surface: Colors.transparent,
      background: AppColors.backgroundLight,
      error: AppColors.red,
      onPrimary: AppColors.blue,
      onSecondary: AppColors.blue,
      onSurface: AppColors.blue,
      onBackground: AppColors.cardBackgroundLight,
      onError: AppColors.blue,
      brightness: Brightness.light,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 1,
      backgroundColor: AppColors.white,
      height: kToolbarHeight,
      iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
        (Set<MaterialState> states) {
          return const IconThemeData(
            color: Colors.black,
          );
        },
      ),
      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (Set<MaterialState> states) {
          return AppStyles.appBarTitle;
        },
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 1,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        // ios
        statusBarBrightness: Brightness.light,
        // android
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: AppStyles.appBarTitle,
      color: AppColors.white,
      toolbarHeight: kToolbarHeight,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
      bodyText2: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
    ),
    fontFamily: 'SFPro',
  );

  static final ThemeData dark = ThemeData(
    canvasColor: Colors.transparent,
    brightness: Brightness.dark,
    primaryColor: AppColors.blue,
    scaffoldBackgroundColor: AppColors.background,
    backgroundColor: AppColors.background,
    colorScheme: const ColorScheme(
      primary: AppColors.blue,
      secondary: AppColors.white,
      surface: Colors.transparent,
      background: AppColors.backgroundDark,
      error: AppColors.red,
      onPrimary: AppColors.blue,
      onSecondary: AppColors.blue,
      onSurface: AppColors.blue,
      onBackground: AppColors.cardBackgroundDark,
      onError: AppColors.blue,
      brightness: Brightness.dark,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: const AppBarTheme(
      elevation: 1,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      backgroundColor: AppColors.background,
    ),
    cardColor: AppColors.cardBackgroundDark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
      bodyText2: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
    ),
    fontFamily: 'SFPro',
  );
}
