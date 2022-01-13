import 'package:flutter/material.dart';

class AlternativeStore extends ValueNotifier<String?> {
  AlternativeStore() : super('');

  void selectAlternative(String? alternative) {
    value = alternative;
  }
}
