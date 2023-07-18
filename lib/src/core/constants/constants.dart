import 'package:flutter/material.dart';

sealed class Constants {
  Constants._();

  /// test
  static const baseUrl = 'https://app.u-code.io';
  static const authUrl = 'https://api.auth.u-code.io';

  /// id
  static const String projectId = 'a4dc1f1c-d20f-4c1a-abf5-b819076604bc';
  static const String environmentId = 'dcd76a3d-c71b-4998-9e5c-ab1e783264d0';
  static const String resourceId = 'a97e8954-5d8e-4469-a241-9a9af2ea2978';
  static const String apiKey = 'P-JV2nVIRUtgyPO5xRNeYll2mT4F5QG4bS';

  static const String clientTypeId = '24fd6d7e-c0e7-4029-88cc-2595e9c643d5';
  static const String companyId = '696c77b5-0ebd-4277-a278-a7343421a32a';
  static const String expiresAt = '2025-06-23T06:00:10.049Z';
  static const String roledId = '425486de-89dc-48a7-9fa8-47f7b4eeffcb';

  static GlobalKey<FormState> bottomNavigatorKey = GlobalKey<FormState>();
}

sealed class Urls {
  Urls._();

  static const String register = '/v2/register';
  static const String sendMessage = '/v2/send-message';
  static const String verifyEmail = '/v2/verify-email';
}

// Sentinel value for the system text scale factor option.
const double systemTextScaleFactorOption = -1;

// The splash page animation duration.
const Duration splashPageAnimationDuration = Duration(milliseconds: 1000);

// The animation display duration.
const Duration animationDuration = Duration(milliseconds: 250);
