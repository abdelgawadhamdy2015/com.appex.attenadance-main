import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/my_app_bar.dart';
import 'package:ttech_attendance/core/widgets/my_drawer.dart';
import 'package:ttech_attendance/core/widgets/offline_builder_widget.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/models/performance_employee_model.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_cubit.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_state.dart';
import 'package:ttech_attendance/featchers/performance_panel/ui/widget/performance_block_listener.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../../../../core/helpers/helper_methods.dart';

class PerformancePanelTablet extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const PerformancePanelTablet({super.key, required this.changeLanguage});

  @override
  State<PerformancePanelTablet> createState() => _PerformancePanel();
}

class _PerformancePanel extends State<PerformancePanelTablet> {
  String token = "";
  TextEditingController notesController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
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
      body: OfflineBuilderWidget(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                verticalSpacing(20),
                Row(
                  children: <Widget>[
                    horizontalSpacing(10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectDate(context, true),
                        child: AbsorbPointer(
                          child: TextFormField(
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
                            ),
                          ),
                        ),
                      ),
                    ),
                    const PerformanceBlockListener(),
                    const SizedBox(width: 20),
                    horizontalSpacing(10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectDate(context, false),
                        child: AbsorbPointer(
                          child: TextFormField(
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
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.menu)),
                      const Spacer(),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.menu_book)),
                      const Spacer(),
                      Text(S.of(context).timesOfWork,
                          style: TextStyles.font15Black54reguler),
                      const Spacer(),
                      Text("0", style: TextStyles.font15Black54reguler),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: BlocBuilder<PerformanceEmployeeCubit,
                      PerformanceEmployeeState>(
                    builder: (context, state) {
                      if (state is Loading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is Success) {
                        return ListView.builder(
                          key: context.read<PerformanceEmployeeCubit>().formKey,
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
                                    Text(Intl.defaultLocale == arabic
                                        ? "${context.read<PerformanceEmployeeCubit>().datalist.first.employees!.first.days![index].date!.day} ${context.read<PerformanceEmployeeCubit>().datalist.first.employees!.first.days![index].dayAr!}"
                                        : "${context.read<PerformanceEmployeeCubit>().datalist.first.employees!.first.days![index].date!.day} ${context.read<PerformanceEmployeeCubit>().datalist.first.employees!.first.days![index].dayEn!}"),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Divider(
                                      height: 20,
                                      thickness: 5,
                                      indent: 50,
                                      endIndent: 50,
                                      color: Colors.black,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(S.of(context).attendanceTime),
                                        horizontalSpacing(10),
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
                                    verticalSpacing(4),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(S.of(context).leaveTime),
                                        horizontalSpacing(10),
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
                                    verticalSpacing(4),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(S.of(context).workHours),
                                        horizontalSpacing(10),
                                        const Icon(Icons.timer)
                                      ],
                                    ),
                                    Text(context
                                        .read<PerformanceEmployeeCubit>()
                                        .datalist
                                        .first
                                        .employees!
                                        .first
                                        .days![index]
                                        .workingTime!),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Text(S.of(context).noDateFound);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );}
}