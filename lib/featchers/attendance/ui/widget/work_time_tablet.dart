import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/methods.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_state.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class WorkTimeTablet extends StatelessWidget {
  const WorkTimeTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BlocBuilder<AttendanceCubit, AttendanceState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return context.read<AttendanceCubit>().data.date != null &&
                  context.read<AttendanceCubit>().data.dayAr != null &&
                  context.read<AttendanceCubit>().data.dayEn != null
              ? Text(
                  "${Intl.defaultLocale == arabic ? context.read<AttendanceCubit>().data.dayAr : context.read<AttendanceCubit>().data.dayEn}  ${DateFormat(' dd , MMMM , yyyy ').format(context.read<AttendanceCubit>().data.date!)}",
                  style: TextStyles.font20Black54reguler,
                )
              : const Text("");
        },
      ),
      SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .23,
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
                      S.of(context).timesOfWork,
                      style: TextStyles.font25WhiteBold,
                    ),
                  ),
                ),
                verticalSpacing(10),
                Text(
                  S.of(context).dailyWorkingHours,
                  style: TextStyles.font20Black54reguler,
                ),
                verticalSpacing(10),
                Text(
                  S.of(context).restMinutes,
                  style: TextStyles.font20Black54reguler,
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
