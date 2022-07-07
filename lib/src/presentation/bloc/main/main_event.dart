part of 'main_bloc.dart';

/// Эвенты блока с логикой установки email'а
@freezed
class MainEvent with _$MainEvent {
  /// bottom
  const factory MainEvent.onChanged(BottomMenu menu) = MainEventChanged;
}
