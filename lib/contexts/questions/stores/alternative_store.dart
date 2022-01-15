import 'package:flutter/material.dart';

class AlternativeStore extends ChangeNotifier {
  String? alternative = '';

  static AlternativeStore instance = AlternativeStore();

  void selectAlternative(String? selected) {
    alternative = selected;
    notifyListeners();
  }
}
