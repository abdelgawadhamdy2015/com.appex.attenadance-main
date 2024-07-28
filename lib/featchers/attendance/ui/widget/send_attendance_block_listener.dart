import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';
import 'package:ttech_attendance/featchers/attendance/data/models/attendance_response.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/cubit/send_attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/cubit/send_attendance_state.dart';
import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';

class SendAttendanceBlockListener extends StatefulWidget {
  const SendAttendanceBlockListener({super.key});

  @override
  State<SendAttendanceBlockListener> createState() =>
      _SendAttendanceBlockListenerState();
}

class _SendAttendanceBlockListenerState
    extends State<SendAttendanceBlockListener> {
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
              HeaderData data = context.read<SendAttendanceCubit>().data;
              if (response.result == 1) {





                if (data.shift1_TimeIn ==
                        null ) {
                 data.shift1_TimeIn =
                      "${response.dateTimeNow!.hour}:${response.dateTimeNow!.minute}";
                } else if (data.shift1_TimeIn!=null&& data.shift1_TimeOut==null) {
                  data.shift1_TimeOut =
                      "${response.dateTimeNow!.hour}:${response.dateTimeNow!.minute}";
                } else if (data.shift1_TimeIn !=
                    null && data.shift1_TimeOut!=null && data.shift2_TimeIn==null) {
                  data.shift2_TimeIn =
                  "${response.dateTimeNow!.hour}:${response.dateTimeNow!.minute}";
                } else if (data.shift1_TimeIn!=null&& data.shift1_TimeOut!=null&& data.shift2_TimeIn!=null&&data.shift2_TimeOut==null) {

                  data.shift2_TimeOut =
                  "${response.dateTimeNow!.hour}:${response.dateTimeNow!.minute}";
                }else if (data.shift1_TimeIn!=null&& data.shift1_TimeOut!=null&& data.shift2_TimeIn!=null&& data.shift2_TimeOut!=null&&data.shift3_TimeIn==null) {
                  data.shift3_TimeIn =
                  "${response.dateTimeNow!.hour}:${response.dateTimeNow!.minute}";


                } else if (data.shift1_TimeIn!=null&& data.shift1_TimeOut!=null&& data.shift2_TimeIn!=null&& data.shift2_TimeOut!=null&& data.shift3_TimeIn!=null&&data.shift3_TimeOut==null) {


                  data.shift3_TimeOut =
                  "${response.dateTimeNow!.hour}:${response.dateTimeNow!.minute}";
                }else
                  {if (data.shift1_TimeIn!=null&& data.shift1_TimeOut!=null&& data.shift2_TimeIn!=null&& data.shift2_TimeOut!=null&& data.shift3_TimeIn!=null && data.shift3_TimeOut!=null&&data.shift4_TimeIn==null) {


                  data.shift4_TimeIn =
                  "${response.dateTimeNow!.hour}:${response.dateTimeNow!.minute}";
                } else if (data.shift1_TimeIn!=null&& data.shift1_TimeOut!=null&& data.shift2_TimeIn!=null&& data.shift2_TimeOut!=null&& data.shift3_TimeIn!=null&&data.shift3_TimeOut!=null&& data.shift4_TimeIn!=null&&data.shift4_TimeOut==null) {

                  data.shift4_TimeOut =
                  "${response.dateTimeNow!.hour}:${response.dateTimeNow!.minute}";
                }}

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
