import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final RouteSettings settings;

  const ErrorPage({
    Key? key,
    required this.settings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Center(
        child: Text(
          'Not found ${settings.name}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
