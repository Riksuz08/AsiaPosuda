import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_colors.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_styles.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData light = ThemeData(
    primaryColor: AppColors.blue,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    backgroundColor: AppColors.backgroundLight,
    cardColor: AppColors.cardBackgroundLight,

    bottomSheetTheme: const BottomSheetThemeData(
      elevation: 0,
      backgroundColor: AppColors.backgroundLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      elevation: 2,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: AppColors.black,
      unselectedLabelColor: AppColors.grey,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.blue, width: 3.0),
      ),
    ),
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
    // navigationBarTheme: NavigationBarThemeData(
    //   elevation: 0,
    //   backgroundColor: AppColors.white,
    //   height: kToolbarHeight,
    //   iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
    //     (Set<MaterialState> states) {
    //       return const IconThemeData(
    //         color: Colors.black,
    //       );
    //     },
    //   ),
    //   labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
    //     (Set<MaterialState> states) {
    //       return AppStyles.appBarTitle;
    //     },
    //   ),
    // ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
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
      toolbarTextStyle: AppStyles.appBarTitle,
      backgroundColor: AppColors.white,
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
      headline6: TextStyle(
        color: AppColors.black,
      ),
    ),
    fontFamily: 'SFPro',
  );

  static final ThemeData dark = ThemeData(
    canvasColor: Colors.transparent,
    brightness: Brightness.dark,
    primaryColor: AppColors.blue,
    cardColor: AppColors.cardBackgroundDark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    backgroundColor: AppColors.backgroundDark,
    bottomSheetTheme: const BottomSheetThemeData(
      elevation: 0,
      backgroundColor: AppColors.cardBackgroundDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.white,
      unselectedLabelColor: AppColors.greyBD,
      // indicator: UnderlineTabIndicator(
      //   borderSide: BorderSide(color: AppColors.blue, width: 3.0),
      // ),
      indicator: BoxDecoration(
        color: AppColors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        border: Border.all(color: AppColors.blue, width: 2.0),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.cardBackgroundDark,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      elevation: 2,
    ),
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
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.primary,

        /// android
        statusBarIconBrightness: Brightness.light,

        /// ios
        statusBarBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      titleTextStyle: AppStyles.appBarDarkTitle,
      backgroundColor: AppColors.cardBackgroundDark,
    ),
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
