// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const SplashScreen({super.key, required this.changeLanguage});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool login = false;
  @override
  void initState() {
    super.initState();
    getSavedValue();
    Future.delayed(const Duration(seconds: 3), () {
      login
          ? context.pushReplacementNamed(Routes.homeScreen)
          : context.pushReplacementNamed(Routes.loginScreen);
    });
  }

  void getSavedValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    login = sharedPreferences.getBool(isLoggedIn)!;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Image.asset("images/p.gif"),
      ),
    );
  }
}
