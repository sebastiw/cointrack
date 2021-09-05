import 'dart:async';
import 'package:flutter/material.dart';

class InheritedAssets extends StatefulWidget {
  final Widget child;
  final List<Map<String, Object>> assets = [
    {'name': 'Please wait', 'value': 0}
  ];

  InheritedAssets({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _InheritedAssetsState createState() => _InheritedAssetsState();

  static _InheritedAssetsState of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<InheritedState>()
              as InheritedState)
          .data;
}

class _InheritedAssetsState extends State<InheritedAssets> {
  List<Map<String, Object>> assets = [
    {'name': 'Please wait', 'value': 0}
  ];

  getAssets() async {
    await Future.delayed(Duration(seconds: 1));

    const dataObj = [
      {
        'name': 'Jan',
        'value': 8726.2453,
      },
      {
        'name': 'Feb',
        'value': 2445.2453,
      },
      {
        'name': 'Mar',
        'value': 6636.2400,
      },
      {
        'name': 'Apr',
        'value': 4774.2453,
      },
      {
        'name': 'May',
        'value': 1066.2453,
      },
      {
        'name': 'Jun',
        'value': 4576.9932,
      },
      {
        'name': 'Jul',
        'value': 8926.9823,
      }
    ];

    this.setState(() {
      this.assets = dataObj;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new InheritedState(data: this, child: widget.child);
  }

  @override
  void initState() {
    super.initState();
    this.getAssets();
  }
}

class InheritedState extends InheritedWidget {
  final _InheritedAssetsState data;

  InheritedState({Key? key, required Widget child, required this.data})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedState old) {
    bool shouldNotify = old.data.assets == data.assets;
    return shouldNotify;
  }

  static InheritedState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedState>();
}
