part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.isScrollingTop = false,
  });

  final bool isScrollingTop;

  HomeState copyWith({
    bool? isScrollingTop,
  }) =>
      HomeState(
        isScrollingTop: isScrollingTop ?? this.isScrollingTop,
      );

  @override
  List<Object?> get props => [isScrollingTop];
}
