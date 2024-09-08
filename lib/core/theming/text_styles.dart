import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle blackBoldStyle(double fontSize) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeightHelper.bold,
        color: Colors.black);
  }

  static TextStyle blackRegulerStyle(double fontSize) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeightHelper.reguler,
        color: Colors.black54);
  }

  static TextStyle lightRedRegulerStyle(double fontSize) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeightHelper.reguler,
        color: ColorManger.lightred);
  }

  static TextStyle lightGreenRegulerStyle(double fontSize) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeightHelper.reguler,
        color: ColorManger.lightGreen);
  }

  static TextStyle whiteRegulerStyle(double fontSize) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeightHelper.reguler,
        color: Colors.white);
  }

  static TextStyle darkBlueRegulerStyle(double fontSize) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeightHelper.reguler,
        color: ColorManger.darkBlue);
  }

  static TextStyle darkBlueBoldStyle(double fontSize) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeightHelper.bold,
        color: ColorManger.darkBlue);
  }
}
