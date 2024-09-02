import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ttech_attendance/featchers/home/ui/widgets/home_screen.dart';
import 'package:ttech_attendance/featchers/home/ui/widgets/home_screen_tablet.dart';

class Home extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const Home({super.key, required this.changeLanguage});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isMobile) {
          return HomeScreen(changeLanguage: widget.changeLanguage);
        } else {
          return HomeScreenTablet(
            changeLanguage: widget.changeLanguage,
          );
        }
      },
    );
  }
}
