import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttech_attendance/core/helpers/methods.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_state.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/send_attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/send_attendance_block_listener.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../../logic/cubit/send_attendance_state.dart';

class AttendanceBoard extends StatefulWidget {
  const AttendanceBoard({super.key});

  @override
  State<AttendanceBoard> createState() => _AttendanceBoard();
}

class _AttendanceBoard extends State<AttendanceBoard> {
  bool isAttendance = true;
  @override
  Widget build(BuildContext context) {
    context.read<SendAttendanceCubit>().attendanceTime = DateTime(0);
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is Success) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Column(
                    children: [
                      BlocBuilder<SendAttendanceCubit, SendAttendanceState>(
                        builder: (context, state) {
                          context
                                      .read<SendAttendanceCubit>()
                                      .data
                                    .shift1_TimeIn ==
                                  null
                              ? isAttendance = true
                              : isAttendance = false;
                          return Column(
                            children: [
                              Visibility(
                                visible: context
                                        .read<SendAttendanceCubit>()
                                        .data
                                        .shift1_TimeIn !=
                                    null,
                                child: Text(
                                  context
                                              .read<SendAttendanceCubit>()
                                              .data
                                              .shift1_TimeIn !=
                                          null
                                      ? '${S.of(context).attendanceRecord}  ${getFormattedTimeOfDay(context.read<SendAttendanceCubit>().data.shift1_TimeIn!, context)}'
                                      : "",
                                  style: TextStyles.font12black54Reguler,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Visibility(
                                visible: context
                                        .read<SendAttendanceCubit>()
                                        .data
                                        .shift1_TimeOut !=
                                    null,
                                child: Text(
                                  context
                                              .read<SendAttendanceCubit>()
                                              .data
                                              .shift1_TimeOut !=
                                          null
                                      ? '${S.of(context).leaveRecord}  ${getFormattedTimeOfDay(context.read<SendAttendanceCubit>().data.shift1_TimeOut!, context)}'
                                      : "",
                                  style: TextStyles.font12black54Reguler,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * .1,
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.w),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.w),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // work with location here and send it to back end
                                    // validateThenRecordAttendance(
                                    //     authProvider.token!);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Text(
                                      context
                                                      .read<
                                                          SendAttendanceCubit>()
                                                      .data
                                                      .shift1_TimeIn !=
                                                  null &&
                                              context
                                                      .read<
                                                          SendAttendanceCubit>()
                                                      .data
                                                      .shift1_TimeOut ==
                                                  null
                                          ? S.of(context).signOut
                                          : S.of(context).signIn,
                                      style: TextStyles.font15WhiteBold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SendAttendanceBlockListener()
                    ],
                  ),
                ),
              )
            ],
          );
        } else {
          return setupDialogState(context, "there are error", true, );
        }
      },
    );
  }

  // void validateThenRecordAttendance(String token) {
  //   context.read<SendAttendanceCubit>().emiteAttendanceRecord(
  //       "$myBearer $token",
  //       AttendanceRequest(
  //           x: context.read<AttendanceCubit>().locationData!.latitude,
  //           y: context.read<AttendanceCubit>().locationData!.latitude,
  //           isAttendFingerprint: isAttendance));
  // }
}
