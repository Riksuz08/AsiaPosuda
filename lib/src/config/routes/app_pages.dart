import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/error/error_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/internet_connection/internet_connection_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/main_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/main/profile/settings/settings_page.dart';
import 'package:sample_bloc_mobile/src/presentation/pages/splash/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.initial: (_) => const SplashPage(),
        AppRoutes.main: (_) => const MainPage(),
        AppRoutes.internetConnection: (_) => const InternetConnectionPage(),
        AppRoutes.settings: (_) => const SettingsPage(),
      };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print("Navigate to: $settings");
    }
    return null;
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    if (kDebugMode) {
      print("Navigate to: $settings");
    }
    return MaterialPageRoute(
      builder: (_) => ErrorPage(
        settings: settings,
      ),
    );
  }
}
