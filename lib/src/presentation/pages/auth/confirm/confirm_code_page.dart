import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/confirm/confirm_code_bloc.dart';

part 'mixin/confirm_code_mixin.dart';

class ConfirmCodePage extends StatefulWidget {
  final AuthSuccessState state;

  const ConfirmCodePage({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  State<ConfirmCodePage> createState() => _ConfirmCodePageState();
}

class _ConfirmCodePageState extends State<ConfirmCodePage>
    with ConfirmCodeMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfirmCodeBloc, ConfirmCodeState>(
      listener: (_, state) {
        if (state is ConfirmCodeSuccessState) {
          // if (state.isUserFound) {
          //   localSource.setHasProfile(true);
          //   Navigator.popUntil(
          //     context,
          //     (route) => route.isFirst,
          //   );
          //   return;
          // }
          Navigator.pushNamed(
            context,
            Routes.register,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Confirm code')),
        body: Center(
          child: Pinput(
            length: 6,
            autofocus: true,
            controller: controller,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            onCompleted: (pin) {
              if (pin.length == 6) {
                context.read<ConfirmCodeBloc>().add(
                      ConfirmCodeCheckMessageEvent(
                        smsId: widget.state.smsId,
                        otp: pin,
                        data: widget.state.data,
                      ),
                    );
              }
            },
          ),
        ),
        bottomNavigationBar: SafeArea(
          minimum: AppUtils.kPaddingAll16.copyWith(
            bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BlocBuilder<ConfirmCodeBloc, ConfirmCodeState>(
            buildWhen: (previous, current) =>
                previous is AuthPhoneState != current is AuthPhoneState,
            builder: (_, state) {
              return ElevatedButton(
                onPressed: state is AuthPhoneState
                    ? () {
                        context.read<ConfirmCodeBloc>().add(
                              ConfirmCodeCheckMessageEvent(
                                smsId: widget.state.smsId,
                                otp: controller.text,
                                data: widget.state.data,
                              ),
                            );
                      }
                    : null,
                child: const Text('Продолжить'),
              );
            },
          ),
        ),
      ),
    );
  }
}
