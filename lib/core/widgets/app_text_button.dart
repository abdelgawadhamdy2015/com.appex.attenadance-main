import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';

class AppButtonText extends StatelessWidget {
  final double? borderRadius;
  final Color? backGroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final TextStyle textStyle;
  final String butonText;
  final VoidCallback onPressed;

  const AppButtonText(
      {super.key,
      this.borderRadius,
      this.backGroundColor,
      this.horizontalPadding,
      this.verticalPadding,
      this.buttonWidth,
      this.buttonHeight,
      required this.textStyle,
      required this.butonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16),
            )),
            backgroundColor:
                WidgetStatePropertyAll(backGroundColor ?? ColorManger.mainBlue),
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(
                  horizontal: horizontalPadding ?? 12.w,
                  vertical: verticalPadding ?? 14.h),
            ),
            fixedSize: WidgetStateProperty.all(
                Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 50.h))),
        child: Text(
          butonText,
          style: textStyle,
        ));
  }
}
