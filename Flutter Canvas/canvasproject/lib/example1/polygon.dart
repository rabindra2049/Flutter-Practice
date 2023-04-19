import 'package:flutter/material.dart';

class PolygonScreen extends StatefulWidget {
  const PolygonScreen({Key? key}) : super(key: key);

  @override
  State<PolygonScreen> createState() => _PolygonScreenState();
}

class _PolygonScreenState extends State<PolygonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: CustomPaint(
            painter: PolygonPainter(),
            child: Container(),
          ),
        ),
      ),
    );
  }
}

class PolygonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..color = Colors.indigoAccent
      ..style = PaintingStyle.stroke;

    final triangle = Path();
    triangle.moveTo(150, 0);
    triangle.relativeLineTo(100, 100);
    triangle.relativeLineTo(-150, 0);
    triangle.close();
    canvas.drawPath(triangle, paint);

    final square1 = Path();
    square1.moveTo(50, 150);
    square1.relativeLineTo(100, 0);
    square1.relativeLineTo(0, 100);
    square1.relativeLineTo(-100, 0);
    square1.close();

    const square2 = Rect.fromLTWH(200, 150, 100, 100);
    canvas.drawPath(square1, paint);
    canvas.drawRect(square2, paint);

    final hexagonal = Path();
    hexagonal.moveTo(100, 300);
    hexagonal.relativeLineTo(75, 50);
    hexagonal.relativeLineTo(0, 75);
    hexagonal.relativeLineTo(-75, 50);
    hexagonal.relativeLineTo(-75, -50);
    hexagonal.relativeLineTo(0, -75);
    hexagonal.close();
    canvas.drawPath(hexagonal, paint);

    final crossPolygon = Path();
    crossPolygon.moveTo(250, 300);
    crossPolygon.relativeLineTo(50, 0);
    crossPolygon.relativeLineTo(0, 50);
    crossPolygon.relativeLineTo(50, 0);
    crossPolygon.relativeLineTo(0, 50);
    crossPolygon.relativeLineTo(-50, 0);
    crossPolygon.relativeLineTo(0, 50);
    crossPolygon.relativeLineTo(-50, 0);
    crossPolygon.relativeLineTo(0, -50);
    crossPolygon.relativeLineTo(-50, 0);
    crossPolygon.relativeLineTo(0, -50);
    crossPolygon.relativeLineTo(50,0);
    crossPolygon.close();
    canvas.drawPath(crossPolygon, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
