import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.dart';

part 'main_event.dart';

part 'main_bloc.freezed.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState(bottomMenu: BottomMenu.home)) {
    on<MainEvent>(
      (event, emit) async {
        if (event is MainEventChanged) {
          emit(state.copyWith(bottomMenu: event.menu));
        }
      },
    );
  }
}

enum BottomMenu {
  home,
  profile,
}
