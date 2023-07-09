import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';

class CardsClipRRect extends StatelessWidget {
  const CardsClipRRect({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Material(
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
