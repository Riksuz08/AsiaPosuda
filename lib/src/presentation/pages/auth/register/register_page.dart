import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/config/themes/themes.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/register_user_request.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/register/register_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/main/main_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/components/custom_texfield/custom_text_field.dart';

part 'package:sample_bloc_mobile/src/presentation/pages/auth/register/mixin/register_mixin.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({
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
          context.read<MainBloc>().add(MainEventChanged(BottomMenu.search));
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppUtils.kBoxHeight20,
                Padding(
                  padding: AppUtils.kPaddingHorizontal12,
                  child: Text("Создать аккаунт"),
                ),
                AppUtils.kBoxHeight20,
                CustomTextField(
                  onChanged: (value) {
                    _bloc.add(FullNameChangedEvent());
                  },
                  errorText: state is UserFullNameErrorState
                      ? state.errorMessage
                      : null,
                  showError:
                      state is UserFullNameErrorState ? state.showError : false,
                  controller: _fullNameController,
                  textFieldPadding: AppUtils.kPaddingHorizontal12,
                  hintText: "ФИО",
                ),
                AppUtils.kBoxHeight14,
                CustomTextField(
                  inputFormatters: [
                    MaskTextInputFormatter(
                      mask: '+998 (##) ### ## ##',
                    )
                  ],
                  onChanged: (value) {
                    _bloc.add(PhoneNumberChangedEvent());
                  },
                  errorText: state is UserPhoneNumberErrorState
                      ? state.errorMessage
                      : null,
                  showError: state is UserPhoneNumberErrorState
                      ? state.showError
                      : false,
                  controller: _phoneNumberController,
                  textFieldPadding: AppUtils.kPaddingHorizontal12,
                  hintText: "Номер телефона",
                ),
                AppUtils.kBoxHeight14,
                Padding(
                  padding: AppUtils.kPaddingHorizontal12,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: _bloodGroupController,
                          onChanged: (value) {
                            _bloc.add(BloodGroupChangedEvent());
                          },
                          errorText: state is UserBloodGroupErrorState
                              ? state.errorMessage
                              : null,
                          showError: state is UserBloodGroupErrorState
                              ? state.showError
                              : false,
                          hintText: "Группа крови",
                        ),
                      ),
                      AppUtils.kBoxWidth8,
                      Expanded(
                        child: CustomTextField(
                          hintText: "Дата рождения",
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            minimum: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: AppUtils.kPaddingHorizontal16,
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _registerUser,
                  child: Text("Продолжить"),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
