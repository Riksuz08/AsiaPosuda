part of 'main_bloc.dart';

/// Стейты блока с логикой энтрипоинта приложения
@freezed
class MainState with _$MainState {
  const factory MainState.initial() = MainInitial;

  /// Состояние при инициализации блока
  const factory MainState.onChanged(int? index) = MainState;
}
