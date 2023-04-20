import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatingCustomShapeScreen extends StatefulWidget {
  const AnimatingCustomShapeScreen({Key? key}) : super(key: key);

  @override
  State<AnimatingCustomShapeScreen> createState() =>
      _AnimatingCustomShapeScreenState();
}

class _AnimatingCustomShapeScreenState extends State<AnimatingCustomShapeScreen>
    with SingleTickerProviderStateMixin {
  final duration = const Duration(seconds: 5);
  late AnimationController _ctrl;

  @override
  void initState() {
    _ctrl = AnimationController(duration: duration, vsync: this)
      ..addListener(() => setState(() {}))
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _ctrl.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _ctrl.forward();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: CustomPaint(
            painter: AnimatingCustomShapePainter(_ctrl.value),
            child: Container(),
          ),
        ),
      ),
    );
  }
}

class AnimatingCustomShapePainter extends CustomPainter {
  final margin = 30.0; // The space between the battery and the parent widget
  final padding = 10.0; // The space between the charge & pin and the border
  final pinWidth = 22.0; // The width of the pin
  final minCharge = 0.2; // The minimum charge until the battery disappears
  final double charge;

  AnimatingCustomShapePainter(this.charge);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..color = Colors.indigoAccent
      ..style = PaintingStyle.stroke;
    final bdr = _borderRRect(size);
    canvas.drawRRect(bdr, paint);

    // Battery pin

    final pinPaint = Paint()
      ..color = Colors.black
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    final pinRect = _pinRect(bdr);
    canvas.drawArc(pinRect, math.pi / 2, -math.pi, true, pinPaint);

    // Battery charge progress
    final chargePaint = Paint()
      ..color = Colors.greenAccent[700]!
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;
    final chargeRRect = _chargeRect(bdr);
    canvas.drawRRect(chargeRRect, chargePaint);
  }

  RRect _borderRRect(Size size) {
    final symmetricalMargin = margin * 2;
    final width = size.width - symmetricalMargin - padding - pinWidth;
    final height = width / 2;
    final top = (size.height / 2) - (height / 2);
    final radius = Radius.circular(height * 0.2);
    final bounds = Rect.fromLTWH(margin, 100, width, height);
    return RRect.fromRectAndRadius(bounds, radius);
  }

  Rect _pinRect(RRect bdr) {
    final center = Offset(bdr.right + padding, bdr.top + (bdr.height / 2.0));
    final height = bdr.height * 0.38;
    final width = pinWidth * 2;
    return Rect.fromCenter(center: center, width: width, height: height);
  }

  RRect _chargeRect(RRect bdr) {
    final percent = minCharge * ((charge / minCharge).round());
    final left = bdr.left + padding;
    final top = bdr.top + padding;
    final right = bdr.right - padding;
    final bottom = bdr.bottom - padding;
    final height = bottom - top;
    final width = right - left;
    final radius = Radius.circular(height * 0.15);
    final rect = Rect.fromLTWH(left, top, width * percent, height);
    return RRect.fromRectAndRadius(rect, radius);
  }

  @override
  bool shouldRepaint(covariant AnimatingCustomShapePainter oldDelegate) {
    return oldDelegate.charge != charge;
  }
}
