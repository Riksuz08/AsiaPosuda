part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainEventChanged extends MainEvent {
  const MainEventChanged(this.menu);

  final BottomMenu menu;

  @override
  List<Object?> get props => [menu];
}
