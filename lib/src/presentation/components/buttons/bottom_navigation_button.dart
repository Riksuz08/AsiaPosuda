import 'package:flutter/material.dart';

class BottomNavigationButton extends StatelessWidget {
  final Widget child;

  const BottomNavigationButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: child,
    );
  }
}
