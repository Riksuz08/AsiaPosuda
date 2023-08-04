import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/constants/constants.dart';

class FadeIndexedStack extends StatefulWidget {
  /// Creates An Indexed Stack with Fade Animation.
  const FadeIndexedStack({
    super.key,
    this.children = const [],
    this.sizing = StackFit.loose,
    this.alignment = AlignmentDirectional.topStart,
    this.index = 0,
    this.textDirection,
    this.duration = animationDuration,
    this.beginOpacity = 0,
    this.endOpacity = 1,
    this.curve = Curves.easeInOut,
  });

  /// the sizing of the children within the IndexedStack.
  final StackFit sizing;

  /// The alignment of the children within the IndexedStack.
  final AlignmentGeometry alignment;

  /// The text direction of the IndexedStack.
  final TextDirection? textDirection;

  /// THe Children Of The IndexedStack
  final List<Widget> children;

  /// The index of the child to show.
  final int? index;

  /// The animation duration.
  final Duration duration;

  /// The Initial Fade Opacity Animation Value.
  final double beginOpacity;

  /// The End Fade Opacity Animation Value
  final double endOpacity;

  /// The Animation Curve
  final Curve curve;

  @override
  State<FadeIndexedStack> createState() => FadeIndexedStackState();
}

class FadeIndexedStackState extends State<FadeIndexedStack>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _controller = _createAnimationController();
    _tween = _createTween();
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant FadeIndexedStack oldWidget) {
    final didBeginOpacityChanged =
        oldWidget.beginOpacity != widget.beginOpacity;
    final didEndOpacityChanged = oldWidget.endOpacity != widget.endOpacity;
    final didOpacityChanged = didEndOpacityChanged || didBeginOpacityChanged;
    final didCurveChanged = oldWidget.curve != widget.curve;
    final didIndexChanged = oldWidget.index != widget.index;

    if (didOpacityChanged || didCurveChanged || didIndexChanged) {
      _tween = _createTween();
      _controller
        ..reset()
        ..forward();
      super.didUpdateWidget(oldWidget);
    }
  }

  Tween<double> _createTween() {
    final tween =
        Tween<double>(begin: widget.beginOpacity, end: widget.endOpacity)
          ..chain(
            CurveTween(curve: widget.curve),
          );
    return tween;
  }

  AnimationController _createAnimationController() => AnimationController(
        vsync: this,
        duration: widget.duration,
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: _controller.drive(_tween),
        child: IndexedStack(
          index: widget.index,
          textDirection: widget.textDirection,
          sizing: widget.sizing,
          alignment: widget.alignment,
          children: widget.children,
        ),
      );
}
