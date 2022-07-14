import 'package:flutter/material.dart';

class CalcProvider extends ChangeNotifier {
  String _userInput = '';
  String _answer = '';

  String get userInput => _userInput;
  String get answer => _answer;

  set userInput(String input) {
    _userInput = input;
    notifyListeners();
  }

  set answer(String answer) {
    _answer = answer;
    notifyListeners();
  }
}
