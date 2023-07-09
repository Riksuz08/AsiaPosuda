import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';

void show(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: AppUtils.kPaddingAll16,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: context.theme.colorScheme.primary,
      clipBehavior: Clip.antiAlias,
      dismissDirection: DismissDirection.none,
      content: Text(message),
    ),
  );
}
