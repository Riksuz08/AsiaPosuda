import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';
import 'package:sample_bloc_mobile/src/presentation/components/awesome/awesome_loader.dart';

import '../../bloc/splash/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(const SplashEvent());
  }

  @override
  Widget build(BuildContext context) => BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.isTimerFinished) {
            Navigator.pushReplacementNamed(
              context,
              Routes.main,
            );
          }
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
          child: Scaffold(
            backgroundColor: context.theme.primaryColor,
            body: Stack(
              children: [
                Positioned.fill(
                  child: Center(
                    child: Text(
                      'Logo',
                      style: context.theme.textTheme.titleLarge,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 80,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: AwesomeLoader(
                      loaderType: awesomeLoader3,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
