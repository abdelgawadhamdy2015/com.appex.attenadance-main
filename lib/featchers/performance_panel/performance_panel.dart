import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/methods.dart';
import 'package:ttech_attendance/core/helpers/print_transactions.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/my_app_bar.dart';
import 'package:ttech_attendance/core/widgets/my_drawer.dart';
import 'package:ttech_attendance/core/widgets/offline_builder_widget.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/models/performance_employee_model.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/models/performance_employee_response.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_cubit.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_state.dart';
import 'package:ttech_attendance/featchers/performance_panel/ui/performance_block_listener.dart';
import 'package:ttech_attendance/featchers/performance_panel/ui/performance_panel_tablet.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class PerformancePanel extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const PerformancePanel({super.key, required this.changeLanguage});

  @override
  State<PerformancePanel> createState() => _PerformancePanel();
}

class _PerformancePanel extends State<PerformancePanel> {
  String token = "";
  TextEditingController notesController = TextEditingController();
  List<Day> dataAsString = [];
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          isStart ? _startDate ?? DateTime.now() : _endDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStart ? _startDate : _endDate)) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
        if (_startDate != null && _endDate != null) {
          setState(() {
            getPerfromanceDate();
          });
        }
      });
    }
  }

  getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString(myToken)!;
  }

  getPerfromanceDate() {
    context.read<PerformanceEmployeeCubit>().emitRPerformanceEmployeeState(
        "$myBearer $token",
        PerformanceEmployeeModel(
            dateFrom: _startDate != null ? _startDate! : DateTime.now(),
            dateTo: _endDate != null ? _endDate! : DateTime.now(),
            isMobile: true));
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    List<Day> days = [];

    return Scaffold(
      appBar: MyAppBar(
        changeLanguage: widget.changeLanguage,
        context: context,
        title: attendanceAndDepartureReports,
      ),
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      backgroundColor: ColorManger.lightGray,
      body: ResponsiveBreakpoints.of(context).isMobile
          ? OfflineBuilderWidget(
              child: SafeArea(
                child: Container(
                  color: ColorManger.lightGray,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .05,
                      vertical: MediaQuery.of(context).size.height * .01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          horizontalSpacing(
                              MediaQuery.of(context).size.width * .05),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _selectDate(context, true),
                              child: AbsorbPointer(
                                child: TextFormField(
                                  style: TextStyles.font12black54Reguler,
                                  controller: TextEditingController(
                                    text: _startDate != null
                                        ? Intl.defaultLocale == english
                                            ? DateFormat('dd-MMMM-yyyy')
                                                .format(_startDate!)
                                            : DateFormat('dd-MMMM-yyyy')
                                                .format(_startDate!)
                                        : S.of(context).fromDate,
                                  ),
                                  decoration: InputDecoration(
                                      labelText: S.of(context).fromDate,
                                      hintText: _startDate != null
                                          ? DateFormat('dd-MMMM-yyyy')
                                              .format(_startDate!)
                                          : S.of(context).fromDate,
                                      hintStyle:
                                          TextStyles.font12black54Reguler,
                                      labelStyle:
                                          TextStyles.font12black54Reguler),
                                ),
                              ),
                            ),
                          ),
                          const PerformanceBlockListener(),
                          horizontalSpacing(
                              MediaQuery.of(context).size.width * .05),
                          horizontalSpacing(10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _selectDate(context, false),
                              child: AbsorbPointer(
                                child: TextFormField(
                                  style: TextStyles.font12black54Reguler,
                                  controller: TextEditingController(
                                    text: _endDate != null
                                        ? Intl.defaultLocale == english
                                            ? DateFormat('dd-MMMM-yyyy')
                                                .format(_endDate!)
                                            : DateFormat("dd-MMMM-yyyy")
                                                .format(_endDate!)
                                        : S.of(context).toDate,
                                  ),
                                  decoration: InputDecoration(
                                      labelText: S.of(context).toDate,
                                      hintText: _endDate != null
                                          ? Intl.defaultLocale == english
                                              ? DateFormat('dd-MMMM-yyyy')
                                                  .format(_endDate!)
                                              : DateFormat("yyyy-MMMM-dd")
                                                  .format(_endDate!)
                                          : S.of(context).toDate,
                                      hintStyle:
                                          TextStyles.font12black54Reguler,
                                      labelStyle:
                                          TextStyles.font12black54Reguler),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpacing(MediaQuery.of(context).size.height * .05),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (days.isNotEmpty) {
                                    PrintTransactions.printEmployeeAttendanceList(
                                        days,
                                        "transaction from $_startDate to $_endDate",
                                        context);
                                  }
                                },
                                icon: const Icon(Icons.print)),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.menu_book)),
                            const Spacer(),
                            Text(S.of(context).timesOfWork,
                                style: TextStyles.font12blackBold),
                            const Spacer(),
                            Text("0", style: TextStyles.font12black54Reguler),
                          ],
                        ),
                      ),
                      verticalSpacing(MediaQuery.of(context).size.height * .01),
                      Expanded(
                        child: BlocBuilder<PerformanceEmployeeCubit,
                            PerformanceEmployeeState>(
                          builder: (context, state) {
                            if (state is Loading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (state is Success) {
                              days = context
                                  .read<PerformanceEmployeeCubit>()
                                  .datalist
                                  .first
                                  .employees!
                                  .first
                                  .days!;
                              return ListView.builder(
                                key: context
                                    .read<PerformanceEmployeeCubit>()
                                    .formKey,
                                itemCount: context
                                    .read<PerformanceEmployeeCubit>()
                                    .datalist
                                    .first
                                    .employees!
                                    .first
                                    .days!
                                    .length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          const Spacer(),
                                          Text(
                                            Intl.defaultLocale == arabic
                                                ? "${context.read<PerformanceEmployeeCubit>().datalist.first.employees!.first.days![index].date!.day} ${context.read<PerformanceEmployeeCubit>().datalist.first.employees!.first.days![index].dayAr!}"
                                                : "${context.read<PerformanceEmployeeCubit>().datalist.first.employees!.first.days![index].date!.day} ${context.read<PerformanceEmployeeCubit>().datalist.first.employees!.first.days![index].dayEn!}",
                                            style:
                                                TextStyles.font12black54Reguler,
                                          ),
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Divider(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .01,
                                            thickness: 3,
                                            indent: 50,
                                            endIndent: 20,
                                            color: Colors.black,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  S.of(context).attendanceTime),
                                              horizontalSpacing(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .01),
                                              const Icon(Icons.move_down_sharp)
                                            ],
                                          ),
                                          Text(context
                                              .read<PerformanceEmployeeCubit>()
                                              .datalist
                                              .first
                                              .employees!
                                              .first
                                              .days![index]
                                              .shift1TimeIn!),
                                          verticalSpacing(MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .01),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(S.of(context).leaveTime),
                                              horizontalSpacing(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .01),
                                              const Icon(Icons.move_up)
                                            ],
                                          ),
                                          Text(context
                                              .read<PerformanceEmployeeCubit>()
                                              .datalist
                                              .first
                                              .employees!
                                              .first
                                              .days![index]
                                              .shift1TimeOut!),
                                          verticalSpacing(MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .01),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(S.of(context).workHours),
                                              horizontalSpacing(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .01),
                                              const Icon(Icons.timer)
                                            ],
                                          ),
                                          Text(
                                              context
                                                  .read<
                                                      PerformanceEmployeeCubit>()
                                                  .datalist
                                                  .first
                                                  .employees!
                                                  .first
                                                  .days![index]
                                                  .workingTime!,
                                              style: TextStyles
                                                  .font12black54Reguler),
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
                      )
                    ],
                  ),
                ),
              ),
            )
          : PerformancePanelTablet(changeLanguage: widget.changeLanguage),
    );
  }
}
