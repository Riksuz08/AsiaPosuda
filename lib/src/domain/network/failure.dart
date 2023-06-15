import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  final String message;
  final int? statusCode;

  ServerFailure({
    required this.message,
    this.statusCode,
  });

  @override
  List<Object?> get props => [message];
}

class NoInternetFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  final String message;

  CacheFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
