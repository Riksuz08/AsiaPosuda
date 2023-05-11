import 'package:flutter/material.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color primary;
  final Color scaffoldBackground;

  const ThemeColors({
    required this.primary,
    required this.scaffoldBackground,
  });

  static const ThemeColors light = ThemeColors(
    primary: Color(0xFF6F35A5),
    scaffoldBackground: Color(0xFFF1F1F1),
  );
  static const ThemeColors dark = ThemeColors(
    primary: Color(0xFF6F35A5),
    scaffoldBackground: Color(0xFFF1F1F1),
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? primary,
    Color? scaffoldBackground,
  }) {
    return ThemeColors(
      primary: primary ?? this.primary,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
      ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      primary: Color.lerp(primary, other.primary, t)!,
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
    );
  }
}
