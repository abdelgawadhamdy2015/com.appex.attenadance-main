import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_state.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/send_attendance_cubit.dart';
import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';
import 'package:ttech_attendance/generated/l10n.dart';


class AttendanceBlocListener extends StatefulWidget {
  const AttendanceBlocListener({super.key});

  @override
  State<AttendanceBlocListener> createState() => _AttendanceBlocListenerState();
}

class _AttendanceBlocListenerState extends State<AttendanceBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AttendanceCubit, AttendanceState>(
        child: const SizedBox.shrink(),
        listenWhen: (previous, current) =>
            current is Loading || current is Success || current is Error,
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              const Center(
                child: CircularProgressIndicator(),
              );
            },
            success: (headerResponse) {
              HeaderResponse response = headerResponse;
              if (response.result == 1) {
                context.read<AttendanceCubit>().data = response.data!;
                context.read<AttendanceCubit>().shifts=[
                  response.data!.shift1_TimeIn,
                  response.data!.shift1_TimeOut,
                  response.data!.shift2_TimeIn,
                  response.data!.shift2_TimeOut,
                  response.data!.shift3_TimeIn,
                  response.data!.shift3_TimeOut,
                  response.data!.shift4_TimeIn,
                  response.data!.shift4_TimeOut,
                ];
                context.read<SendAttendanceCubit>().data = response.data!;
              } else {
                setupDialogState(
                    context,
                    Intl.defaultLocale == MyConstants.arabic
                        ? response.errorMessageAr!
                        : response.errorMessageEn!,
                    [S.of(context).okDialog], true
                    );
              }
            },
            error: (error) {

                setupDialogState(context, error, [S.of(context).okDialog],true, );

            },
          );
        });
  }
}
