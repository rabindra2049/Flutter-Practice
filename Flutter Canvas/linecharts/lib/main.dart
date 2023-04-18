import 'dart:math';

import 'package:flutter/material.dart';
import 'package:linecharts/progress_chart.dart';

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

final rng = Random();
const dayCount = 7;

class _MyHomePageState extends State<MyHomePage> {
  late List<Score> _scores;

  @override
  void initState() {
    super.initState();
    final scores = List.generate(dayCount, (index) {
      final y = rng.nextDouble() * 30.0;
      final d = DateTime.now().add(Duration(days: -dayCount + index));
      return Score(y, d);
    }).toList();
    setState(() {
      _scores = scores;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.red,
          child: SizedBox(
            height: 150.0,
            child: ProgressChart(
              scores: _scores,
            ),
          ),
        ));
  }
}
