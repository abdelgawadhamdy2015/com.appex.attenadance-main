import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../theming/colors.dart';
import '../theming/text_styles.dart';

class AppFormTextFeild extends StatelessWidget {
  final InputBorder? foucesedBorder;
  final InputBorder? enabeledBorder;
  final bool? obsecure;
  final Widget? suffixIcon;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final InputBorder? errorBorder;
  final Function()? onTab;
  final bool? readOnly;
  final String? excep;
  const AppFormTextFeild(
      {super.key,
      this.foucesedBorder,
      this.enabeledBorder,
      this.obsecure,
      this.suffixIcon,
      this.hintStyle,
      this.inputTextStyle,
      this.hintText,
      this.contentPadding,
      this.fillColor,
      this.validator,
      this.errorBorder,
      this.controller,
      this.onChanged,
      this.onTab,
      this.excep,
      this.readOnly,
      this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      readOnly: readOnly ?? false,
      onTap: onTab ?? () {},
      // onChanged: onChanged??(value){},
      decoration: InputDecoration(
        labelText: labelText ?? "",
        fillColor: fillColor ?? ColorManger.morelightGray,
        filled: true,
        hintStyle:
            hintStyle ?? TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
        hintText: hintText,
        suffixIcon: suffixIcon,
        //isDense: true,
        // contentPadding: contentPadding ??
        //     EdgeInsets.symmetric(
        //         horizontal: SizeConfig.screenWidth! * .02,
        //         vertical: SizeConfig.screenHeight! * .018),
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
                borderSide: BorderSide(color: Colors.red, width: 1.3.w),
                borderRadius: BorderRadius.circular(16.r)),
      ),
      obscureText: obsecure ?? false,
      validator: (val) {
        if (val!.isEmpty) {
          return "\u26A0 ${S.of(context).pleaseFill} ";
        } else {
          return null;
        }
      },
    );
  }
}
