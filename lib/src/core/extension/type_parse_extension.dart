part of 'extension.dart';

extension StringExtension on String {
  String get tr => AppLocalizations.instance.translate(this);
}
