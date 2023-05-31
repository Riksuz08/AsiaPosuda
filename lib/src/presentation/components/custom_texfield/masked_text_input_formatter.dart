import 'package:flutter/services.dart';

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;
    String newText = newValue.toJSON()['text'].toString();
    if (text.isNotEmpty) {
      if (text.length > oldValue.text.length) {
        if (text.length > mask.length) return oldValue;
        if (text.length < mask.length && mask[text.length - 1] == separator) {
          return TextEditingValue(
            text:
            '${oldValue.text}$separator${text.substring(text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
        if (text.length == mask.replaceAll(separator, '').length &&
            oldValue.text.isEmpty) {
          String newText = '';
          int t = 0;
          for (int i = 0; i < text.length; i++) {
            if (mask[i + t] == separator) {
              newText += separator;
              t++;
            }
            newText += text[i];
          }
          return TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        }
      } else {
        if (newText.substring(newText.length - 1) == separator) {
          return TextEditingValue(
            text: newValue.text.substring(0, newValue.text.length - 1),
            selection: TextSelection.collapsed(
              offset: newValue.selection.end - 1,
            ),
          );
        }
      }
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(
          offset: newValue.selection.end,
        ),
      );
    }
    return newValue;
  }
}
