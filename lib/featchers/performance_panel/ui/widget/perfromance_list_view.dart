import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/networking/signal_r_service.dart';
import 'package:ttech_attendance/core/shimmer_widgets/departures_shimmer.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/models/performance_employee_response.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_cubit.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_state.dart';
import 'package:ttech_attendance/featchers/performance_panel/ui/widget/day_panel.dart';
import 'package:ttech_attendance/generated/l10n.dart';

// ignore: must_be_immutable
class PerfromanceListView extends StatelessWidget {
  PerfromanceListView({super.key});
  List<Day> days = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PerformanceEmployeeCubit, PerformanceEmployeeState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: DeparturesShimmer());
          } else if (state is Success) {
            days = context.read<PerformanceEmployeeCubit>().datalist.isNotEmpty
                ? context
                    .read<PerformanceEmployeeCubit>()
                    .datalist
                    .first
                    .employees!
                    .first
                    .days!
                : [];
            return ListView.builder(
              key: context.read<PerformanceEmployeeCubit>().formKey,
              itemCount: days.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: DayPanel(day: days[index]),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      Intl.defaultLocale == MyConstants.arabic
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () async {
                                        context.pop();
                                      },
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        S
                                            .of(navigatorKey.currentContext!)
                                            .okDialog,
                                        style: TextStyles.blackBoldStyle(
                                            SizeConfig.fontSize3!),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          });
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        getFormattedTimeOfDay(
                                    days[index].shift1TimeIn!, context) !=
                                null
                            ? Text(
                                getFormattedTimeOfDay(
                                    days[index].shift1TimeIn!, context)!,
                                style: TextStyles.darkBlueBoldStyle(
                                    SizeConfig.fontSize3!),
                              )
                            : Container(),
                        Container(
                          width: SizeConfig.screenWidth! * .4,
                          height: SizeConfig.screenHeight! * .01,
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth! * .3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: ColorManger.lighterGreen,
                          ),
                        ),
                        Text(
                          days[index].date != null
                              ? Intl.defaultLocale == MyConstants.arabic
                                  ? "${days[index].date!.day} ${days[index].dayAr!}"
                                  : "${days[index].date!.day} ${days[index].dayEn!}"
                              : "",
                          style: TextStyles.darkBlueRegulerStyle(
                              SizeConfig.fontSize3!),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        verticalSpacing(SizeConfig.screenHeight! * .005),
                        verticalSpacing(SizeConfig.screenHeight! * .005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).attendanceTime,
                                style: TextStyles.blackRegulerStyle(
                                    SizeConfig.fontSize3!)),
                            horizontalSpacing(SizeConfig.screenWidth! * .04),
                            Icon(Icons.move_down_sharp,
                                size: SizeConfig.iconSize5)
                          ],
                        ),
                        Text(days[index].shift1TimeIn ?? "",
                            style: TextStyles.blackRegulerStyle(
                                SizeConfig.fontSize3!)),
                        verticalSpacing(SizeConfig.screenHeight! * .005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).leaveTime,
                                style: TextStyles.blackRegulerStyle(
                                    SizeConfig.fontSize3!)),
                            horizontalSpacing(SizeConfig.screenWidth! * .04),
                            Icon(Icons.move_up, size: SizeConfig.iconSize5)
                          ],
                        ),
                        Text(days[index].shift1TimeOut ?? "",
                            style: TextStyles.blackRegulerStyle(
                                SizeConfig.fontSize3!)),
                        verticalSpacing(SizeConfig.screenHeight! * .005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).workHours,
                                style: TextStyles.blackRegulerStyle(
                                    SizeConfig.fontSize3!)),
                            horizontalSpacing(SizeConfig.screenWidth! * .04),
                            Icon(Icons.timer, size: SizeConfig.iconSize5)
                          ],
                        ),
                        Text(days[index].workingTime ?? "",
                            style: TextStyles.blackRegulerStyle(
                                SizeConfig.fontSize3!)),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Text(
              S.of(context).noDateFound,
              style: TextStyles.blackRegulerStyle(SizeConfig.fontSize3!),
            );
          }
        },
      ),
    );
  }
}
