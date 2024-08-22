import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class MyTextForm extends StatelessWidget {
  final String? hint;
  final String? excep;
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
  final Function(String?)? onChanged;
  final InputBorder? errorBorder;
  final Function()? onTab;
  final bool? readOnly;
  final Function(String?)? onSaved;

  final Function()? onEditingComplete;

  const MyTextForm(
      {super.key,
      this.hint,
      this.excep,
      this.controller,
      this.foucesedBorder,
      this.enabeledBorder,
      this.obsecure,
      this.suffixIcon,
      this.labelText,
      this.hintStyle,
      this.inputTextStyle,
      this.hintText,
      this.contentPadding,
      this.fillColor,
      this.validator,
      this.onChanged,
      this.errorBorder,
      this.onTab,
      this.readOnly,
      this.onSaved,
      this.onEditingComplete});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onEditingComplete: onEditingComplete,
        onSaved: onSaved,
        readOnly: readOnly ?? false,
        onTap: onTab,
        onChanged: onChanged ??
            (val) {
              controller!.text = val;
            },
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText ?? "",
          fillColor: fillColor ?? ColorManger.morelightGray,
          filled: true,
          suffixIcon: suffixIcon,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 10.sp,
          ),
          focusedBorder: foucesedBorder ??
              OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorManger.mainBlue, width: 1.3),
                borderRadius: BorderRadius.circular(16),
              ),
          enabledBorder: enabeledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                    color: ColorManger.lighterGray, width: 1.3),
                borderRadius: BorderRadius.circular(16),
              ),
          errorBorder: errorBorder ??
              OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.3.w),
                  borderRadius: BorderRadius.circular(16.r)),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade300, width: 1.3.w),
            borderRadius: BorderRadius.circular(16),
          ),
          errorStyle: TextStyle(fontSize: 15.sp),
        ),
        validator: (val) {
          if (validator == null) {
            if (val!.isEmpty) {
              return "\u26A0 ${S.of(context).pleaseFill} $excep";
            } else {
              return null;
            }
          } else {
            return validator!(val);
          }
        });
  }
}
