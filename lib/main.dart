import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'src/app_options.dart';
import 'src/config/router/app_routes.dart';
import 'src/config/themes/app_themes.dart';
import 'src/injector_container.dart';
import 'src/core/l10n/app_localizations.dart';
import 'src/core/constants/constants.dart';
import 'src/presentation/bloc/main/main_bloc.dart';
import 'src/presentation/bloc/log_bloc_observer.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await NotificationService.initialize();

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
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: AppOptions(
        themeMode: localSource.themeMode(),
        textScaleFactor: systemTextScaleFactorOption,
        customTextDirection: CustomTextDirection.localeBased,
        locale: Locale(localSource.locale),
        timeDilation: timeDilation,
        platform: defaultTargetPlatform,
        isTestMode: true,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(create: (_) => sl<MainBloc>()),
        ],
        child: KeyboardDismisser(
          child: Builder(
            builder: (ctx) {
              final AppOptions options = AppOptions.of(ctx);
              return MaterialApp(
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
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,

                /// pages
                initialRoute: Routes.initial,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                onUnknownRoute: AppRoutes.onUnknownRoute,
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

/// flutter pub run build_runner watch --delete-conflicting-outputs
