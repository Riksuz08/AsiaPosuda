import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/utils/utils.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/bloc/auth/confirm/confirm_code_bloc.dart';
import 'package:sample_bloc_mobile/src/presentation/components/buttons/bottom_navigation_button.dart';

part 'mixin/confirm_code_mixin.dart';

class ConfirmCodePage extends StatefulWidget {
  const ConfirmCodePage({
    super.key,
    required this.state,
  });

  final AuthSuccessState state;

  @override
  State<ConfirmCodePage> createState() => _ConfirmCodePageState();
}

class _ConfirmCodePageState extends State<ConfirmCodePage>
    with ConfirmCodeMixin {
  @override
  Widget build(BuildContext context) =>
      BlocListener<ConfirmCodeBloc, ConfirmCodeState>(
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
          appBar: AppBar(
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight + 32),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Введите код подтверждения'),
                    AppUtils.kGap8,
                    Text(
                      'Мы отправили вам 4-значный код подтверждения',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFA4A4A4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              AppUtils.kGap16,
              Center(
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
              )
            ],
          ),
          bottomNavigationBar: BlocBuilder<ConfirmCodeBloc, ConfirmCodeState>(
            buildWhen: (previous, current) =>
                previous is AuthPhoneState != current is AuthPhoneState,
            builder: (_, state) => BottomNavigationButton(
              child: ElevatedButton(
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
              ),
            ),
          ),
        ),
      );
}
