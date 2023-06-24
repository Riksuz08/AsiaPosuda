import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_bloc_mobile/src/core/constants/constants.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/register_user_request.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/register/register_repository.dart';

part 'register_event.dart';

part 'register_state.dart';

part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUserRepository registerUserRepository;

  RegisterBloc(this.registerUserRepository) : super(const RegisterState()) {
    on<RegisterEvent>((event, emit) {});
    on<UserRegisterEvent>(_onUserRegister);
  }

  Future<void> _onUserRegister(UserRegisterEvent event, emit) async {
    emit(const RegisterState.registerLoading());
    final result = await registerUserRepository.registerUser(
      request: _getUserRegisterRequestData(event),
    );
    result.fold(
      (left) {
        emit(RegisterState.registerError(errorMessage: ""));
      },
      (right) {
        emit(const RegisterState.registerSuccess());
      },
    );
  }

  Map<String, dynamic> _getUserRegisterRequestData(UserRegisterEvent event) {
    return {
      "data": {
        "addational_table": event.request.toJson(),
        "client_type_id": Constants.clientTypeId,
        "company_id": Constants.companyId,
        "project_id": Constants.projectId,
        "expires_at": Constants.expiresAt,
        "name": event.request.clientName,
        "phone": event.request.phoneNumber,
        "role_id": Constants.roledId,
        "active": 1,
        "type": "phone"
      }
    };
  }
}
