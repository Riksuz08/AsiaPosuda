part of '../main/main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    required BottomMenu bottomMenu,
  }) = _MainState;
}
