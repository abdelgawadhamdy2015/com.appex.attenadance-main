import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/colors.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.pushReplacementNamed(Routes.homeScreen),
      child: const Icon(
        (Icons.arrow_back_ios),
        color: ColorManger.darkBlue,
      ),
    );
  }
}
