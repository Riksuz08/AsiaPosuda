part of '../main/main_bloc.dart';

/// Стейты блока с логикой энтрипоинта приложения
@freezed
class MainState with _$MainState {
  const factory MainState({
    required BottomMenu bottomMenu,
  }) = _MainState;
}
