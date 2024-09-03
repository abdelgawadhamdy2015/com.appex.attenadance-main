import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ttech_attendance/featchers/performance_panel/ui/widget/performance_panel.dart';
import 'package:ttech_attendance/featchers/performance_panel/ui/widget/performance_panel_tablet.dart';

class Performance extends StatelessWidget {
  const Performance({super.key, required this.changeLanguage});
  final Function(Locale) changeLanguage;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isMobile) {
          return PerformancePanel(changeLanguage: changeLanguage);
        } else {
          return PerformancePanelTablet(changeLanguage: changeLanguage);
        }
      },
    );
  }
}
