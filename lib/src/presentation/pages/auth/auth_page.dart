import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/components/custom_texfield/masked_text_input_formatter.dart';
import 'package:sample_bloc_mobile/src/presentation/components/loading_widgets/modal_progress_hud.dart';

part 'mixin/auth_mixin.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with AuthMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (_, state) {
        if (state is AuthSuccessState) {
          Navigator.of(context).pushNamed(
            Routes.confirmCode,
            arguments: state,
          );
        }
      },
      child: Scaffold(
        backgroundColor: context.color.cardColor,
        appBar: AppBar(
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: AppUtils.kPaddingHor16Ver12,
                child: Text('Your phone number'),
              ),
            ),
          ),
        ),
        body: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) =>
              previous is AuthLaodingState != current is AuthLaodingState,
          builder: (_, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AuthLaodingState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppUtils.kGap24,
                  const Padding(
                    padding: AppUtils.kPaddingHorizontal16,
                    child: Text(
                      'We will send a verification code to your number',
                    ),
                  ),
                  AppUtils.kGap40,
                  const Padding(
                    padding: AppUtils.kPaddingHorizontal16,
                    child: Text('Phone number'),
                  ),
                  AppUtils.kGap6,
                  Padding(
                    padding: AppUtils.kPaddingHorizontal16,
                    child: TextField(
                      autofocus: true,
                      controller: controller,
                      style: Theme.of(context).textTheme.titleMedium,
                      inputFormatters: [
                        MaskedTextInputFormatter(
                          mask: '## ### ## ##',
                          separator: ' ',
                          filter: RegExp('[0-9]'),
                        ),
                        FilteringTextInputFormatter.allow(
                          RegExp('[0-9]'),
                          replacementString: ' ',
                        ),
                      ],
                      decoration: InputDecoration(
                        prefixText: '+998 ',
                        prefixStyle: Theme.of(context).textTheme.titleMedium,
                      ),
                      onChanged: (value) {
                        context.read<AuthBloc>().add(
                              AuthPhoneChangeEvent(value),
                            );
                      },
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: SafeArea(
          minimum: AppUtils.kPaddingAll16.copyWith(
            bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (previous, current) =>
                previous is AuthPhoneState != current is AuthPhoneState,
            builder: (_, state) {
              return ElevatedButton(
                onPressed: state is AuthPhoneState
                    ? () {
                        context
                            .read<AuthBloc>()
                            .add(AuthCheckMessageEvent(controller.text));
                      }
                    : null,
                child: const Text('Verify phone number'),
              );
            },
          ),
        ),
      ),
    );
  }
}
