import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const CustomAnimatedButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      reverseDuration: const Duration(milliseconds: 100),
    );
    animation = Tween<double>(begin: 1, end: 0.95).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
}
