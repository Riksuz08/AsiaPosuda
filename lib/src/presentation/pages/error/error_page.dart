import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.settings,
  });

  final RouteSettings settings;

  @override
  Widget build(BuildContext context) => Scaffold(
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
