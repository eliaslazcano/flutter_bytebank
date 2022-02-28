import 'package:flutter/material.dart';

class Cliente extends ChangeNotifier {
  String? _nome;

  String? get nome => _nome;

  set nome(String? value) {
    _nome = value;
    notifyListeners();
  }
}