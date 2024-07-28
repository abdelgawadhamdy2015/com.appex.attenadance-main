import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/text_styles.dart';

class AppFormTextFeild extends StatelessWidget {
  final InputBorder? foucesedBorder;
  final InputBorder? enabeledBorder;
  final bool? obsecure;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final String hintText;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final Function(String?) validator;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final InputBorder? errorBorder;
  const AppFormTextFeild(
      {super.key,
      this.foucesedBorder,
      this.enabeledBorder,
      this.obsecure,
      this.suffixIcon,
      this.hintStyle,
      this.inputTextStyle,
      required this.hintText,
      this.contentPadding,
      this.fillColor,
      required this.validator,
      this.errorBorder,
      this.controller,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: fillColor ?? ColorManger.morelightGray,
        filled: true,
        hintStyle: hintStyle ?? TextStyles.font14LightGrayNormal,
        hintText: hintText,
        suffixIcon: suffixIcon,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: foucesedBorder ??
            OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorManger.mainBlue, width: 1.3),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder: enabeledBorder ??
            OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorManger.lighterGray, width: 1.3),
              borderRadius: BorderRadius.circular(16),
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorManger.mainBlue, width: 1.3),
                borderRadius: BorderRadius.circular(16)),
      ),
      obscureText: obsecure ?? false,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
