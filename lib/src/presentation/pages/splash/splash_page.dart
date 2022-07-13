import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/routes/app_routes.dart';
import 'package:sample_bloc_mobile/src/core/utils/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await Future.delayed(
      const Duration(milliseconds: splashPageAnimationDurationInMilliseconds),
      () {
        Navigator.pushReplacementNamed(context, AppRoutes.main);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
