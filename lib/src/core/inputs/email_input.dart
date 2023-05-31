import 'package:formz/formz.dart';

enum EmailInputError { empty, notEmail }

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');

  const EmailInput.dirty(String value) : super.dirty(value);

  @override
  EmailInputError? validator(String value) {
    final isEmailRegEx = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (value.isEmpty) {
      return EmailInputError.empty;
    } else if (!isEmailRegEx.hasMatch(value)) {
      return EmailInputError.notEmail;
    } else {
      return null;
    }
  }
}
