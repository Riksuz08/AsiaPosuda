import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static const platformId = '7d4a4c38-dd84-4902-b744-0488b80a4c01';
  static const clientTypeId = '5a3818a9-90f0-44e9-a053-3be0ba1e2c10';
  static const roleId = 'a1ca1301-4da9-424d-a9e2-578ae6dcde10';
  static const baseUrl = 'https://api.client.macbro.uz/';

  static GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "Sample App");
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>(
    debugLabel: "Sample App",
  );
}
// height of the 'Gallery' header
const double galleryHeaderHeight = 64;

// The font size delta for headline4 font.
const double desktopDisplay1FontDelta = 16;

// The width of the settingsDesktop.
const double desktopSettingsWidth = 520;

// Sentinel value for the system text scale factor option.
const double systemTextScaleFactorOption = -1;

// The splash page animation duration.
const splashPageAnimationDurationInMilliseconds = 300;

// The desktop top padding for a page's first header (e.g. Gallery, Settings)
const firstHeaderDesktopTopPadding = 5.0;