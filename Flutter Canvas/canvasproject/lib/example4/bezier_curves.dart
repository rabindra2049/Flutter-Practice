import 'package:flutter/material.dart';
import 'dart:math' as math;


class BezierCurveScreen extends StatefulWidget {
  const BezierCurveScreen({Key? key}) : super(key: key);

  @override
  State<BezierCurveScreen> createState() => _BezierCurveScreenState();
}

class _BezierCurveScreenState extends State<BezierCurveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: CustomPaint(
            painter: BezierCurvePainter(),
            child: Container(),
          ),
        ),
      ),
    );
  }
}

class BezierCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..color = Colors.indigoAccent
      ..style = PaintingStyle.stroke;

    //Quadratic Bezier
    final qCurve1 = Path()
    ..moveTo(50, 300)
    ..relativeQuadraticBezierTo(100, -100, 300, 0);
    canvas.drawPath(qCurve1, paint);


    final qCurve2 = Path()
      ..moveTo(50, 50)
      ..relativeQuadraticBezierTo(150, 300, 300, 100);
    canvas.drawPath(qCurve2, paint);

    // Cubic Bézier
    final cCurve1 = Path()
      ..moveTo(0, 450)
      ..relativeCubicTo(50, -100, 250, -100, 300, 0);
    canvas.drawPath(cCurve1, paint..color = Colors.black);

    final cCurve2 = Path()
      ..moveTo(370, 200)
      ..relativeCubicTo(0, 450, -300, 300, -150, 250);
    canvas.drawPath(cCurve2, paint..color = Colors.pink);
  }

  double degreesToRadians(double degrees) {
    return degrees * (math.pi / 180.0);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
