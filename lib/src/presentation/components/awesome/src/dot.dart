import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class Dot extends StatelessWidget {
  const Dot({
    super.key,
    this.radius = 10,
    this.color,
  });

  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) => Center(
        child: CircleAvatar(
          radius: radius / 2,
          backgroundColor: color ?? context.theme.primaryColor,
        ),
      );
}
