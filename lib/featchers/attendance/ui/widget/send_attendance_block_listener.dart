import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';
import 'package:ttech_attendance/featchers/attendance/data/models/attendance_response.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/send_attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/send_attendance_state.dart';
import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../../logic/cubit/attendance_cubit.dart';

class SendAttendanceBlockListener extends StatefulWidget {
  const SendAttendanceBlockListener({super.key});

  @override
  State<SendAttendanceBlockListener> createState() =>
      _SendAttendanceBlockListenerState();
}

class _SendAttendanceBlockListenerState
    extends State<SendAttendanceBlockListener> {
  HeaderData data = HeaderData();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SendAttendanceCubit, SendAttendanceState>(
        child: const SizedBox.shrink(),
        listenWhen: (previous, current) =>
            current is SendLoading ||
            current is SendSuccess ||
            current is SendError,
        listener: (context, state) {
          state.whenOrNull(
            sendLoading: () {
              const Center(
                child: CircularProgressIndicator(),
              );
            },
            sendSuccess: (attendanceResponse) {
              AttendanceResponse response = attendanceResponse;
              data = context.read<SendAttendanceCubit>().data;

              if (response.result == 1) {
                context.read<AttendanceCubit>().shifts = [
                  data.shift1TimeIn,
                  data.shift1TimeOut,
                  data.shift2TimeIn,
                  data.shift2TimeOut,
                  data.shift3TimeIn,
                  data.shift3TimeOut,
                  data.shift4TimeIn,
                  data.shift4TimeOut
                ];
                for (int i = 0;
                    i < context.read<AttendanceCubit>().shifts.length;
                    i += 2) {
                  if (checkIfNull(
                      [context.read<AttendanceCubit>().shifts[i]])) {
                    context.read<AttendanceCubit>().shifts[i] =
                        "${response.dateTimeNow!.hour}:${response.dateTimeNow!.minute}";
                    break;
                  } else if (!checkIfNull(
                          [context.read<AttendanceCubit>().shifts[i]]) &&
                      checkIfNull(
                          [context.read<AttendanceCubit>().shifts[i + 1]])) {
                    context.read<AttendanceCubit>().shifts[i + 1] =
                        "${response.dateTimeNow!.hour}:${response.dateTimeNow!.minute}";
                    break;
                  }
                }

                // Update the original data object with the modified shift times
                data.shift1TimeIn = context.read<AttendanceCubit>().shifts[0];
                data.shift1TimeOut = context.read<AttendanceCubit>().shifts[1];
                data.shift2TimeIn = context.read<AttendanceCubit>().shifts[2];
                data.shift2TimeOut = context.read<AttendanceCubit>().shifts[3];
                data.shift3TimeIn = context.read<AttendanceCubit>().shifts[4];
                data.shift3TimeOut = context.read<AttendanceCubit>().shifts[5];
                data.shift4TimeIn = context.read<AttendanceCubit>().shifts[6];
                data.shift4TimeOut = context.read<AttendanceCubit>().shifts[7];

                setupDialogState(
                  context,
                  Intl.defaultLocale == MyConstants.arabic
                      ? response.errorMessageAr!
                      : response.errorMessageEn!,
                  [S.of(context).okDialog],
                  false,
                );
              } else if (response.result == 0) {
                context.read<SendAttendanceCubit>().attendanceTime =
                    DateTime(0);
                setupDialogState(
                  context,
                  Intl.defaultLocale == MyConstants.arabic
                      ? response.errorMessageAr!
                      : response.errorMessageEn!,
                  [S.of(context).okDialog],
                  true,
                );
              }
            },
            sendError: (error) {
              setupDialogState(
                context,
                error,
                [S.of(context).okDialog],
                true,
              );
            },
          );
        });
  }
}
