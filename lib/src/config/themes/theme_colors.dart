part of 'themes.dart';

/// A set of colors for the entire app.
const colorLightScheme = ColorScheme.light(
  primary: Color(0xff22B99A),
  surface: Color(0xFFF7F9FC),
  onSurface: Color(0xFF020000),
  secondary: Color(0xFF69D7C7),
  onSecondary: Color(0xFF020000),
  error: Color(0xFFD93F2F),
  background: Color(0xFFF7F5F6),
  onBackground: Color(0xFF020000),
);

///
const colorDarkScheme = ColorScheme.dark(
  primary: Color(0xFF0FB8D3),
  surface: Color(0xFFF7F9FC),
  secondary: Color(0xFF69D7C7),
  error: Color(0xFFD93F2F),
  background: Color(0xFFF7F5F6),
  onBackground: Color(0xFF020000),
);

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.cardColor,
  });

  final Color cardColor;

    static const ThemeColors light = ThemeColors(
    cardColor: Colors.white,
  );
  static const ThemeColors dark = ThemeColors(
    cardColor: Color(0xFF1E1E1E),
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? cardColor,
  }) =>
      ThemeColors(
        cardColor: cardColor ?? this.cardColor,
      );

  @override
  ThemeExtension<ThemeColors> lerp(
      ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
    );
  }
}
