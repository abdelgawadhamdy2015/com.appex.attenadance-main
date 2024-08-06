import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ttech_attendance/core/helpers/auoth_provider.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
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

  @override
  Widget build(BuildContext context) {
    context.read<SendAttendanceCubit>().attendanceTime = DateTime(0);
    checkIfNull([widget.shiftTimeIn])
        ? isAttendance = true
        : isAttendance = false;
    final authProvider = Provider.of<AuthProvider>(context);
    return SizedBox(
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
                        style: TextStyles.font12black54Reguler,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Visibility(
                      visible: widget.shiftTimeOut != null,
                      child: Text(
                        widget.shiftTimeOut != null
                            ? '${S.of(context).leaveRecord}  ${getFormattedTimeOfDay(widget.shiftTimeOut!, context)}'
                            : "",
                        style: TextStyles.font12black54Reguler,
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
                      getShift(widget.shift,context),
                      style: TextStyles.font12black54Reguler,
                    ))
              ],
            ),
            Visibility(
              visible: widget.shiftTimeOut == null,
              child: Container(
               // height: SizeConfig.screenHeight! * .1,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenHeight! * .01,
                    horizontal: SizeConfig.screenHeight! * .01),
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenHeight! * .01,
                    horizontal: SizeConfig.screenHeight! * .01),
                child: ElevatedButton(
                  onPressed: () async {
                    // work with location here and send it to back end
                    validateThenRecordAttendance(authProvider.token!);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                    backgroundColor: Colors.blueGrey,
                  ),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      !checkIfNull([widget.shiftTimeIn]) &&
                              checkIfNull([widget.shiftTimeOut])
                          ? S.of(context).signOut
                          : S.of(context).signIn,
                      style: TextStyles.font15WhiteBold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void validateThenRecordAttendance(String token) {
    context.read<SendAttendanceCubit>().emiteAttendanceRecord(
        "$myBearer $token",
        widget.shiftType == 1
            ? AttendanceRequest(
                x: context.read<AttendanceCubit>().currentPosition.latitude,
                y: context.read<AttendanceCubit>().currentPosition.latitude,
              )
            : AttendanceRequest(
                x: context.read<AttendanceCubit>().currentPosition.latitude,
                y: context.read<AttendanceCubit>().currentPosition.latitude,
                isAttendFingerprint: isAttendance,
                isShift1Complete: widget.shift1Complete,
                isShift2Complete: widget.shift2Complete,
                isShift3Complete: widget.shift3Complete,
                isShift4Complete: widget.shift4Complete));
  }


}
