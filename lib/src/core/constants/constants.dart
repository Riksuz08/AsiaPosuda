import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static const String projectId = '1acd7a8f-a038-4e07-91cb-b689c368d855';
  static const String environmentId = '29b028a4-1250-4792-a285-aae4705a39fc';
  static const String resourceId = '19ad6e31-6b86-4271-98c3-a1d57e915687';

  /// test
  static const shipperId = 'd4b1658f-3271-4973-8591-98a82939a664';
  static const baseUrl = 'https://test.customer.api.delever.uz/';
  static const authUrl = 'https://api.auth.u-code.io/';

  static GlobalKey<FormState> bottomNavigatorKey = GlobalKey<FormState>();
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
