
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'data/source/local_source.dart';
import 'config/routes/app_pages.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_themes.dart';
import 'core/l10n/translations.dart';
import 'core/utils/constants.dart';
import 'app_options.dart';
import 'presentation/bloc/main/main_bloc.dart';

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
      child: KeyboardDismisser(
        child: Builder(
          builder: (ctx) {
            final options = AppOptions.of(ctx);
            return MultiBlocProvider(
              providers: [
                BlocProvider<MainBloc>(create: (_) => MainBloc()),
              ],
              child: MaterialApp(
                onGenerateTitle: (context) =>
                    AppTranslations.of(context).appTitle,
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
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,

                /// pages
                routes: AppPages.routes,
                initialRoute: AppRoutes.initial,
              ),
            );
          },
        ),
      ),
    );
  }
}
