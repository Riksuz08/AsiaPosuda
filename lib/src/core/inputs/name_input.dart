import 'package:formz/formz.dart';

enum NameInputError { empty, short, long }

class NameInput extends FormzInput<String, NameInputError> {
  const NameInput.pure() : super.pure('');

  const NameInput.dirty(super.value) : super.dirty();

  @override
  NameInputError? validator(String value) {
    final length = value.replaceAll(' ', '').length;
    if (value.isEmpty) {
      return NameInputError.empty;
    } else if (length >= 20) {
      return NameInputError.long;
    } else if (length <= 2) {
      return NameInputError.short;
    } else {
      return null;
    }
  }
}
