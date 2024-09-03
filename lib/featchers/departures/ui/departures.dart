import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ttech_attendance/featchers/departures/ui/departures_screen.dart';
import 'package:ttech_attendance/featchers/departures/ui/departures_screen_tablet.dart';

class Departures extends StatelessWidget {
  const Departures({super.key, required this.changeLanguage});
  final Function(Locale) changeLanguage;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isMobile) {
          return DeparturesScreen(changeLanguage: changeLanguage);
        } else {
          return DeparturesScreenTablet(changeLanguage: changeLanguage);
        }
      },
    );
  }
}
