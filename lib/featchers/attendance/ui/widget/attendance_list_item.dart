import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_text_button.dart';
import 'package:ttech_attendance/core/widgets/indicator/my_progress_indicator.dart';
import 'package:ttech_attendance/featchers/attendance/data/models/attendance_request.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_cubit.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/send_attendance_cubit.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../../../../core/helpers/helper_methods.dart';

class AttendanceListItem extends StatefulWidget {
  final String? shiftTimeIn;
  final String? shiftTimeOut;
  final bool? shift1Complete;
  final bool? shift2Complete;
  final bool? shift3Complete;
  final bool? shift4Complete;
  final int shift;
  final int? shiftType;

  const AttendanceListItem({
    super.key,
    this.shift1Complete,
    this.shift2Complete,
    this.shift3Complete,
    this.shift4Complete,
    required this.shift,
    required this.shiftTimeIn,
    required this.shiftTimeOut,
    required this.shiftType,
  });

  @override
  State<AttendanceListItem> createState() => _AttendanceListItemState();
}

class _AttendanceListItemState extends State<AttendanceListItem> {
  bool isAttendance = true;
  bool _isButtonVisible = true;
  int _remainingTime = 0;
  String lastTime = '';

  @override
  void initState() {
    super.initState();
    if (widget.shiftType == 1) {
      checkTime();
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<SendAttendanceCubit>().attendanceTime = DateTime(0);
    checkIfNull([widget.shiftTimeIn])
        ? isAttendance = true
        : isAttendance = false;
    return Container(
      padding: SizeConfig().getScreenPadding(),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Visibility(
                        visible: widget.shiftTimeIn != null,
                        child: Text(
                          widget.shiftTimeIn != null
                              ? '${S.of(context).attendanceRecord}  ${getFormattedTimeOfDay(widget.shiftTimeIn!, context)}'
                              : "",
                          style: TextStyles.blackRegulerStyle(
                              SizeConfig.fontSize3!),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Visibility(
                        visible: widget.shiftTimeOut != null,
                        child: Text(
                          widget.shiftTimeOut != null
                              ? '${S.of(context).leaveRecord}  ${getFormattedTimeOfDay(widget.shiftTimeOut!, context)}'
                              : "",
                          style: TextStyles.blackRegulerStyle(
                              SizeConfig.fontSize3!),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.screenHeight! * .01,
                          horizontal: SizeConfig.screenHeight! * .01),
                      child: Text(
                        getShift(widget.shift, context),
                        style:
                            TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
                      ))
                ],
              ),
              Visibility(
                visible: widget.shiftTimeOut == null,
                child: context.read<SendAttendanceCubit>().attendanceLoading
                    ? MyProgressIndicator(
                        hight: SizeConfig.screenHeight! * .1,
                        width: SizeConfig.screenWidth! * .1)
                    : Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                            vertical: SizeConfig.screenHeight! * .01,
                            horizontal: SizeConfig.screenHeight! * .01),
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.screenHeight! * .01,
                            horizontal: SizeConfig.screenHeight! * .01),
                        child: _isButtonVisible
                            ? AppButtonText(
                                verticalPadding: 0,
                                buttonHeight: SizeConfig.screenHeight! * .05,
                                onPressed: () async {
                                  // work with location here and send it to back end
                                  validateThenRecordAttendance();
                                },
                                backGroundColor:
                                    !checkIfNull([widget.shiftTimeIn]) &&
                                            checkIfNull([widget.shiftTimeOut])
                                        ? ColorManger.lightred
                                        : ColorManger.lightGreen,
                                butonText: !checkIfNull([widget.shiftTimeIn]) &&
                                        checkIfNull([widget.shiftTimeOut])
                                    ? S.of(context).signOut
                                    : S.of(context).signIn,
                                textStyle: TextStyles.whiteRegulerStyle(
                                    SizeConfig.fontSize3!),
                              )
                            : Center(child: Text(_formatTime(_remainingTime))),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  checkTime() {
    int remainingTimeInMinutes = 0, remainingTimeInSeconds = 0;
    List shifts = context.read<AttendanceCubit>().shifts;
    lastTime = shifts.lastWhere((element) => element != null, orElse: () => "");

    // check variance between date time now and last checked
    if (!checkIfNull([lastTime]) &&
        DateTime.now().isBefore(convertStringToTime(lastTime))) {
      //handle time variance and save variance of minute and second to timer
      remainingTimeInMinutes = convertStringToTime(lastTime).minute >
              DateTime.now().minute
          ? convertStringToTime(lastTime).minute - DateTime.now().minute
          //handle case (ex: last time = 3:59 and now is 4:02)
          : convertStringToTime(lastTime).minute + 60 - DateTime.now().minute;
      remainingTimeInSeconds = convertStringToTime(lastTime).second >
              DateTime.now().second
          ? convertStringToTime(lastTime).second - DateTime.now().second
          //handle case (ex: last time = 3:59:58 and now is 4:02:04)
          : convertStringToTime(lastTime).second + 60 - DateTime.now().second;
      startTimer(remainingTimeInMinutes, remainingTimeInSeconds);
    } else {
      setState(() {
        _isButtonVisible = true;
      });
    }
  }

  void startTimer(int remainingTimeInMinutes, int remainingTimeInSeconds) {
    _remainingTime = remainingTimeInSeconds + (remainingTimeInMinutes * 60);
    setState(() {
      _isButtonVisible = false;
    });

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _isButtonVisible = true;
          timer.cancel();
        }
      });
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  void validateThenRecordAttendance() {
    context.read<SendAttendanceCubit>().emiteAttendanceRecord(
          widget.shiftType == 1
              ? AttendanceRequest(
                  x: context.read<AttendanceCubit>().currentPosition.latitude,
                  y: context.read<AttendanceCubit>().currentPosition.longitude,
                )
              : AttendanceRequest(
                  x: context.read<AttendanceCubit>().currentPosition.latitude,
                  y: context.read<AttendanceCubit>().currentPosition.longitude,
                  isAttendFingerprint: isAttendance,
                  isShift1Complete: widget.shift1Complete,
                  isShift2Complete: widget.shift2Complete,
                  isShift3Complete: widget.shift3Complete),
        );
    if (widget.shiftType == 1) {
      setState(() {
        _isButtonVisible = false;
      });
      Future.delayed(const Duration(seconds: 2), () {
        checkTime();
      });
    }
  }
}
