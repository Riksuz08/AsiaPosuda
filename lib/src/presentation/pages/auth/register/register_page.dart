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
          appBar: AppBar(
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight - 12),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Создать аккаунт'),
                ),
              ),
            ),
          ),
          body: SafeArea(
            minimum: AppUtils.kPaddingAll16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppUtils.kBoxHeight4,
                CustomTextField(
                  haveBorder: false,
                  fillColor: const Color(0xFFEDEFF2),
                  filled: true,
                  onChanged: (value) {
                    _bloc.add(const FullNameChangedEvent());
                  },
                  errorText: state is UserFullNameErrorState
                      ? state.errorMessage
                      : null,
                  showError: state is UserFullNameErrorState && state.showError,
                  controller: _fullNameController,
                  hintText: 'Имя',
                ),
                AppUtils.kBoxHeight14,
                CustomTextField(
                  haveBorder: false,
                  fillColor: const Color(0xFFEDEFF2),
                  filled: true,
                  onChanged: (value) {
                    // _bloc.add(const FullNameChangedEvent());
                  },
                  // errorText: state is UserFullNameErrorState
                  //     ? state.errorMessage
                  //     : null,
                  // showError: state is UserFullNameErrorState && state.showError,
                  controller: TextEditingController(),
                  hintText: 'Домашний адрес',
                ),
                AppUtils.kBoxHeight14,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        haveBorder: false,
                        fillColor: const Color(0xFFEDEFF2),
                        filled: true,
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
                        haveBorder: false,
                        fillColor: Color(0xFFEDEFF2),
                        filled: true,
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
