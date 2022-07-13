import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_utils.dart';
import 'package:sample_bloc_mobile/src/core/l10n/translations.dart';
import 'package:sample_bloc_mobile/src/data/source/local_source.dart';
import 'package:sample_bloc_mobile/src/gallery_options.dart';
import 'package:sample_bloc_mobile/src/presentation/widgets/bottom_sheet/custom_bottom_sheet.dart';

import 'widgets/language_bottom_widget.dart';
import 'widgets/theme_bottom_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final options = GalleryOptions.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(AppTranslations.of(context).settings)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                          GalleryOptions.update(
                            context,
                            options.copyWith(locale: Locale(lang)),
                          );
                          Navigator.pop(context);
                          await LocalSource.instance.setLocale(lang);
                        },
                      ),
                    );
                  },
                  title: Text(AppTranslations.of(context).language),
                ),
                AppUtils.kDivider,
                ListTile(
                  onTap: () {
                    customBottomSheet(
                      context: context,
                      child: ThemeBottomWidget(
                        onChanged: (mode) async {
                          GalleryOptions.update(
                            context,
                            options.copyWith(themeMode: mode),
                          );
                          Navigator.pop(context);
                          await LocalSource.instance.setThemeMode(mode);
                        },
                      ),
                    );
                  },
                  title: Text(AppTranslations.of(context).theme),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
