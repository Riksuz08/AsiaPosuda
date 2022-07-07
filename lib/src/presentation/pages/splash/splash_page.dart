import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/config/routes/app_routes.dart';

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
      const Duration(milliseconds: 1500),
      () {
        Navigator.pushReplacementNamed(context, AppRoutes.main);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
