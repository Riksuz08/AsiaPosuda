import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/config/themes/themes.dart';
import 'package:sample_bloc_mobile/src/data/models/auth/register/register_user_request.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/register/register_bloc.dart';
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
        state.when(
          () => null,
          registerLoading: () {},
          registerError: (String errorMessage) {},
          registerSuccess: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.main,
              (route) => route.isFirst,
            );
          },
          userFullNameErrorState: (String errorMessage) {},
          userPhoneNumberErrorState: (String errorMessage) {},
          userBloodGroupErrorState: (String errorMessage) {},
        );
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
                  showError: state is UserFullNameErrorState,
                  controller: _fullNameController,
                  textFieldPadding: AppUtils.kPaddingHorizontal12,
                  hintText: "ФИО",
                ),
                AppUtils.kBoxHeight14,
                CustomTextField(
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
                  onPressed: () {
                    _bloc.add(
                      RegisterEvent.userRegister(
                        request: RegisterUserRequest(
                          clientName: "Asadbek easy",
                          phoneNumber: "998650109",
                          bloodGroup: '1',
                          adres: "test",
                          pasport: "asd",
                          fcmToken: "",
                          cleintLastname: "Bakhodirov",
                          cleintLang: "",
                          userId: 13,
                        ),
                      ),
                    );
                  },
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
