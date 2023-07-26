part of 'confirm_code_bloc.dart';

abstract class ConfirmCodeEvent extends Equatable {
  const ConfirmCodeEvent();
}

class ConfirmCodeEventInitial extends ConfirmCodeEvent {
  const ConfirmCodeEventInitial();

  @override
  List<Object?> get props => [];
}

class ConfirmCodePhoneChangeEvent extends ConfirmCodeEvent {
  const ConfirmCodePhoneChangeEvent(this.value);

  final String value;

  @override
  List<Object?> get props => [value];
}

class ConfirmCodeCheckMessageEvent extends ConfirmCodeEvent {
  const ConfirmCodeCheckMessageEvent({
    required this.otp,
    required this.smsId,
    required this.data,
  });

  final String otp;
  final String smsId;
  final Map data;

  @override
  List<Object?> get props => [otp, smsId, data];
}
