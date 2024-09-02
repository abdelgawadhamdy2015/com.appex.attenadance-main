import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ttech_attendance/featchers/login/ui/widget/login_screen.dart';
import 'package:ttech_attendance/featchers/login/ui/widget/login_screen_tablet.dart';

class Login extends StatelessWidget {
  const Login({super.key, required this.changeLanguage});
  final Function(Locale) changeLanguage;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInformation) {
      if (sizeInformation.isMobile) {
        return LoginScreen(changeLanguage: changeLanguage);
      } else {
        return LoginScreenTablet(changeLanguage: changeLanguage);
      }
    });
  }
}
