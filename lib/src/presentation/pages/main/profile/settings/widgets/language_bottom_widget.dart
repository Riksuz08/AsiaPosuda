import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/l10n/translations.dart';
import 'package:sample_bloc_mobile/src/presentation/widgets/bottom_sheet/custom_modal_bottom_widget.dart';

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
          title: Text("RU"),
        ),
        ListTile(
          onTap: () {
            onChanged("uz");
          },
          title: Text("UZ"),
        ),
        ListTile(
          onTap: () {
            onChanged("en");
          },
          title: Text("EN"),
        ),
      ],
    );
  }
}
