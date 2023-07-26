import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/core/constants/constants.dart';
import 'package:sample_bloc_mobile/src/core/mixin/cache_mixin.dart';
import 'package:sample_bloc_mobile/src/domain/repositories/register/register_repository.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> with CacheMixin {
  RegisterBloc(this.registerUserRepository)
      : super(const RegisterInitialState()) {
    on<UserRegisterEvent>(_onUserRegister);
    on<PhoneNumberChangedEvent>(_onPhoneNumberChangedEvent);
    on<BloodGroupChangedEvent>(_onBloodGroupChangedEvent);
    on<FullNameChangedEvent>(_onFullNameChangedEvent);
  }

  final RegisterUserRepository registerUserRepository;

  void _onPhoneNumberChangedEvent(
      PhoneNumberChangedEvent event, Emitter<RegisterState> emit) {
    emit(const UserPhoneNumberErrorState(showError: false));
  }

  void _onBloodGroupChangedEvent(
      BloodGroupChangedEvent event, Emitter<RegisterState> emit) {
    emit(
      const UserBloodGroupErrorState(
        showError: false,
        errorMessage: 'error',
      ),
    );
  }

  void _onFullNameChangedEvent(
      FullNameChangedEvent event, Emitter<RegisterState> emit) {
    emit(
      const UserFullNameErrorState(
        showError: false,
      ),
    );
  }

  bool _areRequiredFieldValidated(
      UserRegisterEvent event, Emitter<RegisterState> emit) {
    if (event.fullName.isEmpty) {
      emit(
        const UserFullNameErrorState(
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
        const UserBloodGroupErrorState(
          showError: true,
          errorMessage: 'Blood group needed',
        ),
      );
      return false;
    }
    return true;
  }

  Future<void> _onUserRegister(
      UserRegisterEvent event, Emitter<RegisterState> emit) async {
    if (!_areRequiredFieldValidated(event, emit)) {
      return;
    }
    emit(const UserRegisterLoadingState());
    final result = await registerUserRepository.registerUser(
      request: _getUserRegisterRequestData(event),
    );
    result.fold(
      (left) {
        emit(const UserRegisterErrorState(errorMessage: ''));
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
        emit(const UserRegisterSuccessState());
      },
    );
  }

  Map<String, dynamic> _getUserRegisterRequestData(UserRegisterEvent event) => {
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
