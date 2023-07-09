import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}

class ServerFailure extends Failure {
  const ServerFailure({
    required this.message,
    this.statusCode,
  });

  final String message;
  final int? statusCode;

  @override
  List<Object?> get props => [message];
}

class NoInternetFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  const CacheFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
