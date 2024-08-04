import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/routing/routes.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.pushReplacementNamed(Routes.homeScreen),
      child: Intl.defaultLocale == arabic
          ?  Container(
               padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
              // child: Platform.isIOS
              //     ? const Icon(Icons.arrow_forward)
              //     :
              child : const Icon(Icons.arrow_back))
          : const Icon((Icons.arrow_back)),
    );
  }
}
