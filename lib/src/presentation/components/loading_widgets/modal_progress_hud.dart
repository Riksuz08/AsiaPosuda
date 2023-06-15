library modal_progress_hud;

import 'package:flutter/material.dart';

class ModalProgressHUD extends StatelessWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final Offset? offset;
  final bool dismissible;
  final Widget child;

  const ModalProgressHUD({
    Key? key,
    this.inAsyncCall = false,
    this.opacity = 0.3,
    this.color = Colors.transparent,
    this.progressIndicator = const CircularProgressIndicator.adaptive(),
    this.offset,
    this.dismissible = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        if (inAsyncCall)
          Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: dismissible, color: color),
          ),
        if (inAsyncCall) Center(child: progressIndicator),
      ],
    );
  }
}
