part of '../auth/auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.initial() = AuthEventInitial;

  const factory AuthEvent.phoneChanged(String value) = AuthPhoneChangeEvent;

  const factory AuthEvent.checkMessage(String phone) = AuthCheckMessageEvent;
}
