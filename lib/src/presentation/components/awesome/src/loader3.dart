import 'package:flutter/material.dart';

import 'dot.dart';

class Loader3 extends StatefulWidget {
  const Loader3({super.key, this.color});

  final Color? color;

  @override
  State<Loader3> createState() => _Loader3State();
}

class _Loader3State extends State<Loader3> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationRotation;
  late Animation<double> _animationRadiousOut;
  late Animation<double> _animationRadiousIn;
  final double _initialRadius = 20;
  late double _radius = 20;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1250),
    );

    _animationRadiousIn = Tween<double>(begin: 1, end: 0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.5),
      ),
    );

    _animationRadiousOut = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1),
      ),
    );

    _animationRotation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1),
      ),
    );

    _controller
      ..addListener(() {
        setState(() {
          if (_controller.value >= 0.0 && _controller.value <= 0.5) {
            _radius = _initialRadius * _animationRadiousIn.value;
          } else if (_controller.value >= 0.5 && _controller.value <= 1.0) {
            _radius = _initialRadius * _animationRadiousOut.value;
          }
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
        child: RotationTransition(
          turns: _animationRotation,
          child: SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0, _radius),
                  child: Dot(
                    color: widget.color,
                  ),
                ),
                Transform.translate(
                  offset: Offset(_radius, 0),
                  child: Dot(
                    color: widget.color,
                  ),
                ),
                Transform.translate(
                  offset: Offset(-_radius, 0),
                  child: Dot(
                    color: widget.color,
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -_radius),
                  child: Dot(
                    color: widget.color,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
