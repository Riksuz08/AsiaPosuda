
part of 'extension.dart';
extension BuildContextExt on BuildContext {
  String translate(String key) => AppLocalizations.of(this).translate(key);

  Locale get locale => Localizations.localeOf(this);

  ThemeData get theme => Theme.of(this);

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  ThemeColors get color => Theme.of(this).extension<ThemeColors>()!;

  AppTextStyles get textStyle => Theme.of(this).extension<AppTextStyles>()!;
}
