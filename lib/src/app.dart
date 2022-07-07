import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sample_bloc_mobile/src/data/source/local_source.dart';

import 'config/routes/app_pages.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_themes.dart';
import 'core/utils/constants.dart';
import 'data/gallery_options.dart';
import 'presentation/bloc/main/main_bloc.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: GalleryOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        customTextDirection: CustomTextDirection.localeBased,
        locale: Locale(LocalSource.instance.getLocale()),
        timeDilation: timeDilation,
        platform: defaultTargetPlatform,
        isTestMode: true,
      ),
      child: KeyboardDismisser(
        child: Builder(builder: (ctx) {
          final options = GalleryOptions.of(ctx);
          return MultiBlocProvider(
            providers: [
              BlocProvider<MainBloc>(create: (_) => MainBloc()),
            ],
            child: MaterialApp(
              title: "Sample App",
              scrollBehavior:
                  const MaterialScrollBehavior().copyWith(scrollbars: false),
              debugShowCheckedModeBanner: false,
              navigatorKey: AppConstants.navigatorKey,
              scaffoldMessengerKey: AppConstants.scaffoldMessengerKey,

              /// theme style
              theme: AppThemes.light,
              darkTheme: AppThemes.dark,
              themeMode: options.themeMode,

              /// lang
              locale: options.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ru', 'RU'),
                Locale('uz', 'UZ'),
                Locale('en', 'US'),
              ],

              /// pages
              routes: AppPages.routes,
              initialRoute: AppRoutes.initial,
            ),
          );
        }),
      ),
    );
  }
}
