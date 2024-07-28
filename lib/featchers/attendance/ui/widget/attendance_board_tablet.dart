import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttech_attendance/core/helpers/methods.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_state.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/cubit/send_attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/cubit/send_attendance_state.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class AttendanceBoardTablet extends StatefulWidget {
  const AttendanceBoardTablet({super.key});

  @override
  State<AttendanceBoardTablet> createState() => _AttendanceBoard();
}

class _AttendanceBoard extends State<AttendanceBoardTablet> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          // key: context.read<AttendanceCubit>().formKey,
          width: double.infinity,
          child: Card(
            child: Column(
              children: [
                Text(
                  '${S.of(context).attendanceRecord}  ${context.read<AttendanceCubit>().data.shift1_TimeIn == "____" || context.read<AttendanceCubit>().data.shift1_TimeIn == null ? "____" : getFormattedTimeOfDay(context.read<AttendanceCubit>().data.shift1_TimeIn!, context)}',
                  style: TextStyle(fontSize: 16.sp),
                  textAlign: TextAlign.start,
                ),
                Text(
                  '${S.of(context).leaveRecord}  ${context.read<AttendanceCubit>().data.shift1_TimeIn == "____" || context.read<AttendanceCubit>().data.shift1_TimeOut == null ? "____" : getFormattedTimeOfDay(context.read<AttendanceCubit>().data.shift1_TimeOut!, context)}',
                  style: TextStyle(fontSize: 16.sp),
                  textAlign: TextAlign.start,
                ),
                BlocBuilder<SendAttendanceCubit, SendAttendanceState>(
                  builder: (context, state) {
                    return Container(
                      height: 60.h,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          fixedSize: Size(100.w, 110.h),
                          backgroundColor: Colors.blueGrey,
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            context
                                            .read<AttendanceCubit>()
                                            .data
                                            .shift1_TimeIn ==
                                        "____" &&
                                    context
                                            .read<AttendanceCubit>()
                                            .data
                                            .shift1_TimeIn !=
                                        null
                                ? S.of(context).signIn
                                : context
                                                .read<AttendanceCubit>()
                                                .data
                                                .shift1_TimeOut ==
                                            "____" &&
                                        context
                                                .read<AttendanceCubit>()
                                                .data
                                                .shift1_TimeOut !=
                                            null
                                    ? S.of(context).signOut
                                    : S.of(context).signIn,
                            style: TextStyles.font25WhiteBold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
