import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).backgroundColor),
      body: const Center(
        child: Text(
          "404",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
