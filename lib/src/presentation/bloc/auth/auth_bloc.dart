import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/send_message_request.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/auth/auth_repository.dart';

part 'auth_state.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(const AuthInitialState()) {
    on<AuthPhoneChangeEvent>(_onChanged);
    on<AuthCheckMessageEvent>(_onSendMessage);
  }

  final AuthRepository authRepository;

  void _onChanged(AuthPhoneChangeEvent event, Emitter<AuthState> emit) {
    if (event.value.length <= 11) {
      emit(const AuthInitialState());
      return;
    }

    emit(AuthPhoneState(event.value));
  }

  Future<void> _onSendMessage(
      AuthCheckMessageEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoadingState());

    final result = await authRepository.codeMessage(
      request: SendMessageRequest(
        clientType: 'WEB_USER',
        email: '',
        googleToken: '',
        phone: "+998${event.phone.replaceAll(" ", "")}",
        registerType: 'phone',
      ),
    );
    result.fold(
      (l) {
        emit(const AuthErrorState());
      },
      (r) {
        emit(
          AuthSuccessState(
            r.data?['sms_id'] as String? ?? '',
            "+998${event.phone.replaceAll(" ", "")}",
            event.phone,
            r.data?['data'] as Map? ?? {},
          ),
        );
      },
    );
  }
}
