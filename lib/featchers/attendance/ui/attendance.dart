import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/attendance_screen.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/attendance_screen_tablet.dart';

class Attendance extends StatelessWidget {
  const Attendance({super.key, required this.changeLanguage});
  final Function(Locale) changeLanguage;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isMobile) {
          return AttendanceScreen(changeLanguage: changeLanguage);
        } else {
          return AttendanceScreenTablet(changeLanguage: changeLanguage);
        }
      },
    );
  }
}
