import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/my_app_bar_tablet.dart';
import 'package:ttech_attendance/core/widgets/my_drawer.dart';
import 'package:ttech_attendance/core/widgets/offline_builder_widget.dart';
import 'package:ttech_attendance/featchers/request_form/date/models/request_model.dart';
import 'package:ttech_attendance/featchers/request_form/logic/cubit/all_vaccations_cubit.dart';
import 'package:ttech_attendance/featchers/request_form/logic/cubit/all_vaccations_state.dart';
import 'package:ttech_attendance/featchers/request_form/logic/cubit/request_vaccation_cubit.dart';
import 'package:ttech_attendance/featchers/request_form/ui/widget/all_vaccations_listener.dart';
import 'package:ttech_attendance/featchers/request_form/ui/widget/request_block_listener.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class RequestFormScreenTablet extends StatefulWidget {
  final Function(Locale) changeLanguage;

  const RequestFormScreenTablet({super.key, required this.changeLanguage});

  @override
  RequestFormScreenState createState() => RequestFormScreenState();
}

class RequestFormScreenState extends State<RequestFormScreenTablet> {
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
              : _duration = S.of(context).dateWarning;
        }
      });
    }
  }

  String token = "";
  @override
  void initState() {
    super.initState();
    //get Token from shared preferance
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarTablet(
          changeLanguage: widget.changeLanguage,
          context: context,
          tiltle: myRequests),
      drawer: const Drawer(child: MyDrawer()),
      body: OfflineBuilderWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: context.read<RequestVaccationCubit>().formKey,
              child: Column(
                children: [
                  BlocBuilder<AllVaccationsCubit, AllVaccationsState>(
                    builder: (context, state) {
                      if (state is Loading) {
                        return const CircularProgressIndicator();
                      } else if (state is Success) {
                        return DropdownButton<String>(
                          isExpanded: true,
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * .03,
                            horizontal: MediaQuery.of(context).size.width * .04,
                          ),
                          key: context.read<AllVaccationsCubit>().formKey,
                          // decoration: InputDecoration(

                          //   labelText: S.of(context).kindOfHolidy,
                          //   labelStyle: TextStyles.font20Black54reguler,
                          //   border: const OutlineInputBorder(),
                          //   contentPadding: EdgeInsets.symmetric(
                          //     vertical:
                          //         MediaQuery.of(context).size.height * .03,
                          //     horizontal:
                          //         MediaQuery.of(context).size.width * .04,
                          //   ),
                          // ),
                          value: _selectedLeaveType,
                          items: context
                              .read<AllVaccationsCubit>()
                              .vacctionsName
                              .toSet()
                              .map((type) {
                                return DropdownMenuItem<String>(
                                  value: type,
                                  child: Text(
                                    type,
                                    style: TextStyles.font20BlackBold,
                                  ),
                                );
                              })
                              .toSet()
                              .toList(),
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
                        return Text(S.of(context).noDateFound);
                      }
                    },
                  ),
                  const AllVaccationsListener(),
                  verticalSpacing(MediaQuery.of(context).size.height * .05),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: S.of(context).fromDate,
                        labelStyle: TextStyles.font20Black54reguler,
                        border: const OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.calendar_month_outlined,
                          size: MediaQuery.of(context).size.width * .1,
                        )),
                    onTap: () => _pickDate(context, true),
                    controller: TextEditingController(
                      text: _startDate != null
                          ? Intl.defaultLocale == english
                              ? DateFormat('yyyy-MM-dd').format(_startDate!)
                              : DateFormat("dd-MM-yyyy").format(_startDate!)
                          : '',
                    ),
                    style: TextStyles.font20Black54reguler,
                  ),
                  verticalSpacing(MediaQuery.of(context).size.height * .05),
                  TextFormField(
                    style: TextStyles.font20Black54reguler,
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: S.of(context).toDate,
                        labelStyle: TextStyles.font20Black54reguler,
                        border: const OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.calendar_month_outlined,
                          size: MediaQuery.of(context).size.width * .1,
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
                  verticalSpacing(MediaQuery.of(context).size.height * .05),
                  Text(
                    "$_duration  ${S.of(context).days}",
                    style: TextStyles.font20Black54reguler,
                  ),
                  verticalSpacing(MediaQuery.of(context).size.height * .05),
                  TextField(
                    controller: notesController,
                    decoration: InputDecoration(
                      labelText: S.of(context).notes,
                      labelStyle: TextStyles.font20Black54reguler,
                      border: const OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  verticalSpacing(MediaQuery.of(context).size.height * .02),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * .05,
                        horizontal: MediaQuery.of(context).size.width * .05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            validateThenAddVaccation(context);
                          },
                          child: Text(
                            S.of(context).send,
                            style: TextStyles.font22BlueBold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text(
                            S.of(context).cancel,
                            style: TextStyles.font22BlueBold,
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
        .emitAllVaccationsState();
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
          );
    }
  }

  void clear() {
    setState(() {
      notesController.clear();
    });}}