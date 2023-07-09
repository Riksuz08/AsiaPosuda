import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatefulWidget {
  const CustomAnimatedButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final VoidCallback onTap;

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      reverseDuration: const Duration(milliseconds: 100),
    );
    animation = Tween<double>(begin: 1, end: 0.95).animate(controller);
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTapDown: (details) {
          controller.forward();
        },
        onPanCancel: () {
          controller.reverse();
        },
        onHorizontalDragCancel: () {
          controller.reverse();
        },
        onTapUp: (details) {
          controller.reverse();
          widget.onTap();
        },
        child: ScaleTransition(
          scale: animation,
          child: widget.child,
        ),
      );
}
