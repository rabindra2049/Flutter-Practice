import 'package:flutter/material.dart';

class CircleScreen extends StatefulWidget {
  const CircleScreen({Key? key}) : super(key: key);

  @override
  State<CircleScreen> createState() => _CircleScreenState();
}

class _CircleScreenState extends State<CircleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: CustomPaint(
            painter: CirclePainter(),
            child: Container(),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..color = Colors.indigoAccent
      ..style = PaintingStyle.stroke;

    const circleRadius = 75.0;
    const circleCenter = Offset(200, 150);
    canvas.drawCircle(circleCenter, circleRadius, paint);

    const ovalCenter = Offset(200, 275);
    final oval = Rect.fromCenter(center: ovalCenter, width: 150, height: 100);
    canvas.drawOval(oval, paint);

    var concentricCircleRadius = 100.0;
    const center = Offset(200, 450);
    while (concentricCircleRadius >= 0) {
      canvas.drawCircle(center, concentricCircleRadius, paint);
      concentricCircleRadius -= 10.0;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
