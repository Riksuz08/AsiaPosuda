part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeScroll extends HomeEvent {
  const HomeScroll({
    required this.isScrollingTop,
  });

  final bool isScrollingTop;

  @override
  List<Object?> get props => [isScrollingTop];
}
