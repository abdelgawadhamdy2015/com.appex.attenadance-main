import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/print_transactions.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_app_bar_tablet.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_drower_tablet.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/models/performance_employee_model.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/models/performance_employee_response.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_cubit.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_state.dart';
import 'package:ttech_attendance/featchers/performance_panel/ui/widget/performance_block_listener.dart';
import 'package:ttech_attendance/featchers/performance_panel/ui/widget/performance_list_view_tablet.dart';
import 'package:ttech_attendance/generated/l10n.dart';
import '../../../../core/helpers/helper_methods.dart';

class PerformancePanelTablet extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const PerformancePanelTablet({super.key, required this.changeLanguage});

  @override
  State<PerformancePanelTablet> createState() => _PerformancePanelTablet();
}

class _PerformancePanelTablet extends State<PerformancePanelTablet> {
  TextEditingController notesController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  List<Day>? days = [];

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
  }

  @override
  Widget build(BuildContext context) {
    days = context.read<PerformanceEmployeeCubit>().datalist.isNotEmpty
        ? context
            .read<PerformanceEmployeeCubit>()
            .datalist
            .first
            .employees!
            .first
            .days
        : [];
    return Scaffold(
      appBar: MyAppBarTablet(
        changeLanguage: widget.changeLanguage,
        context: context,
        title: MyConstants.attendanceAndDepartureReports,
      ),
      drawer: const Drawer(
        child: MyDrowerTablet(),
      ),
      backgroundColor: ColorManger.lightGray,
      body: SafeArea(
        child: Container(
          color: ColorManger.lightGray,
          padding: SizeConfig().getScreenPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context, true),
                      child: AbsorbPointer(
                        child: TextFormField(
                          style: TextStyles.font28Blackreguler,
                          controller: TextEditingController(
                            text: _startDate != null
                                ? MyConstants.dateFormat.format(_startDate!)
                                : S.of(context).fromDate,
                          ),
                          decoration: InputDecoration(
                              labelText: S.of(context).fromDate,
                              hintText: _startDate != null
                                  ? MyConstants.dateFormat.format(_startDate!)
                                  : S.of(context).fromDate,
                              hintStyle: TextStyles.font28Blackreguler,
                              labelStyle: TextStyles.font28Blackreguler),
                        ),
                      ),
                    ),
                  ),
                  const PerformanceBlockListener(),
                  horizontalSpacing(SizeConfig.screenWidth! * .1),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context, false),
                      child: AbsorbPointer(
                        child: TextFormField(
                          style: TextStyles.font28Blackreguler,
                          controller: TextEditingController(
                            text: _endDate != null
                                ? MyConstants.dateFormat.format(_endDate!)
                                : S.of(context).toDate,
                          ),
                          decoration: InputDecoration(
                              labelText: S.of(context).toDate,
                              hintText: _endDate != null
                                  ? MyConstants.dateFormat.format(_endDate!)
                                  : S.of(context).toDate,
                              hintStyle: TextStyles.font28Blackreguler,
                              labelStyle: TextStyles.font28Blackreguler),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpacing(SizeConfig.screenHeight! * .02),
              Center(
                child: BlocBuilder<PerformanceEmployeeCubit,
                    PerformanceEmployeeState>(
                  builder: (context, state) {
                    days = context
                            .read<PerformanceEmployeeCubit>()
                            .datalist
                            .isNotEmpty
                        ? context
                            .read<PerformanceEmployeeCubit>()
                            .datalist
                            .first
                            .employees!
                            .first
                            .days
                        : [];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (days!.isNotEmpty) {
                                PrintTransactions.printEmployeeAttendanceList(
                                    days!,
                                    "${S.of(context).transaction} ${S.of(context).from} $_startDate ${S.of(context).to} $_endDate",
                                    context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(" no data ", style: TextStyles.font28Blackreguler,)));
                              }
                            },
                            icon: const Icon(Icons.print)),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.filter_alt)),
                        const Spacer(),
                        Text(S.of(context).timesOfWork,
                            style: TextStyles.font28Blackreguler),
                        const Spacer(),
                        Text("0", style: TextStyles.font28Blackreguler),
                      ],
                    );
                  },
                ),
              ),
              verticalSpacing(SizeConfig.screenHeight! * .01),
              PerformanceListViewTablet()
            ],
          ),
        ),
      ),
    );
  }
}
