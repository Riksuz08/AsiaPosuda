import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppTranslations {
  AppTranslations._();

  static AppLocalizations of(BuildContext context) =>
      AppLocalizations.of(context)!;

  static get localizationsDelegates => AppLocalizations.localizationsDelegates;
  static get supportedLocales => AppLocalizations.supportedLocales;
}
