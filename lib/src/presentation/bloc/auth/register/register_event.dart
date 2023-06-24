part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;

  const factory RegisterEvent.userRegister({
    required Map<String, dynamic> additionalProps,
    required String phoneNumber,
    required String bloodGroup,
    required String fullName,
  }) = UserRegisterEvent;

  const factory RegisterEvent.onFullNameChanged() = FullNameChangedEvent;

  const factory RegisterEvent.onBloodGroupChanged() = BloodGroupChangedEvent;

  const factory RegisterEvent.onPhoneNumberChanged() = PhoneNumberChangedEvent;
}
