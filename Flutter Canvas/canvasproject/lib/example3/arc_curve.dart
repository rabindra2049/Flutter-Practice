import 'package:flutter/material.dart';
import 'dart:math' as math;


class ArcCurveScreen extends StatefulWidget {
  const ArcCurveScreen({Key? key}) : super(key: key);

  @override
  State<ArcCurveScreen> createState() => _ArcCurveScreenState();
}

class _ArcCurveScreenState extends State<ArcCurveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: CustomPaint(
            painter: ArcCurvePainter(),
            child: Container(),
          ),
        ),
      ),
    );
  }
}

class ArcCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..color = Colors.indigoAccent
      ..style = PaintingStyle.stroke;

    const arcCenter = Offset(200, 80);
    final arcRect = Rect.fromCircle(center: arcCenter, radius: 75);
    final startAngle = degreesToRadians(10);
    final sweepAngle = degreesToRadians(-80);
    canvas.drawArc(arcRect, startAngle, sweepAngle, true, paint);

    const circleRadius1 = 10.0;
    const circleCenter1 = Offset(240, 50);
    canvas.drawCircle(circleCenter1, circleRadius1, paint);

    const circleRadius = 10.0;
    const circleCenter = Offset(120, 45);
    canvas.drawCircle(circleCenter, circleRadius, paint);

    const arcCenter2 = Offset(150, 80);
    final arcRect2 = Rect.fromCircle(center: arcCenter2, radius: 75);
    final startAngle2 = degreesToRadians(180);
    final sweepAngle2 = degreesToRadians(80);
    canvas.drawArc(arcRect2, startAngle2, sweepAngle2, true, paint);



    const arcCenter1 = Offset(175, 120);
    final arcRect1 = Rect.fromCircle(center: arcCenter1, radius: 75);
    final startAngle1 = degreesToRadians(45);
    final sweepAngle1 = degreesToRadians(89);
    canvas.drawArc(arcRect1, startAngle1, sweepAngle1, false, paint);


    const arcCenter3 = Offset(175, 225);
    final arcRect3 = Rect.fromCircle(center: arcCenter3, radius: 75);
    final startAngle3 = degreesToRadians(225);
    final sweepAngle3 = degreesToRadians(88);
    canvas.drawArc(arcRect3, startAngle3, sweepAngle3, false, paint);
  }

  double degreesToRadians(double degrees) {
    return degrees * (math.pi / 180.0);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
