import 'package:formz/formz.dart';

enum PhoneInputError { error }

class PhoneInput extends FormzInput<String, PhoneInputError> {
  const PhoneInput.pure() : super.pure('');

  const PhoneInput.dirty(String value) : super.dirty(value);

  @override
  PhoneInputError? validator(String value) {
    final length = value.replaceAll(' ', '').length;
    if (length == 9) {
      return null;
    } else {
      return PhoneInputError.error;
    }
  }
}
