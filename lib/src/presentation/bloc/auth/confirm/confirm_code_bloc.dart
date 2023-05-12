import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/verify_request.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/auth/auth_repository.dart';

part 'confirm_code_state.dart';

part 'confirm_code_event.dart';

part 'confirm_code_bloc.freezed.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState> {
  final AuthRepository authRepository;

  ConfirmCodeBloc(this.authRepository) : super(const ConfirmCodeState()) {
    on<ConfirmCodeCheckMessageEvent>(_onConfirmCode);
  }

  Future<void> _onConfirmCode(ConfirmCodeCheckMessageEvent event,
      Emitter<ConfirmCodeState> emit) async {
    emit(const ConfirmCodeState.loading());
    final result = await authRepository.verifySmsCode(
      request: VerifyRequest(
        registerType: "phone",
        data: event.data,
      ),
      smsId: event.smsId,
      otp: event.otp,
    );
    result.fold(
      (l) {
        localSource.setHasProfile(true);
        emit(const ConfirmCodeSuccessState());
      },
      (r) => emit(const ConfirmCodeSuccessState()),
    );
  }
}
