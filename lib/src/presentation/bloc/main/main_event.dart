part of 'main_bloc.dart';

/// Эвенты блока с логикой установки email'а
@freezed
class MainEvent with _$MainEvent {
  /// Сохранить email
  const factory MainEvent.onChanged(int? index) = MainEvent;
}
