import 'package:flutter/material.dart';

final class Constants {
  Constants._();

  static const String projectId = 'a4dc1f1c-d20f-4c1a-abf5-b819076604bc';
  static const String environmentId = 'dcd76a3d-c71b-4998-9e5c-ab1e783264d0';
  static const String resourceId = 'a97e8954-5d8e-4469-a241-9a9af2ea2978';
  static const String apiKey = 'P-JV2nVIRUtgyPO5xRNeYll2mT4F5QG4bS';

  /// test
  static const shipperId = 'd4b1658f-3271-4973-8591-98a82939a664';
  static const baseUrl = 'https://app.u-code.io/';
  static const authUrl = 'https://api.auth.u-code.io/';
  static const clientTypeId = '24fd6d7e-c0e7-4029-88cc-2595e9c643d5';
  static const companyId = '696c77b5-0ebd-4277-a278-a7343421a32a';
  static const expiresAt = '2025-06-23T06:00:10.049Z';
  static const roledId = '425486de-89dc-48a7-9fa8-47f7b4eeffcb';

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
