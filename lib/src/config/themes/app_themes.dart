import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_bloc_mobile/src/config/themes/theme_colors.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_text_styles.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  applyElevationOverlayColor: true,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  splashFactory:
      Platform.isAndroid ? InkRipple.splashFactory : NoSplash.splashFactory,
  visualDensity: VisualDensity.standard,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
    ),
  ),
  dividerTheme: const DividerThemeData(thickness: 1),
);

final ThemeData lightTheme = appTheme.copyWith(
  extensions: <ThemeExtension<dynamic>>[
    AppTextStyles.light,
    ThemeColors.light,
  ],
  colorScheme: ColorScheme.light(
    primary: ThemeColors.light.primary,
    secondary: ThemeColors.light.secondary,
    error: Colors.red,
    onPrimary: ThemeColors.light.primary,
    onSecondary: ThemeColors.light.secondary,
    onError: Colors.redAccent,
    surface: Colors.transparent,
    onSurface: Colors.transparent,
    surfaceVariant: Colors.transparent,
    background: ThemeColors.light.scaffoldBackground,
    onBackground: ThemeColors.light.scaffoldBackground,
  ),
  primaryColor: ThemeColors.light.primary,
  scaffoldBackgroundColor: ThemeColors.light.scaffoldBackground,
  cardColor: Colors.white,
  canvasColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return Colors.white;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          return ThemeColors.light.primary;
        },
      ),
      textStyle: MaterialStatePropertyAll(AppTextStyles.light.buttonStyle),
      elevation: const MaterialStatePropertyAll(0),
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      fixedSize: const MaterialStatePropertyAll(Size(double.infinity, 48)),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(),
  bottomSheetTheme: const BottomSheetThemeData(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    selectedLabelStyle: TextStyle(fontSize: 12),
    unselectedLabelStyle: TextStyle(fontSize: 12),
    unselectedItemColor: Color(0xffA0A9B6),
    selectedItemColor: Color(0xff0FB8D3),
    elevation: 2,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Color(0xff111126),
    unselectedLabelColor: Color(0xff111126),
    dividerColor: Colors.transparent,
    overlayColor: MaterialStatePropertyAll(Colors.transparent),
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    indicator: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.white,
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
        return AppTextStyles.light.appBarTitle;
      },
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 1,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      // ios
      statusBarBrightness: Brightness.light,
      // android
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    shadowColor: Colors.black45,
    titleTextStyle: AppTextStyles.light.appBarTitle,
    toolbarTextStyle: AppTextStyles.light.appBarTitle,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
    ),
    displayLarge: TextStyle(
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      color: Colors.black,
    ),
  ),
);

final ThemeData darkTheme = appTheme.copyWith(
  extensions: <ThemeExtension<dynamic>>[
    AppTextStyles.dark,
    ThemeColors.dark,
  ],
  bottomSheetTheme: const BottomSheetThemeData(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.white,
    // indicator: UnderlineTabIndicator(
    //   borderSide: BorderSide(color: AppColors.blue, width: 3.0),
    // ),
    indicator: BoxDecoration(
      color: Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(24)),
      border: Border.all(color: Colors.blue, width: 2.0),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
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
  appBarTheme: AppBarTheme(
    elevation: 0,
    centerTitle: true,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // systemNavigationBarColor: ThemeColors.primary,

      /// android
      statusBarIconBrightness: Brightness.light,

      /// ios
      statusBarBrightness: Brightness.dark,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: AppTextStyles.dark.appBarTitle,
    // backgroundColor: ThemeColors.cardBackgroundDark,
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    ),
  ),
);
