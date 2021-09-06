import 'package:cointrack/inherited_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'graph.dart';
import 'inherited_assets.dart';
import 'preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: InheritedPreferences(child: Home()),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this.key,
      appBar: AppBar(
        title: Text('CoinTrack'),
      ),
      backgroundColor: Colors.white,
      body: InheritedAssets(child: HomeChooserWidget()),
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
                Preferences p = Preferences.fromJson({'base': 'BTC'});
                InheritedPreferences.of(context).preferences = p;
                InheritedPreferences.of(context).storePreferences();
                print('Prefs now: $p');
              },
            ),
          ]),
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
