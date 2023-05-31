import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  String? cancelActionText,
  required String defaultActionText,
}) async {
  if (Platform.isAndroid) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
        shadowColor: Theme.of(context).dialogTheme.shadowColor,
        surfaceTintColor: Theme.of(context).dialogTheme.surfaceTintColor,
        title: Text(title),
        content: Text(
          content,
          style: Theme.of(context).dialogTheme.contentTextStyle,
        ),
        actions: <Widget>[
          if (cancelActionText != null)
            TextButton(
              child: Text(
                cancelActionText,
                style: Theme.of(context).dialogTheme.contentTextStyle,
              ),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          TextButton(
            child: Text(
              defaultActionText,
              style: Theme.of(context).dialogTheme.contentTextStyle,
            ),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  } else {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title, style: Theme.of(context).dialogTheme.titleTextStyle),
        content: Text(
          content,
          style: Theme.of(context).dialogTheme.contentTextStyle,
        ),
        actions: <Widget>[
          if (cancelActionText != null)
            CupertinoDialogAction(
              child: Text(cancelActionText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          CupertinoDialogAction(
            child: Text(
              defaultActionText,
              style: Theme.of(context).primaryTextTheme.bodySmall,
            ),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }
}
