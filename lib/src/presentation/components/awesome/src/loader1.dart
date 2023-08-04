import 'package:flutter/material.dart';

import 'dot.dart';

class Loader1 extends StatefulWidget {
  const Loader1({super.key, this.color});

  final Color? color;

  @override
  State<Loader1> createState() => _Loader1State();
}

class _Loader1State extends State<Loader1> with TickerProviderStateMixin {
  final double _maxValue = 20;
  late double _xValue = 0, _xValue1 = 0;
  late double _yValue = 0, _yValue1 = 0;

  late AnimationController _controller, _controller1;
  late Animation<double> _animationCircle1;
  late Animation<double> _animationCircle2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animationCircle1 = Tween<double>(begin: -1, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1, curve: Curves.ease),
      ),
    );

    _animationCircle2 = Tween<double>(begin: -1, end: 1).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: const Interval(0, 1, curve: Curves.ease),
      ),
    );

    _controller.addListener(() {
      setState(() {
        if (_controller.value >= 0.0 && _controller.value <= 1.0) {
          _xValue = _maxValue * _animationCircle1.value;
          _yValue = _xValue;
        }
      });
    });

    _controller1.addListener(
      () {
        setState(() {
          if (_controller1.value >= 0.0 && _controller1.value <= 1.0) {
            _xValue1 = _maxValue * _animationCircle2.value;
            _yValue1 = -_xValue1;
          }
        });
      },
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller1
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller1.forward();
        }
      })
      ..forward(from: 0.5);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.removeStatusListener((status) {});
    _controller1.removeStatusListener((status) {});
    _controller.dispose();
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Stack(
          children: <Widget>[
            Dot(
              radius: 20,
              color: widget.color,
            ),
            Transform.translate(
              offset: Offset(_xValue, _yValue),
              child: Dot(
                radius: 12,
                color: widget.color,
              ),
            ),
            Transform.translate(
              offset: Offset(_xValue1, _yValue1),
              child: Dot(
                radius: 12,
                color: widget.color,
              ),
            ),
          ],
        ),
      );
}
