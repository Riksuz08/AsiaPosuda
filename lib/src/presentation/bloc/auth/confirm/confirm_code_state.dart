part of 'confirm_code_bloc.dart';

@freezed
class ConfirmCodeState with _$ConfirmCodeState {
  const factory ConfirmCodeState() = _ConfirmCodeState;

  const factory ConfirmCodeState.success() = ConfirmCodeSuccessState;

  const factory ConfirmCodeState.loading() = ConfirmCodeLaodingState;

  const factory ConfirmCodeState.phone(String phone) = ConfirmCodePhoneState;

  const factory ConfirmCodeState.error() = ConfirmCodeErrorState;
}
