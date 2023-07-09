import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'src/app_options.dart';
import 'src/config/router/app_routes.dart';
import 'src/config/themes/themes.dart';
import 'src/core/constants/constants.dart';
import 'src/core/l10n/app_localizations.dart';
import 'src/core/services/notification_service.dart';
import 'src/injector_container.dart';
import 'src/presentation/bloc/log_bloc_observer.dart';
import 'src/presentation/bloc/main/main_bloc.dart';
import 'src/presentation/components/keyboard/keyboard_dismiss.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // if (defaultTargetPlatform != TargetPlatform.linux &&
  //     defaultTargetPlatform != TargetPlatform.windows) {
  //   await notificationServiceInitialize();
  //
  //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  //   // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  //   PlatformDispatcher.instance.onError = (error, stack) {
  //     FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //     return true;
  //   };
  // }

  /// bloc logger
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }
  await init();

  /// global CERTIFICATE_VERIFY_FAILEd_KEY
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MainApp());
  FlutterNativeSplash.remove();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => ModelBinding(
        initialModel: AppOptions(
          themeMode: localSource.themeMode,
          textScaleFactor: systemTextScaleFactorOption,
          customTextDirection: CustomTextDirection.localeBased,
          locale: Locale(localSource.locale),
          timeDilation: timeDilation,
          platform: defaultTargetPlatform,
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<MainBloc>(create: (_) => sl<MainBloc>()),
          ],
          child: Builder(
            builder: (ctx) {
              final AppOptions options = AppOptions.of(ctx);
              return KeyboardDismiss(
                child: MaterialApp(
                  /// title
                  debugShowCheckedModeBanner: false,
                  navigatorKey: rootNavigatorKey,
                  scaffoldMessengerKey: scaffoldMessengerKey,

                  /// theme style
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: options.themeMode,

                  /// lang
                  locale: options.locale,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,

                  /// pages
                  initialRoute: Routes.initial,
                  onGenerateRoute: AppRoutes.onGenerateRoute,
                  onUnknownRoute: AppRoutes.onUnknownRoute,
                ),
              );
            },
          ),
        ),
      );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)
        ..badCertificateCallback = (cert, host, port) => true;
}

/// flutter pub run flutter_launcher_icons:main
/// flutter run -d windows
/// flutter build apk --release
/// flutter build apk --split-per-abi
/// flutter build appbundle --release
/// flutter pub run build_runner watch --delete-conflicting-outputs
/// flutter pub ipa
