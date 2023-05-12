part of 'confirm_code_bloc.dart';

@freezed
class ConfirmCodeEvent with _$ConfirmCodeEvent {
  /// bottom
  const factory ConfirmCodeEvent.initial() = ConfirmCodeEventInitial;

  const factory ConfirmCodeEvent.phoneChanged(String value) =
      ConfirmCodePhoneChangeEvent;

  const factory ConfirmCodeEvent.checkMessage({
    required String otp,
    required String smsId,
    required Map data,
  }) = ConfirmCodeCheckMessageEvent;
}
