import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeScroll>(_onHomeScroll);
  }

  void _onHomeScroll(HomeScroll event, Emitter<HomeState> emit) {
    emit(state.copyWith(isScrollingTop: event.isScrollingTop));
  }
}
