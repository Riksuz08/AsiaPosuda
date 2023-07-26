part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class _Started extends RegisterEvent {
  const _Started();

  @override
  List<Object?> get props => [];
}

class UserRegisterEvent extends RegisterEvent {
  const UserRegisterEvent({
    required this.additionalProps,
    required this.phoneNumber,
    required this.bloodGroup,
    required this.fullName,
  });

  final Map<String, dynamic> additionalProps;
  final String phoneNumber;
  final String bloodGroup;
  final String fullName;

  @override
  List<Object?> get props => [
        additionalProps,
        phoneNumber,
        bloodGroup,
        fullName,
      ];
}

class FullNameChangedEvent extends RegisterEvent {
  const FullNameChangedEvent();

  @override
  List<Object?> get props => [];
}


class BloodGroupChangedEvent extends RegisterEvent {
  const BloodGroupChangedEvent();

  @override
  List<Object?> get props => [];
}

class PhoneNumberChangedEvent extends RegisterEvent {
  const PhoneNumberChangedEvent();

  @override
  List<Object?> get props => [];
}

//
//
// @freezed
// class RegisterEvent with _$RegisterEvent {
//   const factory RegisterEvent.started() = _Started;
//
//   const factory RegisterEvent.userRegister({
//     required Map<String, dynamic> additionalProps,
//     required String phoneNumber,
//     required String bloodGroup,
//     required String fullName,
//   }) = UserRegisterEvent;
//
//   const factory RegisterEvent.onFullNameChanged() = FullNameChangedEvent;
//
//   const factory RegisterEvent.onBloodGroupChanged() = BloodGroupChangedEvent;
//
//   const factory RegisterEvent.onPhoneNumberChanged() = PhoneNumberChangedEvent;
// }
