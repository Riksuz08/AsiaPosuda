part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitialState extends AuthState {
  const AuthInitialState();

  @override
  List<Object?> get props => [];
}

class AuthSuccessState extends AuthState {
  const AuthSuccessState(
    this.smsId,
    this.phone,
    this.uiPhone,
    this.data,
  );

  final String smsId;
  final String phone;
  final String uiPhone;
  final Map data;

  @override
  List<Object?> get props => [smsId, phone, uiPhone, data];
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();

  @override
  List<Object?> get props => [];
}

class AuthPhoneState extends AuthState {
  const AuthPhoneState(this.phone);

  final String phone;

  @override
  List<Object?> get props => [phone];
}

class AuthErrorState extends AuthState {
  const AuthErrorState();

  @override
  List<Object?> get props => [];
}
