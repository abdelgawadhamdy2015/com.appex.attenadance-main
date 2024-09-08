import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/networking/signal_r_service.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(S.of(navigatorKey.currentContext!).attendanceTime,
                            style: TextStyles.blackRegulerStyle(
                                SizeConfig.fontSize3!)),
                      const   Icon(Icons.move_down_sharp)
                      ],
                    ),
                    Text(shiftTimeIn ?? "",
                        style: TextStyles.blackRegulerStyle(
                            SizeConfig.fontSize3!)),
                    verticalSpacing(SizeConfig.screenHeight! * .005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(S.of(navigatorKey.currentContext!).leaveTime,
                            style: TextStyles.blackRegulerStyle(
                                SizeConfig.fontSize3!)),
                      const  Icon(Icons.move_up)
                      ],
                    ),
                    Text(shiftTimeOut ?? "",
                        style: TextStyles.blackRegulerStyle(
                            SizeConfig.fontSize3!)),
                  ],
                ),
              ),
              //verticalSpacing(20),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    getShift(shift, navigatorKey.currentContext!),
                    style: TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
