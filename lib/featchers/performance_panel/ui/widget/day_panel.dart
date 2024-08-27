import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/models/performance_employee_response.dart';
import 'package:ttech_attendance/featchers/performance_panel/ui/widget/shift_widget.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class DayPanel extends StatelessWidget {
  const DayPanel({super.key, required this.day});

  final Day day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.backGroundGray,
        title: Text(S.of(context).performancePanel),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: SizeConfig().getScreenPadding(),
            child: Column(
              children: [
                _buildHeader(context),
                verticalSpacing(SizeConfig.screenHeight! * .01),
                _buildShiftWidgets(context),
                _buildWorkDetails(
                    S.of(context).workHours, day.totalShiftTime, Icons.timer),
                _buildWorkDetails(S.of(context).workTime, day.workingTime,
                    Icons.hourglass_bottom),
                _buildWorkDetails(
                    S.of(context).lateTime, day.lateTime, Icons.timer),
                _buildWorkDetails(
                    S.of(context).extraTime, day.extraTime, Icons.timer),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        getFormattedTimeOfDay(day.shift1TimeIn!, context) != null
            ? Text(
                getFormattedTimeOfDay(day.shift1TimeIn!, context)!,
                style: TextStyles.font15BlueBold,
              )
            : Container(),
        const Spacer(),
        Container(
          width: SizeConfig.screenWidth! * .4,
          height: SizeConfig.screenHeight! * .01,
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * .3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: ColorManger.lighterGreen,
          ),
        ),
        const Spacer(),
        Text(
          day.date != null ? _formatDate(day.date!) : "",
          style: TextStyles.font15BlueBold,
        ),
      ],
    );
  }

  Widget _buildShiftWidgets(BuildContext context) {
    return Column(
      children: [
        ShiftWidget(
          shift: 1,
          shiftTimeIn: day.shift1TimeIn,
          shiftTimeOut: day.shift1TimeOut,
        ),
        verticalSpacing(SizeConfig.screenHeight! * .005),
        getFormattedTimeOfDay(day.shift2TimeIn!, context) != null
            ? ShiftWidget(
                shift: 2,
                shiftTimeIn: day.shift2TimeIn,
                shiftTimeOut: day.shift2TimeOut,
              )
            : Container(),
        verticalSpacing(SizeConfig.screenHeight! * .005),
        getFormattedTimeOfDay(day.shift3TimeIn!, context) != null
            ? ShiftWidget(
                shift: 3,
                shiftTimeIn: day.shift3TimeIn,
                shiftTimeOut: day.shift3TimeOut,
              )
            : Container(),
        verticalSpacing(SizeConfig.screenHeight! * .005),
        getFormattedTimeOfDay(day.shift4TimeIn!, context) != null
            ? ShiftWidget(
                shift: 4,
                shiftTimeIn: day.shift4TimeIn,
                shiftTimeOut: day.shift4TimeOut,
              )
            : Container(),
        verticalSpacing(SizeConfig.screenHeight! * .005)
      ],
    );
  }

  Widget _buildWorkDetails(String label, String? value, IconData icon) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label),
            horizontalSpacing(SizeConfig.screenWidth! * .04),
            Icon(icon),
          ],
        ),
        Text(value ?? "", style: TextStyles.font12black54Reguler),
        verticalSpacing(SizeConfig.screenHeight! * .005)
      ],
    );
  }

  String _formatDate(DateTime date) {
    return Intl.defaultLocale == MyConstants.arabic
        ? "${date.day} ${day.dayAr!}"
        : "${date.day} ${day.dayEn!}";
  }
}
