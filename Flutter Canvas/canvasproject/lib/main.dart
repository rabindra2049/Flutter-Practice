import 'package:canvasproject/example2/circle.dart';
import 'package:canvasproject/example3/arc_curve.dart';
import 'package:canvasproject/example4/bezier_curves.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BezierCurveScreen(),
    );
  }
}
