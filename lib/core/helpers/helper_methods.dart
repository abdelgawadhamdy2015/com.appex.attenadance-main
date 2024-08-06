import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';


bool checkIfNull(List list){
  bool isNull=true;
  list.any((e)=> e==null? isNull=true: isNull=false);
  // for (var element in list) {
  //   element ==null? isNull=true: isNull= false;
  // }
  return isNull;
}

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

String getShift(int shift,BuildContext context) {
  switch (shift) {
    case 1:
      return S.of(context).shift1;
    case 2:
      return S.of(context).shift2;
    case 3:
      return S.of(context).shift3;
    case 4:
      return S.of(context).shift4;
  }
  return "";
}


