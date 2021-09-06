import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'preferences.dart';

final String defaultPreferences = """
{
  "preferences": {"base": "USD", "assets": ["BTC"]}
}
""";

class InheritedPreferences extends StatefulWidget {
  final Widget child;
  Preferences preferences = Preferences();

  InheritedPreferences({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _InheritedPreferencesState createState() => _InheritedPreferencesState();

  static _InheritedPreferencesState of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<InheritedState>()
              as InheritedState)
          .data;
}

class _InheritedPreferencesState extends State<InheritedPreferences> {
  Preferences preferences =
      Preferences.fromJson(json.decode(defaultPreferences));

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      String _prefs = ((prefs.getString('preferences') ?? defaultPreferences));
      preferences = Preferences.fromJson(json.decode(_prefs));
    });
  }

  storePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('preferences', this.preferences.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new InheritedState(data: this, child: widget.child);
  }

  @override
  void initState() {
    super.initState();
    this.loadPreferences();
  }
}

class InheritedState extends InheritedWidget {
  final _InheritedPreferencesState data;

  InheritedState({Key? key, required Widget child, required this.data})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedState old) {
    bool shouldNotify = old.data.preferences == data.preferences;
    return shouldNotify;
  }

  static InheritedState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedState>();
}
