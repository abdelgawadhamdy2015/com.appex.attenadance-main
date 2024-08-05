import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/my_app_bar.dart';
import 'package:ttech_attendance/core/widgets/my_drawer.dart';
import 'package:ttech_attendance/core/widgets/offline_builder_widget.dart';
import 'package:ttech_attendance/featchers/request_form/date/models/request_model.dart';
import 'package:ttech_attendance/featchers/request_form/logic/cubit/all_vaccations_cubit.dart';
import 'package:ttech_attendance/featchers/request_form/logic/cubit/all_vaccations_state.dart';
import 'package:ttech_attendance/featchers/request_form/logic/cubit/request_vaccation_cubit.dart';
import 'package:ttech_attendance/featchers/request_form/ui/widget/all_vaccations_listener.dart';
import 'package:ttech_attendance/featchers/request_form/ui/widget/request_block_listener.dart';
import 'package:ttech_attendance/featchers/request_form/ui/widget/request_form_screen_tablet.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class RequestFormScreen extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const RequestFormScreen({super.key, required this.changeLanguage});

  @override
  RequestFormScreenState createState() => RequestFormScreenState();
}

class RequestFormScreenState extends State<RequestFormScreen> {
  String? _selectedLeaveType;
  DateTime? _startDate;
  DateTime? _endDate;
  List<String> types = [];
  int vaccationId = 1;
  String _duration = "";
  TextEditingController notesController = TextEditingController();

  void _pickDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate = isStartDate
        ? (_startDate ?? DateTime.now())
        : (_endDate ?? DateTime.now());
    DateTime firstDate = DateTime(2000);
    DateTime lastDate = DateTime(2101);

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null && pickedDate != initialDate) {
      setState(() {
        if (isStartDate) {
          _startDate = pickedDate;
        } else {
          _endDate = pickedDate;
        }
        if (_startDate != null && _endDate != null) {
          _startDate!.isBefore(_endDate!)
              ? _duration =
              (_endDate!.difference(_startDate!).inDays + 1).toString()
              : _duration = S
              .of(context)
              .dateWarning;
        }
      });
    }
  }

  String token = "";

  @override
  void initState() {
    super.initState();
    //get Token from shared preference
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints
        .of(context)
        .isMobile
        ? Scaffold(
      appBar: MyAppBar(
          changeLanguage: widget.changeLanguage,
          context: context,
          title: myRequests),
      drawer: const Drawer(child: MyDrawer()),
      body: OfflineBuilderWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(20.0.h),
              child: Form(
                key: context
                    .read<RequestVaccationCubit>()
                    .formKey,
                child: Column(
                  children: [
                    BlocBuilder<AllVaccationsCubit, AllVaccationsState>(
                      builder: (context, state) {
                        if (state is Loading) {
                          return const CircularProgressIndicator();
                        } else if (state is Success) {
                          return DropdownButtonFormField(
                            key: context
                                .read<AllVaccationsCubit>()
                                .formKey,
                            decoration: InputDecoration(
                                labelText: S
                                    .of(context)
                                    .kindOfHoliday,
                                labelStyle: TextStyles.font12black54Reguler,
                                border: const OutlineInputBorder(),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5)),
                            value: _selectedLeaveType,
                            items: context
                                .read<AllVaccationsCubit>()
                                .vacctionsName
                                .map((String type) {
                              return DropdownMenuItem<String>(
                                value: type,
                                child: Text(
                                  type,
                                  style: TextStyles.font12black54Reguler,
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedLeaveType = newValue;
                              });

                              vaccationId = context
                                  .read<AllVaccationsCubit>()
                                  .vaccations
                                  .where((v) => v.arabicName == newValue)
                                  .first
                                  .id!;
                            },
                          );
                        } else {
                          return Text(S
                              .of(context)
                              .noDateFound);
                        }
                      },
                    ),
                    const AllVaccationsListener(),
                    verticalSpacing(20),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: S
                              .of(context)
                              .fromDate,
                          labelStyle: TextStyles.font12black54Reguler,
                          border: const OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.calendar_month_outlined,
                            size: MediaQuery
                                .of(context)
                                .size
                                .width * .1,
                          )),
                      onTap: () => _pickDate(context, true),
                      controller: TextEditingController(
                        text: _startDate != null
                            ? Intl.defaultLocale == english
                            ? DateFormat('yyyy-MM-dd')
                            .format(_startDate!)
                            : DateFormat("dd-MM-yyyy")
                            .format(_startDate!)
                            : '',
                      ),
                      style: TextStyles.font12black54Reguler,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      style: TextStyles.font12black54Reguler,
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: S
                              .of(context)
                              .toDate,
                          labelStyle: TextStyles.font12black54Reguler,
                          border: const OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.calendar_month_outlined,
                            size: MediaQuery
                                .of(context)
                                .size
                                .width * .1,
                          )),
                      onTap: () => _pickDate(context, false),
                      controller: TextEditingController(
                        text: _endDate != null
                            ? Intl.defaultLocale == english
                            ? DateFormat('yyyy-MM-dd').format(_endDate!)
                            : DateFormat("dd-MM-yyyy").format(_endDate!)
                            : '',
                      ),
                    ),
                    verticalSpacing(
                        MediaQuery
                            .of(context)
                            .size
                            .height * .02),
                    Text(
                      "$_duration  ${S
                          .of(context)
                          .days}",
                      style: TextStyles.font12black54Reguler,
                    ),
                    verticalSpacing(
                        MediaQuery
                            .of(context)
                            .size
                            .height * .02),
                    TextField(
                      controller: notesController,
                      decoration: InputDecoration(
                        labelText: S
                            .of(context)
                            .notes,
                        labelStyle: TextStyles.font12black54Reguler,
                        border: const OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    verticalSpacing(
                        MediaQuery
                            .of(context)
                            .size
                            .height * .02),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 30.h, horizontal: 50.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              validateThenAddVaccation(context);
                            },
                            child: Text(
                              S
                                  .of(context)
                                  .send,
                              style: TextStyles.font16BlueBold,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .pushReplacementNamed(Routes.homeScreen);
                            },
                            child: Text(
                              S
                                  .of(context)
                                  .cancel,
                              style: TextStyles.font16BlueBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const RequestBlockListener()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    )
        : RequestFormScreenTablet(
      changeLanguage: widget.changeLanguage,
    );
  }

  getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString(myToken)!;
    setState(() {
      //get vaccations types from data base
      getAllVaccations(context);
    });
  }

  getAllVaccations(BuildContext context) {
    context
        .read<AllVaccationsCubit>()
        .emitAllVaccationsState("$myBearer $token");
  }

  void validateThenAddVaccation(BuildContext context) {
    if (context
        .read<RequestVaccationCubit>()
        .formKey
        .currentState!
        .validate()) {
      context.read<RequestVaccationCubit>().emitRequestVaccationState(
          RequestVaccation(
              vaccationId: vaccationId,
              isMobile: true,
              dateFrom: _startDate.toString(),
              dateTo: _endDate.toString(),
              note: notesController.text),
          "Bearer $token");
    }
  }

}


