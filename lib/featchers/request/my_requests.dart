import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ttech_attendance/featchers/request/request_screen.dart';
import 'package:ttech_attendance/featchers/request/request_screen_tablet.dart';

class MyRequests extends StatelessWidget {
  const MyRequests({super.key, required this.changeLanguage});
  final Function(Locale) changeLanguage;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isMobile) {
          return RequestScreen(changeLanguage: changeLanguage);
        } else {
          return RequestScreenTablet(changeLanguage: changeLanguage);
        }
      },
    );
  }
}
