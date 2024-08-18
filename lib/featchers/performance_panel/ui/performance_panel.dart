import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/print_transactions.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_app_bar.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_drawer.dart';
import 'package:ttech_attendance/core/widgets/offline_builder_widget.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/models/performance_employee_model.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/models/performance_employee_response.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_cubit.dart';
import 'package:ttech_attendance/featchers/performance_panel/ui/widget/performance_block_listener.dart';
import 'package:ttech_attendance/featchers/performance_panel/ui/widget/perfromance_list_view.dart';
import 'package:ttech_attendance/generated/l10n.dart';
import '../../../core/helpers/helper_methods.dart';

class PerformancePanel extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const PerformancePanel({super.key, required this.changeLanguage});

  @override
  State<PerformancePanel> createState() => _PerformancePanel();
}

class _PerformancePanel extends State<PerformancePanel> {
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
                              style: TextStyles.font12black54Reguler,
                              controller: TextEditingController(
                                text: _startDate != null
                                    ? dateFormat.format(_startDate!)
                                    : S.of(context).fromDate,
                              ),
                              decoration: InputDecoration(
                                  labelText: S.of(context).fromDate,
                                  hintText: _startDate != null
                                      ? dateFormat.format(_startDate!)
                                      : S.of(context).fromDate,
                                  hintStyle: TextStyles.font12black54Reguler,
                                  labelStyle: TextStyles.font12black54Reguler),
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
                              style: TextStyles.font12black54Reguler,
                              controller: TextEditingController(
                                text: _endDate != null
                                    ? dateFormat.format(_endDate!)
                                    : S.of(context).toDate,
                              ),
                              decoration: InputDecoration(
                                  labelText: S.of(context).toDate,
                                  hintText: _endDate != null
                                      ? dateFormat.format(_endDate!)
                                      : S.of(context).toDate,
                                  hintStyle: TextStyles.font12black54Reguler,
                                  labelStyle: TextStyles.font12black54Reguler),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpacing(SizeConfig.screenHeight! * .02),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (days!.isNotEmpty) {
                                PrintTransactions.printEmployeeAttendanceList(
                                    days!,
                                    "${S.of(context).transaction} ${S.of(context).from} $_startDate ${S.of(context).to} $_endDate",
                                    context);
                              }
                            },
                            icon: const Icon(Icons.print)),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.filter_alt)),
                        const Spacer(),
                        Text(S.of(context).timesOfWork,
                            style: TextStyles.font12blackBold),
                        const Spacer(),
                        Text("0", style: TextStyles.font12black54Reguler),
                      ],
                    ),
                  ),
                  verticalSpacing(SizeConfig.screenHeight! * .01),
                  PerfromanceListView()
                ],
              ),
            ),
          ),
        ));
  }
}
