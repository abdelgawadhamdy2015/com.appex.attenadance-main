import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DayPanel(
                            day: days[index],
                          ),
                        ),
                      );
                    },
                    title: Row(
                      children: [
                        getFormattedTimeOfDay(
                                    days[index].shift1TimeIn!, context) !=
                                null
                            ? Text(
                                getFormattedTimeOfDay(
                                    days[index].shift1TimeIn!, context)!,
                                style: TextStyles.font15BlueBold,
                              )
                            : Container(),
                        const Spacer(),
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
                        const Spacer(),
                        Text(
                          days[index].date != null
                              ? Intl.defaultLocale == MyConstants.arabic
                                  ? "${days[index].date!.day} ${days[index].dayAr!}"
                                  : "${days[index].date!.day} ${days[index].dayEn!}"
                              : "",
                          style: TextStyles.font15BlueBold,
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        verticalSpacing(SizeConfig.screenHeight! * .005),
                        verticalSpacing(SizeConfig.screenHeight! * .005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).attendanceTime),
                            horizontalSpacing(SizeConfig.screenWidth! * .04),
                            const Icon(Icons.move_down_sharp)
                          ],
                        ),
                        Text(days[index].shift1TimeIn ?? ""),
                        verticalSpacing(SizeConfig.screenHeight! * .005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).leaveTime),
                            horizontalSpacing(SizeConfig.screenWidth! * .04),
                            const Icon(Icons.move_up)
                          ],
                        ),
                        Text(days[index].shift1TimeOut ?? ""),
                        verticalSpacing(SizeConfig.screenHeight! * .005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(S.of(context).workHours),
                            horizontalSpacing(SizeConfig.screenWidth! * .04),
                            const Icon(Icons.timer)
                          ],
                        ),
                        Text(days[index].workingTime ?? "",
                            style: TextStyles.font12black54Reguler),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Text(
              S.of(context).noDateFound,
              style: TextStyles.font12black54Reguler,
            );
          }
        },
      ),
    );
  }
}
