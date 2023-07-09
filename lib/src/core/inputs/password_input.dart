import 'package:formz/formz.dart';

enum PasswordInputError { empty, short, long }

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.pure() : super.pure('');

  const PasswordInput.dirty(super.value) : super.dirty();

  @override
  PasswordInputError? validator(String value) {
    final length = value.replaceAll(' ', '').length;
    if (value.replaceAll(' ', '').isEmpty) {
      return PasswordInputError.empty;
    } else if (length >= 20) {
      return PasswordInputError.long;
    } else if (length <= 7) {
      return PasswordInputError.short;
    } else {
      return null;
    }
  }
}
