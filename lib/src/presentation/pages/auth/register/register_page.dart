import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/config/themes/themes.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/register/register_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/main_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/components/custom_texfield/custom_phone_text_field.dart';
import 'package:sample_bloc_mobile/src/presentation/components/custom_texfield/custom_text_field.dart';
import 'package:sample_bloc_mobile/src/presentation/components/custom_texfield/masked_text_input_formatter.dart';

part 'package:sample_bloc_mobile/src/presentation/pages/auth/register/mixin/register_mixin.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with RegisterMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      bloc: _bloc,
      listener: (_, state) {
        if (state is UserRegisterSuccessState) {
          localSource.setHasProfile(true);
          context
              .read<MainBloc>()
              .add(const MainEventChanged(BottomMenu.search));
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.main,
            (route) => route.isFirst,
          );
        }
      },
      builder: (_, state) {
        return Scaffold(
          backgroundColor: colorLightScheme.background,
          appBar: AppBar(),
          body: SafeArea(
            minimum: AppUtils.kPaddingAll16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppUtils.kBoxHeight20,
                const Text('Создать аккаунт'),
                AppUtils.kBoxHeight20,
                CustomTextField(
                  onChanged: (value) {
                    _bloc.add(const FullNameChangedEvent());
                  },
                  errorText: state is UserFullNameErrorState
                      ? state.errorMessage
                      : null,
                  showError: state is UserFullNameErrorState && state.showError,
                  controller: _fullNameController,
                  hintText: 'ФИО',
                ),
                AppUtils.kBoxHeight14,
                CustomPhoneTextField(
                  inputFormatters: [
                    MaskedTextInputFormatter(
                      mask: '## ### ## ##',
                      separator: ' ',
                      filter: RegExp('[0-9]'),
                    ),
                  ],
                  onChanged: (value) {
                    _bloc.add(const PhoneNumberChangedEvent());
                  },
                  errorText: state is UserPhoneNumberErrorState
                      ? state.errorMessage
                      : null,
                  showError:
                      state is UserPhoneNumberErrorState && state.showError,
                  controller: _phoneNumberController,
                  hintText: 'Номер телефона',
                ),
                AppUtils.kBoxHeight14,
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _bloodGroupController,
                        onChanged: (value) {
                          _bloc.add(const BloodGroupChangedEvent());
                        },
                        errorText: state is UserBloodGroupErrorState
                            ? state.errorMessage
                            : null,
                        showError: state is UserBloodGroupErrorState &&
                            state.showError,
                        hintText: 'Группа крови',
                      ),
                    ),
                    AppUtils.kBoxWidth8,
                    const Expanded(
                      child: CustomTextField(
                        hintText: 'Дата рождения',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            minimum: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ElevatedButton(
              onPressed: _registerUser,
              child: const Text('Продолжить'),
            ),
          ),
        );
      },
    );
  }
}
