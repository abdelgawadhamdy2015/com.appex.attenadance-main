import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_state.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/send_attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/send_attendance_state.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/attendance_list_item.dart';
import 'package:ttech_attendance/featchers/attendance/ui/widget/send_attendance_block_listener.dart';
import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';

class AttendanceBord extends StatefulWidget {
  const AttendanceBord({super.key});

  @override
  State<AttendanceBord> createState() => _AttendanceBoard();
}

class _AttendanceBoard extends State<AttendanceBord> {
  bool isAttendance = true;
  HeaderData data = HeaderData();
  // Map<String, dynamic> map = {};

  @override
  Widget build(BuildContext context) {
    context.read<SendAttendanceCubit>().attendanceTime = DateTime(0);
    return Padding(
      padding: SizeConfig().getScreenPadding(),
      child: Column(
        children: [
          const SendAttendanceBlockListener(),
          BlocBuilder<AttendanceCubit, AttendanceState>(
            builder: (context, state) {
              data = context.read<SendAttendanceCubit>().data;
              return BlocBuilder<SendAttendanceCubit, SendAttendanceState>(
                  builder: (context, state) {
                //map = data.toJson();
                return IntrinsicHeight(
                  child: Column(
                    children: [
                      AttendanceListItem(
                          shiftTimeIn: data.shift1TimeIn,
                          shiftTimeOut: data.shift1TimeOut,
                          shift: 1,
                          shiftType: data.shiftType),
                      !checkIfNull([
                                data.shift1TimeIn,
                                data.shift1TimeOut,
                                data.hasShift2
                              ]) &&
                              (data.hasShift2! || data.shiftType == 1)
                          ? AttendanceListItem(
                              shiftTimeIn: data.shift2TimeIn,
                              shiftTimeOut: data.shift2TimeOut,
                              shift1Complete: true,
                              shift: 2,
                              shiftType: data.shiftType!,
                            )
                          : Container(),
                      !checkIfNull([
                                data.shift1TimeIn,
                                data.shift1TimeOut,
                                data.shift2TimeIn,
                                data.shift2TimeOut,
                                data.hasShift3
                              ]) &&
                              (data.hasShift3! || data.shiftType == 1)
                          ? AttendanceListItem(
                              shiftTimeIn: data.shift3TimeIn,
                              shiftTimeOut: data.shift3TimeOut,
                              shift1Complete: true,
                              shift2Complete: true,
                              shift: 3,
                              shiftType: data.shiftType!)
                          : Container(),
                      !checkIfNull([
                                data.shift1TimeIn,
                                data.shift1TimeOut,
                                data.shift2TimeIn,
                                data.shift2TimeOut,
                                data.shift3TimeIn,
                                data.shift3TimeOut,
                                data.hasShift4
                              ]) &&
                              (data.hasShift4! || data.shiftType == 1)
                          ? AttendanceListItem(
                              shiftTimeIn: data.shift4TimeIn,
                              shiftTimeOut: data.shift4TimeOut,
                              shift1Complete: true,
                              shift2Complete: true,
                              shift3Complete: true,
                              shift: 4,
                              shiftType: data.shiftType!)
                          : Container()
                    ],
                  ),
                );
              });
            },
          )
        ],
      ),
    );
  }
}
