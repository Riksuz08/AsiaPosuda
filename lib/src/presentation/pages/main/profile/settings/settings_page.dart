import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_utils.dart';
import 'package:sample_bloc_mobile/src/injector_container.dart';
import 'package:sample_bloc_mobile/src/data/source/local_source.dart';
import 'package:sample_bloc_mobile/src/app_options.dart';
import 'package:sample_bloc_mobile/src/presentation/components/bottom_sheet/custom_bottom_sheet.dart';

import 'widgets/language_bottom_widget.dart';
import 'widgets/theme_bottom_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final options = AppOptions.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("AppTranslations.of(context).settings")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: AppUtils.kBorderRadius16,
          child: Material(
            color: Theme.of(context).cardColor,
            shape: const RoundedRectangleBorder(
              borderRadius: AppUtils.kBorderRadius16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    customBottomSheet(
                      context: context,
                      child: LanguageBottomWidget(
                        onChanged: (lang) async {
                          AppOptions.update(
                            context,
                            options.copyWith(locale: Locale(lang)),
                          );
                          Navigator.pop(context);
                          await sl<LocalSource>().setLocale(lang);
                        },
                      ),
                    );
                  },
                  title: const Text("AppTranslations.of(context).language"),
                ),
                AppUtils.kDivider,
                ListTile(
                  onTap: () {
                    customBottomSheet(
                      context: context,
                      child: ThemeBottomWidget(
                        onChanged: (mode) async {
                          AppOptions.update(
                            context,
                            options.copyWith(themeMode: mode),
                          );
                          Navigator.pop(context);
                          await sl<LocalSource>().setThemeMode(mode);
                        },
                      ),
                    );
                  },
                  title: const Text("AppTranslations.of(context).theme"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
