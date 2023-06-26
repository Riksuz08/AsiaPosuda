import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_bloc_mobile/src/core/constants/constants.dart';
import 'package:sample_bloc_mobile/src/core/mixin/cache_mixin.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/register/register_repository.dart';

part 'register_event.dart';

part 'register_state.dart';

part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> with CacheMixin {
  final RegisterUserRepository registerUserRepository;

  RegisterBloc(this.registerUserRepository) : super(const RegisterState()) {
    on<UserRegisterEvent>(_onUserRegister);
    on<PhoneNumberChangedEvent>(_onPhoneNumberChangedEvent);
    on<BloodGroupChangedEvent>(_onBloodGroupChangedEvent);
    on<FullNameChangedEvent>(_onFullNameChangedEvent);
  }

  void _onPhoneNumberChangedEvent(PhoneNumberChangedEvent event, emit) {
    emit(
      const RegisterState.userPhoneNumberErrorState(
        showError: false,
      ),
    );
  }

  void _onBloodGroupChangedEvent(BloodGroupChangedEvent event, emit) {
    emit(
      const RegisterState.userBloodGroupErrorState(
        showError: false,
        errorMessage: 'error',
      ),
    );
  }

  void _onFullNameChangedEvent(FullNameChangedEvent event, emit) {
    emit(
      const RegisterState.userFullNameErrorState(
        showError: false,
      ),
    );
  }

  bool _areRequiredFieldValidated(UserRegisterEvent event, emit) {
    if (event.fullName.isEmpty) {
      emit(
        const RegisterState.userFullNameErrorState(
          showError: true,
          errorMessage: 'Enter at least 1 character',
        ),
      );
      return false;
    }
    // if (event.phoneNumber.isEmpty) {
    //   emit(
    //     const RegisterState.userPhoneNumberErrorState(
    //       showError: true,
    //       errorMessage: 'Number is required',
    //     ),
    //   );
    //   return false;
    // }
    // if (event.phoneNumber.length < 12) {
    //   emit(
    //     const RegisterState.userPhoneNumberErrorState(
    //       showError: true,
    //       errorMessage: 'Enter your number correctly',
    //     ),
    //   );
    //   return false;
    // }
    if (event.bloodGroup.isEmpty) {
      emit(
        const RegisterState.userBloodGroupErrorState(
          showError: true,
          errorMessage: 'Blood group needed',
        ),
      );
      return false;
    }
    return true;
  }

  Future<void> _onUserRegister(UserRegisterEvent event, emit) async {
    if (!_areRequiredFieldValidated(event, emit)) {
      return;
    }
    emit(const RegisterState.registerLoading());
    final result = await registerUserRepository.registerUser(
      request: _getUserRegisterRequestData(event),
    );
    result.fold(
      (left) {
        emit(const RegisterState.registerError(errorMessage: ''));
      },
      (r) {
        setUserInfo(
          name: r.data?.user?.name ?? '',
          id: r.data?.userId ?? '',
          login: r.data?.user?.login ?? '',
          email: r.data?.user?.email ?? '',
          phoneNumber: r.data?.user?.phone ?? '',
          accessToken: r.data?.token?.accessToken ?? '',
          refreshToken: r.data?.token?.refreshToken ?? '',
          imageUrl: '',
        );
        emit(const RegisterState.registerSuccess());
      },
    );
  }

  Map<String, dynamic> _getUserRegisterRequestData(UserRegisterEvent event) {
    return {
      'data': {
        'addational_table': event.additionalProps,
        'client_type_id': Constants.clientTypeId,
        'company_id': Constants.companyId,
        'project_id': Constants.projectId,
        'expires_at': Constants.expiresAt,
        'name': event.additionalProps['client_name'],
        'phone': event.additionalProps['phone_number'],
        'role_id': Constants.roledId,
        'active': 1,
        'type': 'phone'
      }
    };
  }
}
