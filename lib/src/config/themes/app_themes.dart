import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_colors.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_styles.dart';

abstract class AppThemes {
  AppThemes._();

  static final ThemeData light = ThemeData(
    /// use material 3
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: AppColors.blue,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    backgroundColor: AppColors.backgroundLight,
    cardColor: AppColors.cardBackgroundLight,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.grey6F;
            }
            return AppColors.blue;
          },
        ),
        textStyle: MaterialStateProperty.all(AppStyles.buttonStyle),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        fixedSize: MaterialStateProperty.all(const Size(double.infinity, 48)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(),
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
      selectedLabelStyle: TextStyle(fontSize: 14),
      unselectedLabelStyle: TextStyle(fontSize: 14),
      unselectedItemColor: AppColors.greyBD,
      selectedItemColor: AppColors.blue,
      elevation: 2,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: AppColors.black,
      unselectedLabelColor: AppColors.grey,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.blue, width: 3.0),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
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
      elevation: 0,
      scrolledUnderElevation: 0,
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
      surfaceTintColor: AppColors.white,
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
    /// use material 3
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: AppColors.blue,
    canvasColor: Colors.transparent,
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
