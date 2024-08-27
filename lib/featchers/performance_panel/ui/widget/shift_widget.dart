import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class ShiftWidget extends StatelessWidget {
  const ShiftWidget({
    super.key,
    required this.shift,
    required this.shiftTimeIn,
    required this.shiftTimeOut,
  });

  final int shift;
  final String? shiftTimeIn;
  final String? shiftTimeOut;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: ColorManger.lightGray,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(S.of(context).attendanceTime),
                      horizontalSpacing(SizeConfig.screenWidth! * .04),
                      const Icon(Icons.move_down_sharp)
                    ],
                  ),
                  Text(shiftTimeIn ?? ""),
                  verticalSpacing(SizeConfig.screenHeight! * .005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(S.of(context).leaveTime),
                      horizontalSpacing(SizeConfig.screenWidth! * .04),
                      const Icon(Icons.move_up)
                    ],
                  ),
                  Text(shiftTimeOut ?? ""),
                  verticalSpacing(SizeConfig.screenHeight! * .005),
                ],
              ),
              const Spacer(),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenHeight! * .01,
                      horizontal: SizeConfig.screenHeight! * .01),
                  child: Text(
                    getShift(shift, context),
                    style: TextStyles.font12black54Reguler,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
