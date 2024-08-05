import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';

SizedBox verticalSpacing(double height) => SizedBox(
      height: height.h,
    );
SizedBox horizontalSpacing(double width) => SizedBox(
      width: width.w,
    );

String getFormattedTimeOfDay(String shift, BuildContext context) {
  TimeOfDay shiftTime = TimeOfDay(
      hour: int.parse(shift.split(":")[0]),
      minute: int.parse(shift.split(":")[1]));
  final localizations = MaterialLocalizations.of(context);
  String formattedTimeOfDay = localizations.formatTimeOfDay(shiftTime);
  return formattedTimeOfDay;
}

String getHours(String time,BuildContext context) {
  TimeOfDay shiftTime = TimeOfDay(
      hour: int.parse(time.split(":")[0]),
      minute: int.parse(time.split(":")[1]));
  return "${shiftTime.hour} ${shiftTime.minute!=00? ": ${shiftTime.minute}":"" } ${S.of(context).hours}";

}
