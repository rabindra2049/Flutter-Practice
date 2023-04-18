import 'package:flutter/material.dart';

class ChartPainter extends CustomPainter {
  ChartPainter(List<String> x, List<double> y, double min, double max);

  @override
  void paint(Canvas canvas, Size size) {
    /*final c = Offset(size.width / 2.0, size.height / 2.0);
    final radius = 50.0;
    final paint = Paint()..color = Colors.black;
    canvas.drawCircle(c, radius, paint);*/
    canvas.drawPaint(Paint()..color =Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
