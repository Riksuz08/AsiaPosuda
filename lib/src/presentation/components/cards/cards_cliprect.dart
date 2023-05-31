import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class CardsClipRRect extends StatelessWidget {
  final Widget child;

  const CardsClipRRect({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      color: context.theme.cardColor,
      surfaceTintColor: context.theme.cardColor,
      shadowColor: context.theme.shadowColor,
      type: MaterialType.card,
      borderRadius: AppUtils.kBorderRadius8,
      child: ClipRRect(
        borderRadius: AppUtils.kBorderRadius8,
        child: child,
      ),
    );
  }
}
