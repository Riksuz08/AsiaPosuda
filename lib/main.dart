import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'src/app_options.dart';
import 'src/config/routes/app_pages.dart';
import 'src/config/routes/app_routes.dart';
import 'src/config/themes/app_themes.dart';
import 'src/core/di/di_injection.dart';
import 'src/core/l10n/translations.dart';
import 'src/core/utils/constants.dart';
import 'src/data/source/local_source.dart';
import 'src/presentation/bloc/main/main_bloc.dart';
import 'src/presentation/bloc/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// initial
  await Hive.initFlutter();

  /// local source
  await LocalSource.getInstance();

  /// bloc logger
  if (kDebugMode) {
    Bloc.observer = SimpleBlocObserver();
  }

  /// di
  registerSingletons();

  /// run app
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: AppOptions(
        themeMode: LocalSource.instance.getThemeMode(),
        textScaleFactor: systemTextScaleFactorOption,
        customTextDirection: CustomTextDirection.localeBased,
        locale: Locale(LocalSource.instance.getLocale()),
        timeDilation: timeDilation,
        platform: defaultTargetPlatform,
        isTestMode: true,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(create: (_) => inject()),
        ],
        child: KeyboardDismisser(
          child: Builder(
            builder: (ctx) {
              final options = AppOptions.of(ctx);
              return MaterialApp(
                /// title
                onGenerateTitle: (context) =>
                    AppTranslations.of(context).appTitle,
                scrollBehavior: const MaterialScrollBehavior().copyWith(
                  scrollbars: false,
                ),
                debugShowCheckedModeBanner: false,
                navigatorKey: AppConstants.navigatorKey,
                scaffoldMessengerKey: AppConstants.scaffoldMessengerKey,

                /// theme style
                theme: AppThemes.light,
                darkTheme: AppThemes.dark,
                themeMode: options.themeMode,

                /// lang
                locale: options.locale,
                localizationsDelegates: AppTranslations.localizationsDelegates,
                supportedLocales: AppTranslations.supportedLocales,

                /// pages
                routes: AppPages.routes,
                initialRoute: AppRoutes.initial,
                onUnknownRoute: AppPages.onUnknownRoute,
              );
            },
          ),
        ),
      ),
    );
  }
}
