part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState() = _RegisterState;

  const factory RegisterState.userFullNameErrorState({
    required bool showError,
    String? errorMessage,
  }) = UserFullNameErrorState;

  const factory RegisterState.userPhoneNumberErrorState({
    required bool showError,
    String? errorMessage,
  }) = UserPhoneNumberErrorState;

  const factory RegisterState.userBloodGroupErrorState({
    required bool showError,
    String? errorMessage,
  }) = UserBloodGroupErrorState;

  const factory RegisterState.registerLoading() = UserRegisterLoadingState;

  const factory RegisterState.registerError({
    required String errorMessage,
  }) = UserRegisterErrorState;

  const factory RegisterState.registerSuccess() = UserRegisterSuccessState;
}
