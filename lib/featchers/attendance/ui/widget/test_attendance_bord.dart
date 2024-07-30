import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ttech_attendance/core/helpers/auoth_provider.dart';
import 'package:ttech_attendance/core/helpers/methods.dart';
import 'package:ttech_attendance/core/shimmer_widgets/my_shimmer.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_state.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/cubit/send_attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/cubit/send_attendance_state.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/attendance_list_item.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/send_attendance_block_listener.dart';
import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';


class TestAttendanceBord extends StatefulWidget {
  const TestAttendanceBord({super.key});

  @override
  State<TestAttendanceBord> createState() => _AttendanceBoard();
}

class _AttendanceBoard extends State<TestAttendanceBord> {
  bool isAttendance = true;
  HeaderData data = HeaderData();

  @override
  Widget build(BuildContext context) {
    context.read<SendAttendanceCubit>().attendanceTime = DateTime(0);
    Provider.of<AuthProvider>(context);
    return

      Column(children: [

        const SendAttendanceBlockListener(),

        BlocBuilder<AttendanceCubit, AttendanceState>(
        builder: (context, state) {
          if (state is Loading) {
            return  Column(
              children: [
                const ShimmerWidget.circular(width: 30,height: 30,)
                , verticalSpacing(10),
                const ShimmerWidget.rectangular(height: 400),
                const ShimmerWidget.rectangular(height: 400),
                const ShimmerWidget.rectangular(height: 400)
              ],
            );
          }

            data = context.read<SendAttendanceCubit>().data;

            return BlocBuilder<SendAttendanceCubit, SendAttendanceState>(
              builder: (context, state) {
                return IntrinsicHeight(
                  child: Column(
                    children: [
                      AttendanceListItem(
                          shiftTimeIn: data.shift1_TimeIn,
                          shiftTimeOut: data.shift1_TimeOut, shift: 1,
                          shiftType: data.shiftType!=null? data.shiftType!:10
                      ),
                  
                      data.shift1_TimeIn != null &&
                          data.shift1_TimeOut != null &&
                          (data.hasShift2! || data.shiftType == 1) ?
                      AttendanceListItem(
                        shiftTimeIn: data.shift2_TimeIn,
                        shiftTimeOut: data.shift2_TimeOut,
                        shift1Complete: true,
                        shift: 2,
                        shiftType: data.shiftType!,) : Container(),
                  
                  
                     data.shift1_TimeIn!=null&& data.shift1_TimeOut!=null&& data.shift2_TimeIn != null &&
                          data.shift2_TimeOut != null &&
                          (data.hasShift3! || data.shiftType == 1) ?
                      AttendanceListItem(
                          shiftTimeIn: data.shift3_TimeIn,
                          shiftTimeOut: data.shift3_TimeOut,
                          shift1Complete: true,
                          shift2Complete: true,
                          shift: 3,
                          shiftType: data.shiftType!) : Container(),
                      data.shift1_TimeIn!=null&& data.shift1_TimeOut!=null&& data.shift2_TimeIn != null &&
                          data.shift2_TimeOut != null && data.shift3_TimeIn != null &&
                          data.shift3_TimeOut != null &&
                          (data.hasShift4! || data.shiftType == 1) ?
                      AttendanceListItem(
                          shiftTimeIn: data.shift4_TimeIn,
                          shiftTimeOut: data.shift4_TimeOut,
                          shift1Complete: true,
                          shift2Complete: true,
                          shift3Complete: true,
                          shift: 4,
                          shiftType: data.shiftType!) : Container()
                    ],
                  ),
                );
              }
            );

        },
        )
      ],);

  }

  
}
