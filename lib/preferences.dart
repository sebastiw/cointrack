class Preferences {
  String base = 'USD';

  Preferences();

  Preferences.fromJson(Map<String, dynamic> json) {
    var _base = json['base'] ?? 'USD';
    this.base = _base;
  }
}
