part of '../auth/auth_bloc.dart';

/// Эвенты блока с логикой установки email'а
@freezed
class AuthEvent with _$AuthEvent {
  /// bottom
  const factory AuthEvent.initial() = AuthEventInitial;

  const factory AuthEvent.phoneChanged(String value) = AuthPhoneChangeEvent;

  const factory AuthEvent.checkMessage(String phone) = AuthCheckMessageEvent;
}
