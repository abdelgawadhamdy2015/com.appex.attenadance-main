// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/shared_pref_helper.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/widgets/indicator/my_progress_indicator.dart';

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

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    getSavedValue();

    Future.delayed(const Duration(seconds: 3)).whenComplete(() {
      if (!checkIfNull([token]) && login) {
        context.pushReplacementNamed(Routes.homeScreen);
      } else {
        context.pushReplacementNamed(Routes.loginScreen);
      }
    });
  }

  void getSavedValue() async {
    login = await SharedPrefHelper.getBool(isLoggedIn);
    token = await SharedPrefHelper.getSecuredString(myToken);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xFF232424),
      body: MyProgressIndicator(
        width: SizeConfig.screenWidth! * .5,
        hight: SizeConfig.screenHeight! * .3,
      ),
    );
  }
}
