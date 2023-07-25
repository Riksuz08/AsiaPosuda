part of 'extension.dart';

extension BuildContextExt on BuildContext {
  String tr(String key) => AppLocalizations.of(this).translate(key);

  Locale get locale => Localizations.localeOf(this);

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  ThemeColors get color => Theme.of(this).extension<ThemeColors>()!;

  ThemeTextStyles get textStyle => Theme.of(this).extension<ThemeTextStyles>()!;
}
