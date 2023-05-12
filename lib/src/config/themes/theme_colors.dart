import 'package:flutter/material.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color primary;
  final Color scaffoldBackground;
  final Color secondary;
  final Color error;
  final Color surface;
  final Color white;

  const ThemeColors({
    required this.primary,
    required this.scaffoldBackground,
    this.secondary = Colors.black,
    this.error = Colors.red,
    this.surface = Colors.white,
    this.white = Colors.white,
  });

  static const ThemeColors light = ThemeColors(
    primary: Color(0xFF0FB8D3),
    scaffoldBackground: Color(0xFFF7F9FC),
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
