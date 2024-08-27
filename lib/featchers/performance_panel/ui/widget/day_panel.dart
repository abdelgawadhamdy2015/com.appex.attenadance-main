import 'package:flutter/cupertino.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';

class DayPanel extends StatelessWidget {
  const DayPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: SizeConfig().getScreenPadding(),
        ),
      ),
    );
  }
}
