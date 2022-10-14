import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/app_options.dart';
import 'package:sample_bloc_mobile/src/core/l10n/translations.dart';
import 'package:sample_bloc_mobile/src/presentation/components/bottom_sheet/custom_modal_bottom_widget.dart';

class LanguageBottomWidget extends StatelessWidget {
  final Function(String) onChanged;

  const LanguageBottomWidget({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomModalBottomWidget(
      title: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(AppTranslations.of(context).language),
      ),
      minChildren: [
        ListTile(
          onTap: () {
            onChanged("ru");
          },
          title: const Text("RU"),
          trailing: Visibility(
            visible: AppOptions.of(context).locale?.languageCode == 'ru',
            child: const Icon(Icons.check),
          ),
        ),
        ListTile(
          onTap: () {
            onChanged("uz");
          },
          title: const Text("UZ"),
          trailing: Visibility(
            visible: AppOptions.of(context).locale?.languageCode == 'uz',
            child: const Icon(Icons.check),
          ),
        ),
        ListTile(
          onTap: () {
            onChanged("en");
          },
          title: const Text("EN"),
          trailing: Visibility(
            visible: AppOptions.of(context).locale?.languageCode == 'en',
            child: const Icon(Icons.check),
          ),
        ),
      ],
    );
  }
}
