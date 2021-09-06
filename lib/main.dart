import 'package:cointrack/inherited_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'graph.dart';
import 'inherited_assets.dart';
import 'preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('CoinTrack'),
        ),
        backgroundColor: Colors.white,
        body: InheritedPreferences(
          child: InheritedAssets(child: HomeChooserWidget())),
        floatingActionButton: SpeedDial(
            backgroundColor: Colors.red,
            icon: Icons.add,
            activeIcon: Icons.close,
            renderOverlay: false,
            children: [
              SpeedDialChild(
                child: Icon(Icons.app_registration_rounded),
                label: 'Asset',
                backgroundColor: Colors.amberAccent,
                onTap: () {
                },
              ),
            ]),
      ),
    );
  }
}

class HomeChooserWidget extends StatefulWidget {
  @override
  _HomeChooserState createState() => new _HomeChooserState();
}

class _HomeChooserState extends State<HomeChooserWidget> {
  @override
  Widget build(BuildContext context) {
    Preferences p = InheritedPreferences.of(context).preferences;

    return SingleChildScrollView(
        child: Center(
            child: Column(children: <Widget>[
      GraphWidget(),
      Text('HERE IS: ${p.base}')
    ])));
  }
}
