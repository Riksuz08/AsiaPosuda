import 'package:flutter/material.dart';

import 'dot.dart';

class Loader4 extends StatefulWidget {
  const Loader4({super.key, this.color});

  final Color? color;

  @override
  State<Loader4> createState() => _Loader4State();
}

class _Loader4State extends State<Loader4> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _movement;
  late double yAxis = 0;
  final double _maxHeight = 10;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );

    _movement = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: -1, end: 1)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: -1)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 50,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1),
      ),
    );

    _controller
      ..addListener(() {
        setState(() {
          yAxis = _movement.value * _maxHeight;
        });
      })
      ..repeat();
  }

  @override
  void dispose() {
    _controller
      ..removeListener(() {})
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(-20, yAxis),
              child: Dot(
                color: widget.color,
              ),
            ),
            Transform.translate(
              offset: Offset(0, -yAxis),
              child: Dot(
                color: widget.color,
              ),
            ),
            Transform.translate(
              offset: Offset(20, yAxis),
              child: Dot(
                color: widget.color,
              ),
            ),
          ],
        ),
      );
}
