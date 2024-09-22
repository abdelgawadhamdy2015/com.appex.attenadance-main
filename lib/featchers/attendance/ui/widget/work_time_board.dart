import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_text_button.dart';
import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../../../../core/helpers/helper_methods.dart';

class WorkTimeBoard extends StatelessWidget {
  final HeaderData data;

  const WorkTimeBoard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = data.toJson();
    return Column(children: [
      !checkIfNull([data.date, data.dayAr, data.dayEn])
          ? Text(
              "${Intl.defaultLocale == MyConstants.arabic ? data.dayAr : data.dayEn}  ${DateFormat(' dd , MMMM , yyyy ').format(data.date!)}",
              style: TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
            )
          : Container(),
      IntrinsicHeight(
        child: Card(
          color: ColorManger.darkBlue,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                right: SizeConfig.screenWidth! * .05,
                left: SizeConfig.screenWidth! * .05,
                top: SizeConfig.screenHeight! * .01,
                bottom: SizeConfig.screenHeight! * .01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppButtonText(
                  verticalPadding: SizeConfig.screenHeight! * .0,
                  buttonHeight: SizeConfig.screenHeight! * .06,
                  buttonWidth: SizeConfig.screenWidth! * .4,
                  backGroundColor: ColorManger.mutedBlue,
                  textStyle: TextStyles.whiteBoldStyle(SizeConfig.fontSize4!),
                  butonText: S.of(context).timesOfWork,
                  borderRadius: 20.r,
                  onPressed: () {},
                ),
                verticalSpacing(SizeConfig.screenHeight! * .01),
                data.shiftType == 1
                    ? Text(
                        "${S.of(context).workHours} : ${!checkIfNull([
                              data.totalDayHours
                            ]) ? getHours(data.totalDayHours!, context) : "no data "} ",
                        style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 1; i <= 4; i++)
                            if (!checkIfNull([
                                  map['shift${i}_Start'],
                                  map['shift${i}_End']
                                ]) &&
                                (i == 1 || map['hasShift$i']))
                              Text(
                                "${getShift(i, context)} ${S.of(context).from} ${getFormattedTimeOfDay(map['shift${i}_Start']!, context)} ${S.of(context).to} ${getFormattedTimeOfDay(map['shift${i}_End']!, context)}",
                                style: TextStyles.whiteRegulerStyle(
                                    SizeConfig.fontSize4!),
                              ),
                          Text(
                            S.of(context).restMinutes,
                            style: TextStyles.whiteRegulerStyle(
                                SizeConfig.fontSize4!),
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
