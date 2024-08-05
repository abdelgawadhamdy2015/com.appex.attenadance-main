import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../../../../core/helpers/helper_methods.dart';

class WorkTimeBoard extends StatelessWidget {
  final HeaderData data;

  const WorkTimeBoard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      !checkIfNull([data.date, data.dayAr, data.dayEn])
          ? Text(
              "${Intl.defaultLocale == arabic ? data.dayAr : data.dayEn}  ${DateFormat(' dd , MMMM , yyyy ').format(data.date!)}",
              style: TextStyles.font12black54Reguler,
            )
          : const Text(""),
      IntrinsicHeight(
        // width: double.infinity,
        // height: MediaQuery.of(context).size.height * .23,
        child: Card(
          color: Colors.grey,
          child: Padding(
            padding: EdgeInsets.only(
                right: SizeConfig.screenWidth! * .01,
                left: SizeConfig.screenWidth! * .01,
                top: SizeConfig.screenHeight! * .005,
                bottom: SizeConfig.screenHeight! * .005),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
                  ),
                  child: FittedBox(
                    child: Text(
                      S.of(context).timesOfWork,
                      style: TextStyles.font15WhiteBold,
                    ),
                  ),
                ),
                verticalSpacing(SizeConfig.screenHeight! * .01),
                data.shiftType == 1
                    ? Text(
                        "${S.of(context).workHours} : ${!checkIfNull([
                              data.totalDayHours
                            ]) ? getHours(data.totalDayHours!, context) : "no data "} ",
                        style: TextStyles.font12black54Reguler,
                      )
                    : Column(
                        children: [
                          !checkIfNull([data.shift1_Start, data.shift1_End])
                              ? Text(
                                  "${S.of(context).shift1} from ${getFormattedTimeOfDay(data.shift1_Start!, context)} to ${getFormattedTimeOfDay(data.shift1_End!, context)}",
                                  style: TextStyles.font12black54Reguler,
                                )
                              : Container(),
                          !checkIfNull([data.shift2_Start, data.shift2_End]) &&
                                  data.hasShift2!
                              ? Text(
                                  "${S.of(context).shift2} from ${getFormattedTimeOfDay(data.shift2_Start!, context)} to ${getFormattedTimeOfDay(data.shift2_End!, context)}",
                                  style: TextStyles.font12black54Reguler,
                                )
                              : Container(),
                          !checkIfNull([data.shift3_Start, data.shift3_End]) &&
                                  data.hasShift3!
                              ? Text(
                                  "${S.of(context).shift3} from ${getFormattedTimeOfDay(data.shift3_Start!, context)} to ${getFormattedTimeOfDay(data.shift3_End!, context)}",
                                  style: TextStyles.font12black54Reguler,
                                )
                              : Container(),
                          !checkIfNull([data.shift4_Start, data.shift4_End]) &&
                                  data.hasShift4!
                              ? Text(
                                  "${S.of(context).shift4} from ${getFormattedTimeOfDay(data.shift4_Start!, context)} to ${getFormattedTimeOfDay(data.shift4_End!, context)}",
                                  style: TextStyles.font12black54Reguler,
                                )
                              : Container(),
                          Text(
                            S.of(context).restMinutes,
                            style: TextStyles.font12black54Reguler,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
