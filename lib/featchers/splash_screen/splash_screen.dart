// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/shared_pref_helper.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/widgets/radial_progress_painter.dart';

class SplashScreen extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const SplashScreen({super.key, required this.changeLanguage});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool login = false;
  String token = "";

  late AnimationController _controller;
  bool isPlaying = false;
  int maxDuration = 10;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: maxDuration))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          isPlaying = false;
        }
      });

    getSavedValue();
  }

  void getSavedValue() async {
    login = await SharedPrefHelper.getBool(isLoggedIn);
    token = await SharedPrefHelper.getSecuredString(myToken);
  }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: CustomPaint(
            painter: RadialProgressPainter(
          value: _controller.value * maxDuration,
          backgroundGradientColors: [Colors.red, Colors.purple],
          minValue: 0,
          maxValue: maxDuration.toDouble(),
        )),
        // CircularStepProgressIndicator(
        //   totalSteps: 20,
        //   currentStep: 12,
        //   stepSize: 20,
        //   selectedColor: Colors.red,
        //   unselectedColor: Colors.purple[400],
        //   padding: pi / 80,
        //   width: 150,
        //   height: 150,
        //   startingAngle: -pi * 2 / 3,
        //   arcSize: pi * 2 / 3 * 2,
        //   gradientColor: const LinearGradient(
        //     colors: [Colors.red, Colors.purple],
        //   ),
        // ),
      ),
    );
  }
}
