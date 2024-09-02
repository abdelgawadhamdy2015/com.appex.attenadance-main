import 'package:flutter/material.dart';

class CheckboxState with ChangeNotifier {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;

  bool _shifttosecond1 = false;
  bool _shifttosecond2 = false;
  bool _shifttosecond3 = false;
  bool _shifttosecond4 = false;

  bool get isChecked1 => _isChecked1;
  bool get isChecked2 => _isChecked2;
  bool get isChecked3 => _isChecked3;
  bool get isChecked4 => _isChecked4;

  bool get shifttosecond1 => _shifttosecond1;
  bool get shifttosecond2 => _shifttosecond2;
  bool get shifttosecond3 => _shifttosecond3;
  bool get shifttosecond4 => _shifttosecond4;

  set isChecked1(bool value) {
    _isChecked1 = value;
    // If the first checkbox is unchecked, also uncheck the others
    if (!value) {
      _isChecked2 = false;
      _isChecked3 = false;
      _isChecked4 = false;
    }
    notifyListeners();
  }

  set isChecked2(bool value) {
    _isChecked2 = value;
    if (!value) {
      _isChecked3 = false;
      _isChecked4 = false;
    }
    notifyListeners();
  }

  set isChecked3(bool value) {
    _isChecked3 = value;
    if (!value) _isChecked4 = false;

    notifyListeners();
  }

  set isChecked4(bool value) {
    _isChecked4 = value;
    notifyListeners();
  }

  set shifttosecond1(bool value) {
    _shifttosecond1 = value;
    // If the first checkbox is unchecked, also uncheck the second one
    if (value) {
      _isChecked2 = false;
      _isChecked3 = false;
      _isChecked4 = false;
    }
    notifyListeners();
  }

  set shifttosecond2(bool value) {
    _shifttosecond2 = value;
    if (value) {
      _isChecked3 = false;
      _isChecked4 = false;
    }
    notifyListeners();
  }

  set shifttosecond3(bool value) {
    _shifttosecond3 = value;
    if (value) _isChecked4 = false;
    notifyListeners();
  }

  set shifttosecond4(bool value) {
    _shifttosecond4 = value;
    notifyListeners();
  }
}
