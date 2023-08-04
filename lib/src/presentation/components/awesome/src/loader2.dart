import 'package:flutter/material.dart';

class Loader2 extends StatefulWidget {
  const Loader2({super.key, this.color});

  final Color? color;

  @override
  State<Loader2> createState() => _Loader2State();
}

class _Loader2State extends State<Loader2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _lengthAnimation;
  late Animation<double> _lengthAnimation1;
  late Animation<double> _offsetAnimation;
  late double _length = 10;
  late double offset1 = 30;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 500),
    );

    _lengthAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.75, curve: Curves.easeOut),
      ),
    );
    _lengthAnimation1 = Tween<double>(begin: 10, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1, curve: Curves.easeOut),
      ),
    );

    _offsetAnimation = Tween<double>(begin: 30, end: 50).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 1, curve: Curves.easeIn),
      ),
    );

    _controller
      ..addListener(() {
        setState(() {
          offset1 = _offsetAnimation.value;
          if (_controller.value < 0.75) {
            _length = _lengthAnimation.value;
          } else {
            _length = _lengthAnimation1.value;
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
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: offset1,
              child: Line(
                width: 5,
                height: _length,
                color: widget.color,
              ),
            ),
            Positioned(
              bottom: offset1,
              child: Line(
                width: 5,
                height: _length,
                color: widget.color,
              ),
            ),
            Positioned(
              left: offset1,
              child: Line(
                width: _length,
                height: 5,
                color: widget.color,
              ),
            ),
            Positioned(
              right: offset1,
              child: Line(
                width: _length,
                height: 5,
                color: widget.color,
              ),
            )
          ],
        ),
      );
}

class Line extends StatelessWidget {
  const Line({super.key, this.width, this.height, this.color});

  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
      );
}
