import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/featchers/home/logic/cubit/home_cubit.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../../../../core/helpers/size_config.dart';

class AttendanceLog extends StatefulWidget {
  const AttendanceLog({super.key});

  @override
  State<AttendanceLog> createState() => _AttendanceLogState();
}

class _AttendanceLogState extends State<AttendanceLog> {
  String formattedTimeOfDay = "____";

  Widget transactionWidget(String shift, DateTime date, String transaction,
      Color textColor, BuildContext context) {
    if (shift != "____") {
      formattedTimeOfDay = getFormattedTimeOfDay(shift, context)!;
    }

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "${DateFormat('dd -MMMM -yyyy').format(date)}- ",
            style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
          ),
          TextSpan(
            text: "$formattedTimeOfDay  ",
            style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
          ),
          TextSpan(
              text: transaction,
              style: textColor == ColorManger.lightred
                  ? TextStyles.lightRedRegulerStyle(SizeConfig.fontSize3!)
                  : TextStyles.lightGreenRegulerStyle(SizeConfig.fontSize3!))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth! * .016,
              vertical: SizeConfig.screenHeight! * .016),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).attendanceMovementsToday,
                style: TextStyles.darkBlueBoldStyle(SizeConfig.fontSize4!),
              ),
              verticalSpacing(SizeConfig.screenHeight! * .01),
              Center(
                child: context.read<HomeCubit>().data.shift1_TimeIn != "____" &&
                        context.read<HomeCubit>().data.shift1_TimeIn != null
                    ? transactionWidget(
                        context.read<HomeCubit>().data.shift1_TimeIn!,
                        context.read<HomeCubit>().data.date!,
                        S.of(context).attendance,
                        ColorManger.lightGreen,
                        context)
                    : Center(
                        child: Text(
                          S.of(context).notAttendance,
                          style:
                              TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
                        ),
                      ),
              ),
              verticalSpacing(SizeConfig.screenHeight! * .01),
              context.read<HomeCubit>().data.shift1_TimeOut != "____" &&
                      context.read<HomeCubit>().data.shift1_TimeOut != null
                  ? transactionWidget(
                      context.read<HomeCubit>().data.shift1_TimeOut!,
                      context.read<HomeCubit>().data.date!,
                      S.of(context).leaving,
                      ColorManger.lightred,
                      context)
                  : Center(
                      child: Text(
                        S.of(context).notLeave,
                        style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
