import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_colors.dart';
import 'package:sample_bloc_mobile/src/core/l10n/translations.dart';

Future<T?> customBottomSheet<T>({
  required BuildContext context,
  required Widget child,
}) async {
  return await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (ctx) {
      return child;
    },
  );
}

Future<T?> cupertinoSheet<T>({
  required BuildContext context,
  required Widget title,
  required List<Widget> children,
}) async {
  final size = MediaQuery.of(context).size;
  if (Platform.isIOS) {
    return await showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return CupertinoActionSheet(
          title: title,
          actions: List.generate(
            children.length,
            (index) => CupertinoActionSheetAction(
              onPressed: () {},
              child: children[index],
            ),
          ),
          cancelButton: CupertinoActionSheetAction(
            child: Text(AppTranslations.of(context).cancel),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        );
      },
    );
  } else {
    return await showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            title,
            ...children,
          ],
        );
      },
    );
  }
}
