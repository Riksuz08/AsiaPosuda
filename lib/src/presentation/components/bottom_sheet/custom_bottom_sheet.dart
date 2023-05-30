import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

Future<T?> customCupertinoModalPopup<T>(
  BuildContext context, {
  String title = '',
  String actionTitleOne = '',
  String actionTitleTwo = '',
  required Function() actionOne,
  required Function() actionTwo,
}) async {
  return showCupertinoModalPopup(
    context: context,
    builder: (_) {
      return CupertinoActionSheet(
        title: Text(title),
        actions: [
          CupertinoActionSheetAction(
            onPressed: actionOne,
            child: Text(actionTitleOne),
          ),
          CupertinoActionSheetAction(
            onPressed: actionTwo,
            child: Text(actionTitleTwo),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    },
  );
}

typedef WidgetScrollBuilder = Widget Function(
  BuildContext context,
  ScrollController? controller,
);

Future<T?> customModalBottomSheet<T>({
  required BuildContext context,
  required WidgetScrollBuilder builder,
  bool isScrollControlled = false,
}) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: context.mediaQuery.size.height * 0.9,
      minHeight: context.mediaQuery.size.height * 0.2,
    ),
    builder: (_) {
      if (isScrollControlled) {
        return DraggableScrollableSheet(
          initialChildSize: 1,
          minChildSize: 0.5,
          expand: false,
          snap: true,
          builder: (context, controller) {
            return builder(context, controller);
          },
        );
      } else {
        return builder(context, null);
      }
    },
  );
}
