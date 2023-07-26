import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/core/mixin/cache_mixin.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/verify_request.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/auth/auth_repository.dart';

part 'confirm_code_state.dart';

part 'confirm_code_event.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState>
    with CacheMixin {
  ConfirmCodeBloc(this.authRepository) : super(const ConfirmInitialState()) {
    on<ConfirmCodeCheckMessageEvent>(_onConfirmCode);
  }

  final AuthRepository authRepository;

  Future<void> _onConfirmCode(ConfirmCodeCheckMessageEvent event,
      Emitter<ConfirmCodeState> emit) async {
    emit(const ConfirmCodeLoadingState());
    final result = await authRepository.verifySmsCode(
      request: VerifyRequest(
        registerType: 'phone',
        data: event.data,
      ),
      smsId: event.smsId,
      otp: event.otp,
    );
    result.fold(
      (l) {
        emit(const ConfirmCodeErrorState());
      },
      (r) {
        if (r.data?.isNotEmpty ?? false) {
          setUserInfo(
            name: r.data?['user']['name'] as String? ?? '',
            id: r.data?['user_id'] as String? ?? '',
            login: r.data?['user']['login'] as String? ?? '',
            email: r.data?['user']['email'] as String? ?? '',
            phoneNumber: r.data?['user']['phone'] as String? ?? '',
            accessToken: r.data?['token']['access_token'] as String? ?? '',
            refreshToken: r.data?['token']['refresh_token'] as String? ?? '',
            imageUrl: '',
          );
        }
        emit(
          ConfirmCodeSuccessState(
            isUserFound: r.message != 'User verified but not found',
          ),
        );
      },
    );
  }
}
