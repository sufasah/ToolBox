import 'package:flutter/Material.dart';

class LanguageModel extends ChangeNotifier {
  String _locale;
  LanguageModel(this._locale);

  String get locale => _locale;

  set locale(val) {
    _locale = val;
    notifyListeners();
  }
}
