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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(S
                                .of(navigatorKey.currentContext!)
                                .attendanceTime)),
                        horizontalSpacing(SizeConfig.screenWidth! * .04),
                        const Expanded(
                            flex: 1, child: Icon(Icons.move_down_sharp))
                      ],
                    ),
                    Text(shiftTimeIn ?? ""),
                    verticalSpacing(SizeConfig.screenHeight! * .005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                                S.of(navigatorKey.currentContext!).leaveTime)),
                        horizontalSpacing(SizeConfig.screenWidth! * .04),
                        const Expanded(flex: 1, child: Icon(Icons.move_up))
                      ],
                    ),
                    Text(shiftTimeOut ?? ""),
                    verticalSpacing(SizeConfig.screenHeight! * .005),
                  ],
                ),
              ),
              //verticalSpacing(20),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    getShift(shift, navigatorKey.currentContext!),
                    style: TextStyles.font12black54Reguler,
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
