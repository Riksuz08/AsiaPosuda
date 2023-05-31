import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class Cards extends StatelessWidget {
  final Color? color;
  final Widget child;

  const Cards({Key? key, required this.child, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      color: color ?? context.theme.cardColor,
      surfaceTintColor: color ?? context.theme.cardColor,
      shadowColor: context.theme.shadowColor,
      type: MaterialType.card,
      borderRadius: AppUtils.kBorderRadius8,
      child: child,
    );
  }
}
