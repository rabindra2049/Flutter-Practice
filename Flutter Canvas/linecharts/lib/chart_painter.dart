import 'package:flutter/material.dart';

class ChartPainter extends CustomPainter {
  final List<String> x;
  final List<double> y;
  final double min;
  final double max;

  ChartPainter(this.x, this.y, this.min, this.max);

  static double border = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    /*final c = Offset(size.width / 2.0, size.height / 2.0);
    final radius = 50.0;
    final paint = Paint()..color = Colors.black;
    canvas.drawCircle(c, radius, paint);*/
    final clipRect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.clipRect(clipRect);
    canvas.drawPaint(Paint()..color = Colors.black);

    //Compute the drawable chart width and height
    final drawableHeight = size.height - 2.0 * border;
    final drawableWidth = size.width - 2.0 * border;
    final hd = drawableHeight / 5.0;
    final wd = drawableWidth / this.x.length.toDouble();

    final height = hd * 3.0;
    final width = drawableWidth;

    //escape if values are invalid
    if (height <= 0.0 || width <= 0.0) return;
    if (max - min < 1.0e-6) return;

    final hr = height / (max - min); //height per unit values

    final left = border;
    final top = border;

    final c = Offset(left + wd / 2.0, top + height / 2.0);
    _drawOutLine(canvas, c, wd, height);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  final outLinePaint = Paint()
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke
    ..color = Colors.white;

  void _drawOutLine(Canvas canvas, Offset c, double width, double height) {
    y.forEach((element) {
      final rect = Rect.fromCenter(center: c, width: width, height: height);
      canvas.drawRect(rect, outLinePaint);
      c += Offset(width, 0);
    });
  }
}
