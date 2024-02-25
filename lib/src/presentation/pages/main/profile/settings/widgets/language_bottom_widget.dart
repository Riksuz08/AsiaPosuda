import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sample_bloc_mobile/src/app_options.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class LanguageBottomWidget extends StatelessWidget {
  const LanguageBottomWidget({
    super.key,
    required this.onChanged,
  });
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(context.tr('language'))),
          ListTile(
            onTap: () {
              onChanged('ru');
            },
            title: const Text('Русский'),
            leading: Image.asset(
              'assets/png/ru.png',
              width: 30,
              height: 30,
            ),
            trailing: Visibility(
              visible: AppOptions.of(context).locale.languageCode == 'ru',
              child: const Icon(Icons.check),
            ),
          ),
          ListTile(
            onTap: () {
              onChanged('uz');
            },
            leading: Image.asset(
              'assets/png/uz.png',
              width: 30,
              height: 30,
            ),
            title: const Text('O\'zbek tili'),
            trailing: Visibility(
              visible: AppOptions.of(context).locale.languageCode == 'uz',
              child: const Icon(Icons.check),
            ),
          ),
          // SafeArea(
          //   minimum: const EdgeInsets.only(bottom: 16),
          //   child: ListTile(
          //     onTap: () {
          //       onChanged('en');
          //     },
          //     title: const Text('EN'),
          //     trailing: Visibility(
          //       visible: AppOptions.of(context).locale.languageCode == 'en',
          //       child: const Icon(Icons.check),
          //     ),
          //   ),
          // ),
        ],
      );
}
