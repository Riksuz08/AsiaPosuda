part of 'splash_bloc.dart';

class SplashState extends Equatable {
  final bool isTimerFinished;

  const SplashState({this.isTimerFinished = false});

  @override
  List<Object?> get props => [isTimerFinished];
}
