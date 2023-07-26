part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitialState extends RegisterState {
  const RegisterInitialState();

  @override
  List<Object?> get props => [];
}

class UserFullNameErrorState extends RegisterState {
  const UserFullNameErrorState({
    required this.showError,
    this.errorMessage,
  });

  final bool showError;
  final String? errorMessage;

  @override
  List<Object?> get props => [showError, errorMessage];
}

class UserPhoneNumberErrorState extends RegisterState {
  const UserPhoneNumberErrorState({
    required this.showError,
    this.errorMessage,
  });

  final bool showError;
  final String? errorMessage;

  @override
  List<Object?> get props => [showError, errorMessage];
}

class UserBloodGroupErrorState extends RegisterState {
  const UserBloodGroupErrorState({
    required this.showError,
    this.errorMessage,
  });

  final bool showError;
  final String? errorMessage;

  @override
  List<Object?> get props => [showError, errorMessage];
}

class UserRegisterLoadingState extends RegisterState {
  const UserRegisterLoadingState();

  @override
  List<Object?> get props => [];
}

class UserRegisterErrorState extends RegisterState {
  const UserRegisterErrorState({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

class UserRegisterSuccessState extends RegisterState {
  const UserRegisterSuccessState();

  @override
  List<Object?> get props => [];
}
//
//
//
// @freezed
// class RegisterState with _$RegisterState {
//   const factory RegisterState() = _RegisterState;
//
//   const factory RegisterState.userFullNameErrorState({
//     required bool showError,
//     String? errorMessage,
//   }) = UserFullNameErrorState;
//
//   const factory RegisterState.userPhoneNumberErrorState({
//     required bool showError,
//     String? errorMessage,
//   }) = UserPhoneNumberErrorState;
//
//   const factory RegisterState.userBloodGroupErrorState({
//     required bool showError,
//     String? errorMessage,
//   }) = UserBloodGroupErrorState;
//
//   const factory RegisterState.registerLoading() = UserRegisterLoadingState;
//
//   const factory RegisterState.registerError({
//     required String errorMessage,
//   }) = UserRegisterErrorState;
//
//   const factory RegisterState.registerSuccess() = UserRegisterSuccessState;
// }
