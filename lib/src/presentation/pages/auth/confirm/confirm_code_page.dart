import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/config/themes/app_utils.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/confirm/confirm_code_bloc.dart';

class ConfirmCodePage extends StatefulWidget {
  final AuthSuccessState state;

  const ConfirmCodePage({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  State<ConfirmCodePage> createState() => _ConfirmCodePageState();
}

class _ConfirmCodePageState extends State<ConfirmCodePage> {
  late PinTheme defaultPinTheme;
  late PinTheme focusedPinTheme;
  late PinTheme submittedPinTheme;
  late final TextEditingController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = TextEditingController();
    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Colors.white,
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(10),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfirmCodeBloc, ConfirmCodeState>(
      listener: (_, state) {
        if (state is ConfirmCodeSuccessState) {
          Navigator.popUntil(
            context,
            (route) => route.isFirst,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Confirm code")),
        body: Center(
          child: Pinput(
            length: 6,
            autofocus: true,
            controller: controller,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            validator: (s) {
              return s == '2222' ? null : 'Pin is incorrect';
            },
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
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
                child: const Text("Продолжить"),
              );
            },
          ),
        ),
      ),
    );
  }
}
