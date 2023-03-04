import 'dart:math' show pi, cos, sin;

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _sizedController;
  late AnimationController _radiusController;
  late AnimationController _rotationController;
  late Animation<int> _sidesAnimation;
  late Animation<double> _raduisAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _sizedController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _sidesAnimation = IntTween(begin: 3, end: 10).animate(_sizedController);

    _rotationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _rotationAnimation = Tween(begin: 0.0, end: 2 * pi)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_rotationController);

    _radiusController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _raduisAnimation = Tween(begin: 20.0, end: 400.0)
        .chain(CurveTween(curve: Curves.bounceInOut))
        .animate(_radiusController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _sizedController,
            _radiusController,
            _rotationController,
          ]),
          builder: (context, child) {
            return Transform(

              alignment: Alignment.center,
              transform: Matrix4.identity()
              ..rotateX(_rotationAnimation.value)
              ..rotateY(_rotationAnimation.value)
              ..rotateZ(_rotationAnimation.value)
              ,
              child: CustomPaint(
                child: SizedBox(
                  width: _raduisAnimation.value,
                  height: _raduisAnimation.value,
                ),
                painter: Polygon(sides: _sidesAnimation.value),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _sizedController.dispose();
    _radiusController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sizedController.repeat(reverse: true);
    _radiusController.repeat(reverse: true);
    _rotationController.repeat(reverse: true);
  }
}

class Polygon extends CustomPainter {
  final int sides;

  Polygon({required this.sides});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final angle = (2 * pi) / sides;
    final angles = List.generate(sides, (index) => index * angle);

    final radius = size.width / 2;

    path.moveTo(
      center.dx + radius * cos(0),
      center.dy + radius * sin(0),
    );

    for (final angle in angles) {
      path.lineTo(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is Polygon && oldDelegate.sides != sides;
}
