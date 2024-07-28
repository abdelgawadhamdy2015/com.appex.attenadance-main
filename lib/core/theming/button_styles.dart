import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyle startedButtonStyle = ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.blue),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: WidgetStateProperty.all(const Size(double.infinity, 52)),
      shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))));
}
