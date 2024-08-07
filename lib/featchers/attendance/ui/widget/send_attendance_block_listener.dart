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

class SendAttendanceBlockListener extends StatefulWidget {
  const SendAttendanceBlockListener({super.key});

  @override
  State<SendAttendanceBlockListener> createState() =>
      _SendAttendanceBlockListenerState();
}

class _SendAttendanceBlockListenerState
    extends State<SendAttendanceBlockListener> {

   HeaderData data=HeaderData();
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
                List<String?> shiftTimes = [
                  data.shift1_TimeIn,
                  data.shift1_TimeOut,
                  data.shift2_TimeIn,
                  data.shift2_TimeOut,
                  data.shift3_TimeIn,
                  data.shift3_TimeOut,
                  data.shift4_TimeIn,
                  data.shift4_TimeOut
                ];
                for (int i = 0; i < shiftTimes.length; i += 2) {
                  if (checkIfNull([shiftTimes[i]])) {
                    shiftTimes[i] = "${response.dateTimeNow!.hour}:${response.dateTimeNow!.minute}";
                    break;
                  } else if (!checkIfNull([shiftTimes[i]]) && checkIfNull([shiftTimes[i + 1]])) {
                    shiftTimes[i + 1] = "${response.dateTimeNow!.hour}:${response.dateTimeNow!.minute}";
                    break;
                  }
                }

                // Update the original data object with the modified shift times
                data.shift1_TimeIn = shiftTimes[0];
                data.shift1_TimeOut = shiftTimes[1];
                data.shift2_TimeIn = shiftTimes[2];
                data.shift2_TimeOut = shiftTimes[3];
                data.shift3_TimeIn = shiftTimes[4];
                data.shift3_TimeOut = shiftTimes[5];
                data.shift4_TimeIn = shiftTimes[6];
                data.shift4_TimeOut = shiftTimes[7];

                setupDialogState(
                    context,
                    Intl.defaultLocale == arabic
                        ? response.errorMessageAr!
                        : response.errorMessageEn!,
                    false,
                    );
              } else if (response.result == 0) {
                context.read<SendAttendanceCubit>().attendanceTime =
                    DateTime(0);
                setupDialogState(
                    context, response.errorMessageAr.toString(), true, );
              }
            },
            sendError: (error) {
              setupDialogState(context, error, true, );
            },
          );
        });
  }





}
