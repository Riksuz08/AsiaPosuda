import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/presentation/components/bottom_sheet/custom_modal_bottom_widget.dart';

class ThemeBottomWidget extends StatelessWidget {
  final Function(ThemeMode) onChanged;

  const ThemeBottomWidget({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomModalBottomWidget(
      title: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text("AppTranslations.of(context).theme"),
      ),
      minChildren: [
        ListTile(
          onTap: () {
            onChanged(ThemeMode.system);
          },
          title: const Text("AppTranslations.of(context).system"),
        ),
        ListTile(
          onTap: () {
            onChanged(ThemeMode.light);
          },
          title: const Text("AppTranslations.of(context).light"),
        ),
        ListTile(
          onTap: () {
            onChanged(ThemeMode.dark);
          },
          title: const Text("AppTranslations.of(context).dark"),
        ),
      ],
    );
  }
}
