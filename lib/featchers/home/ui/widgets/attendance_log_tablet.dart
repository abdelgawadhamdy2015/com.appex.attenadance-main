import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/featchers/home/logic/cubit/home_cubit.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class AttendanceLogTablet extends StatefulWidget {
  const AttendanceLogTablet({super.key});

  @override
  State<AttendanceLogTablet> createState() => _AttendanceLogState();
}

class _AttendanceLogState extends State<AttendanceLogTablet> {
  String formattedTimeOfDay = "____";

  Widget transactionWidget(String shift, DateTime date, String transaction,
      Color textColor, BuildContext context) {
    if (shift != "____") {
      formattedTimeOfDay = getFormattedTimeOfDay(shift, context);
    }

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "${DateFormat('dd -MMMM -yyyy').format(date)}- ",
            style: TextStyles.font20Black54reguler,
          ),
          TextSpan(
            text: "$formattedTimeOfDay  ",
            style: TextStyles.font20Black54reguler,
          ),
          TextSpan(text: transaction, style: TextStyles.font20Black54reguler)
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S
                    .of(context)
                    .attendanceMovementsToday,
                style: TextStyles.font30BlackBold,
              ),
              verticalSpacing(10),
              context
                  .read<HomeCubit>()
                  .data
                  .shift1_TimeIn != "____" &&
                  context
                      .read<HomeCubit>()
                      .data
                      .shift1_TimeIn != null
                  ? transactionWidget(
                  context
                      .read<HomeCubit>()
                      .data
                      .shift1_TimeIn!,
                  context
                      .read<HomeCubit>()
                      .data
                      .date!,
                  S
                      .of(context)
                      .presence,
                  Colors.green,
                  context)
                  : Center(
                child: Text(
                  S
                      .of(context)
                      .notAttendance,
                  style: TextStyles.font20Black54reguler,
                ),
              ),
              verticalSpacing(10),
              context
                  .read<HomeCubit>()
                  .data
                  .shift1_TimeOut != "____" &&
                  context
                      .read<HomeCubit>()
                      .data
                      .shift1_TimeOut != null
                  ? transactionWidget(
                  context
                      .read<HomeCubit>()
                      .data
                      .shift1_TimeOut!,
                  context
                      .read<HomeCubit>()
                      .data
                      .date!,
                  S
                      .of(context)
                      .presence,
                  Colors.red,
                  context)
                  : Center(
                child: Text(S
                    .of(context)
                    .notLeave,
                    style: TextStyles.font20Black54reguler),
              ),
            ],
          ),
        ),
      ),
    );
  }}