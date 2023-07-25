part of 'main_bloc.dart';

class MainState extends Equatable {
  const MainState({
    this.bottomMenu = BottomMenu.search,
  });

  final BottomMenu bottomMenu;

  MainState copyWith({
    BottomMenu? bottomMenu,
  }) =>
      MainState(
        bottomMenu: bottomMenu ?? this.bottomMenu,
      );

  @override
  List<Object?> get props => [bottomMenu];
}
