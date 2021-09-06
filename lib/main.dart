import 'dart:async';

import 'package:flutter/material.dart';
import 'graph.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GraphWidget(),
    );
  }
}
