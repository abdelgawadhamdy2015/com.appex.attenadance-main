import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
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

      data.date != null && data.dayAr != null && data.dayEn != null
          ? Text(
        "${Intl.defaultLocale == arabic ? data.dayAr : data
            .dayEn}  ${DateFormat(' dd , MMMM , yyyy ').format(data.date!)}",
        style: TextStyles.font12black54Reguler,
      )
          : const Text(""),


      IntrinsicHeight(

        // width: double.infinity,
        // height: MediaQuery.of(context).size.height * .23,
        child: Card(
          color: Colors.grey,
          child: Padding(
            padding:
            EdgeInsets.only(right: 20.w, left: 20.w, top: 5.h, bottom: 5.w),
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
                      S
                          .of(context)
                          .timesOfWork,
                      style: TextStyles.font15WhiteBold,
                    ),
                  ),
                ),
                verticalSpacing(10),
                data.shiftType == 1
                    ? Text(
                  "${S
                      .of(context)
                      .workHours} : ${ data.totalDayHours != null ? getHours(
                      data.totalDayHours!, context) : "no data "} ",
                  style: TextStyles.font12black54Reguler,
                )
                    : Column(
                  children: [
                    data.shift1_Start != null && data.shift1_End != null ? Text(
                      "${S
                          .of(context)
                          .shift1} from ${getFormattedTimeOfDay(
                          data.shift1_Start!,
                          context)} to ${getFormattedTimeOfDay(
                          data.shift1_End!, context)}",
                      style: TextStyles.font12black54Reguler,
                    ) : Container(),
                    data.hasShift2 != null && data.hasShift2!
                        ? Text(
                      "${S
                          .of(context)
                          .shift2} from ${getFormattedTimeOfDay(
                          data.shift2_Start!,
                          context)} to ${getFormattedTimeOfDay(
                          data.shift2_End!, context)}",
                      style: TextStyles.font12black54Reguler,
                    )
                        : Container(),
                    data.hasShift3 != null && data.hasShift3!
                        ? Text(
                      "${S
                          .of(context)
                          .shift3} from ${getFormattedTimeOfDay(
                          data.shift3_Start!,
                          context)} to ${getFormattedTimeOfDay(
                          data.shift3_End!, context)}",
                      style: TextStyles.font12black54Reguler,
                    )
                        : Container(),
                    data.hasShift4 != null && data.hasShift4!
                        ? Text(
                      "${S
                          .of(context)
                          .shift4} from ${getFormattedTimeOfDay(
                          data.shift4_Start!,
                          context)} to ${getFormattedTimeOfDay(
                          data.shift4_End!, context)}",
                      style: TextStyles.font12black54Reguler,
                    )
                        : Container(),


                    Text(
                      S
                          .of(context)
                          .restMinutes,
                      style: TextStyles.font12black54Reguler,
                    ),


                  ],
                ),
                verticalSpacing(10),

              ],
            ),
          ),
        ),
      ),

    ]);
  }}