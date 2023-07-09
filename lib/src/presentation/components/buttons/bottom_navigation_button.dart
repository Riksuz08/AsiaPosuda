import 'package:flutter/material.dart';

class BottomNavigationButton extends StatelessWidget {
  const BottomNavigationButton({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: child,
      );
}
