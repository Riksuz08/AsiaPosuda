import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_bloc_mobile/src/core/mixin/cache_mixin.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/verify_request.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/auth/auth_repository.dart';

part 'confirm_code_state.dart';

part 'confirm_code_event.dart';

part 'confirm_code_bloc.freezed.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState>
    with CacheMixin {
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
        emit(const ConfirmCodeErrorState());
      },
      (r) {
        setUserInfo(
          name: r.data?["user"]["name"],
          id: r.data?["user_id"],
          login: r.data?["user"]["login"],
          email: r.data?["user"]["email"],
          phoneNumber: r.data?["user"]["phone"],
          accessToken: r.data?["token"]["access_token"],
          refreshToken: r.data?["token"]["refresh_token"],
          imageUrl: "",
        );
        emit(const ConfirmCodeSuccessState());
      },
    );
  }
}
