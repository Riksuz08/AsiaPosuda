import 'package:flutter/material.dart';

class HorizontalLine extends CustomPainter {
  const HorizontalLine();

  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path()
      ..moveTo(size.width * 0.1812500, size.height * 0.5000000)
      ..cubicTo(
          size.width * 0.1812500,
          size.height * 0.7761500,
          size.width * 0.1420762,
          size.height,
          size.width * 0.09375000,
          size.height)
      ..cubicTo(
          size.width * 0.04542375,
          size.height,
          size.width * 0.006250000,
          size.height * 0.7761500,
          size.width * 0.006250000,
          size.height * 0.5000000)
      ..cubicTo(size.width * 0.006250000, size.height * 0.2238500,
          size.width * 0.04542375, 0, size.width * 0.09375000, 0)
      ..cubicTo(
          size.width * 0.1420762,
          0,
          size.width * 0.1812500,
          size.height * 0.2238500,
          size.width * 0.1812500,
          size.height * 0.5000000)
      ..close()
      ..moveTo(size.width * 0.1287500, size.height * 0.5000000)
      ..cubicTo(
          size.width * 0.1287500,
          size.height * 0.4469564,
          size.width * 0.1250625,
          size.height * 0.3960857,
          size.width * 0.1184988,
          size.height * 0.3585786)
      ..cubicTo(
          size.width * 0.1119350,
          size.height * 0.3210714,
          size.width * 0.1030326,
          size.height * 0.3000000,
          size.width * 0.09375000,
          size.height * 0.3000000)
      ..cubicTo(
          size.width * 0.08446737,
          size.height * 0.3000000,
          size.width * 0.07556500,
          size.height * 0.3210714,
          size.width * 0.06900125,
          size.height * 0.3585786)
      ..cubicTo(
          size.width * 0.06243750,
          size.height * 0.3960857,
          size.width * 0.05875000,
          size.height * 0.4469564,
          size.width * 0.05875000,
          size.height * 0.5000000)
      ..cubicTo(
          size.width * 0.05875000,
          size.height * 0.5530436,
          size.width * 0.06243750,
          size.height * 0.6039143,
          size.width * 0.06900125,
          size.height * 0.6414214)
      ..cubicTo(
          size.width * 0.07556500,
          size.height * 0.6789286,
          size.width * 0.08446737,
          size.height * 0.7000000,
          size.width * 0.09375000,
          size.height * 0.7000000)
      ..cubicTo(
          size.width * 0.1030326,
          size.height * 0.7000000,
          size.width * 0.1119350,
          size.height * 0.6789286,
          size.width * 0.1184988,
          size.height * 0.6414214)
      ..cubicTo(
          size.width * 0.1250625,
          size.height * 0.6039143,
          size.width * 0.1287500,
          size.height * 0.5530436,
          size.width * 0.1287500,
          size.height * 0.5000000)
      ..close();

    final Paint paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xffDDE1E4);
    canvas.drawPath(path_0, paint0Fill);

    final Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01875000
      ..color = const Color(0xffDDE1E4);
    canvas.drawLine(Offset(size.width * 0.1812500, size.height * 0.4464286),
        Offset(size.width * 0.8187500, size.height * 0.4464286), paint1Stroke);

    final Path path_2 = Path()
      ..moveTo(size.width * 0.9937500, size.height * 0.5000000)
      ..cubicTo(
          size.width * 0.9937500,
          size.height * 0.7761500,
          size.width * 0.9545763,
          size.height,
          size.width * 0.9062500,
          size.height)
      ..cubicTo(
          size.width * 0.8579237,
          size.height,
          size.width * 0.8187500,
          size.height * 0.7761500,
          size.width * 0.8187500,
          size.height * 0.5000000)
      ..cubicTo(size.width * 0.8187500, size.height * 0.2238500,
          size.width * 0.8579237, 0, size.width * 0.9062500, 0)
      ..cubicTo(
          size.width * 0.9545763,
          0,
          size.width * 0.9937500,
          size.height * 0.2238500,
          size.width * 0.9937500,
          size.height * 0.5000000)
      ..close()
      ..moveTo(size.width * 0.9412500, size.height * 0.5000000)
      ..cubicTo(
          size.width * 0.9412500,
          size.height * 0.4469564,
          size.width * 0.9375625,
          size.height * 0.3960857,
          size.width * 0.9309987,
          size.height * 0.3585786)
      ..cubicTo(
          size.width * 0.9244350,
          size.height * 0.3210714,
          size.width * 0.9155325,
          size.height * 0.3000000,
          size.width * 0.9062500,
          size.height * 0.3000000)
      ..cubicTo(
          size.width * 0.8969675,
          size.height * 0.3000000,
          size.width * 0.8880650,
          size.height * 0.3210714,
          size.width * 0.8815013,
          size.height * 0.3585786)
      ..cubicTo(
          size.width * 0.8749375,
          size.height * 0.3960857,
          size.width * 0.8712500,
          size.height * 0.4469564,
          size.width * 0.8712500,
          size.height * 0.5000000)
      ..cubicTo(
          size.width * 0.8712500,
          size.height * 0.5530436,
          size.width * 0.8749375,
          size.height * 0.6039143,
          size.width * 0.8815013,
          size.height * 0.6414214)
      ..cubicTo(
          size.width * 0.8880650,
          size.height * 0.6789286,
          size.width * 0.8969675,
          size.height * 0.7000000,
          size.width * 0.9062500,
          size.height * 0.7000000)
      ..cubicTo(
          size.width * 0.9155325,
          size.height * 0.7000000,
          size.width * 0.9244350,
          size.height * 0.6789286,
          size.width * 0.9309987,
          size.height * 0.6414214)
      ..cubicTo(
          size.width * 0.9375625,
          size.height * 0.6039143,
          size.width * 0.9412500,
          size.height * 0.5530436,
          size.width * 0.9412500,
          size.height * 0.5000000)
      ..close();

    final Paint paint2Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xffDDE1E4);
    canvas.drawPath(path_2, paint2Fill);

    final Paint paint3Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xffA0A9B6);
    canvas.drawCircle(
      Offset(size.width * 0.5000000, size.height * 0.5000000),
      size.width * 0.05000000,
      paint3Fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
