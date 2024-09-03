import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_text_button.dart';
import 'package:ttech_attendance/core/widgets/indicator/my_progress_indicator.dart';
import 'package:ttech_attendance/core/widgets/mytextfile.dart';
import 'package:ttech_attendance/featchers/request/request_form/date/models/request_model.dart';
import 'package:ttech_attendance/featchers/request/request_form/logic/cubit/all_vaccations_cubit.dart';
import 'package:ttech_attendance/featchers/request/request_form/logic/cubit/all_vaccations_state.dart';
import 'package:ttech_attendance/featchers/request/request_form/logic/cubit/request_vaccation_cubit.dart';
import 'package:ttech_attendance/featchers/request/request_form/logic/cubit/request_vaccation_state.dart';
import 'package:ttech_attendance/featchers/request/request_form/ui/widget/all_vaccations_listener.dart';
import 'package:ttech_attendance/featchers/request/request_form/ui/widget/request_block_listener.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class RequestFormScreenTablet extends StatefulWidget {
  const RequestFormScreenTablet({
    super.key,
  });

  @override
  RequestFormScreenTabletState createState() => RequestFormScreenTabletState();
}

class RequestFormScreenTabletState extends State<RequestFormScreenTablet> {
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
          _startDate!.isBefore(_endDate!) || _startDate == _endDate
              ? _duration =
                  "${S.of(context).duration} ${_endDate!.difference(_startDate!).inDays + 1} ${S.of(context).days}"
              : _duration = S.of(context).dateWarning;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllVaccations(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: SizeConfig().getScreenPadding(),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth! * .02,
              vertical: SizeConfig.screenHeight! * .02),
          child: Form(
            key: context.read<RequestVaccationCubit>().formKey,
            child: Column(
              children: [
                const AllVaccationsListener(),
                BlocBuilder<AllVaccationsCubit, AllVaccationsState>(
                  builder: (context, state) {
                    if (state is Loading) {
                      return const CircularProgressIndicator();
                    } else if (state is Success) {
                      return Transform.scale(
                        scaleY: 1.5,
                        child: DropdownButtonFormField(
                          onSaved: (newValue) => _selectedLeaveType = newValue,
                          validator: (value) {
                            return value == null || value.isEmpty
                                ? S.of(context).holidayNotSelected
                                : null;
                          },
                          borderRadius: BorderRadius.all(Radius.circular(.8.r)),
                          key: context.read<AllVaccationsCubit>().formKey,
                          decoration: InputDecoration(
                            hintStyle: TextStyles.font28Blackreguler,
                            labelText: S.of(context).kindOfHoliday,
                            labelStyle: TextStyles.font20Black54reguler,
                            border: const OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.screenWidth! * .02,
                                vertical: SizeConfig.screenHeight! * .01),
                          ),
                          value: _selectedLeaveType,
                          items: context
                              .read<AllVaccationsCubit>()
                              .vacctionsName
                              .map((String type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(
                                type,
                                style: TextStyles.font20Black54reguler,
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedLeaveType = newValue;
                              vaccationId = context
                                  .read<AllVaccationsCubit>()
                                  .vaccations
                                  .where((v) => v.arabicName == newValue)
                                  .first
                                  .id!;
                            });
                          },
                        ),
                      );
                    } else {
                      return Text(
                        S.of(context).noDateFound,
                        style: TextStyles.font28Blackreguler,
                      );
                    }
                  },
                ),
                verticalSpacing(20),
                MyTextForm(
                  excep: S.of(context).fromDate,
                  fillColor: Colors.transparent,
                  readOnly: true,
                  labelText: S.of(context).fromDate,
                  hintStyle: TextStyles.font28Blackreguler,
                  suffixIcon: Container(
                    color: ColorManger.moreMutedBlue,
                    height: SizeConfig.screenHeight! * .07,
                    child: Icon(
                      Icons.calendar_month_outlined,
                      size: SizeConfig.screenWidth! * .1,
                      color: Colors.blueGrey,
                    ),
                  ),
                  onTab: () => _pickDate(context, true),
                  controller: TextEditingController(
                    text: _startDate != null
                        ? Intl.defaultLocale == MyConstants.english
                            ? DateFormat('yyyy-MM-dd').format(_startDate!)
                            : DateFormat("dd-MM-yyyy").format(_startDate!)
                        : '',
                  ),
                  inputTextStyle: TextStyles.font28Blackreguler,
                ),
                verticalSpacing(SizeConfig.screenHeight! * .02),
                MyTextForm(
                  excep: S.of(context).toDate,
                  fillColor: Colors.transparent,
                  readOnly: true,
                  labelText: S.of(context).toDate,
                  hintStyle: TextStyles.font28Blackreguler,
                  inputTextStyle: TextStyles.font28Blackreguler,
                  suffixIcon: Container(
                    color: ColorManger.moreMutedBlue,
                    height: SizeConfig.screenHeight! * .07,
                    child: Icon(
                      Icons.calendar_month_outlined,
                      size: SizeConfig.screenWidth! * .1,
                      color: Colors.blueGrey,
                    ),
                  ),
                  onTab: () => _pickDate(context, false),
                  controller: TextEditingController(
                    text: _endDate != null
                        ? Intl.defaultLocale == MyConstants.english
                            ? DateFormat('yyyy-MM-dd').format(_endDate!)
                            : DateFormat("dd-MM-yyyy").format(_endDate!)
                        : '',
                  ),
                ),
                verticalSpacing(SizeConfig.screenHeight! * .02),
                MyTextForm(
                  validator: (p0) {},
                  enabled: false,
                  onTab: null,
                  fillColor: Colors.transparent,
                  readOnly: true,
                  hint:
                      " ${_duration.isNotEmpty ? "  $_duration " : S.of(context).duration}",
                  hintStyle: TextStyles.font28Blackreguler,
                  inputTextStyle: TextStyles.font28Blackreguler,
                ),
                verticalSpacing(SizeConfig.screenHeight! * .02),
                MyTextForm(
                  fillColor: Colors.transparent,
                  controller: notesController,
                  labelText: S.of(context).notes,
                  hintStyle: TextStyles.font28Blackreguler,
                  inputTextStyle: TextStyles.font28Blackreguler,
                  maxLines: 3,
                  validator: (p0) => null,
                ),
                verticalSpacing(SizeConfig.screenHeight! * .02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<RequestVaccationCubit, RequestVaccationState>(
                      builder: (context, state) {
                        return context.read<RequestVaccationCubit>().loading
                            ? MyProgressIndicator(
                                hight: SizeConfig.screenHeight! * .05,
                                width: SizeConfig.screenWidth! * .3)
                            : AppButtonText(
                                backGroundColor: ColorManger.lighterGreen,
                                buttonWidth: SizeConfig.screenWidth! * .3,
                                butonText: S.of(context).send,
                                textStyle: TextStyles.font28whiteReguler,
                                onPressed: () {
                                  validateThenAddVaccation(context);
                                },
                              );
                      },
                    ),
                    AppButtonText(
                      backGroundColor: ColorManger.darkRed,
                      buttonWidth: SizeConfig.screenWidth! * .3,
                      butonText: S.of(context).cancel,
                      textStyle: TextStyles.font28whiteReguler,
                      onPressed: () {
                        context.pushReplacementNamed(Routes.homeScreen);
                      },
                    ),
                  ],
                ),
                const RequestBlockListener()
              ],
            ),
          ),
        ),
      ),
    );
  }

  getAllVaccations(BuildContext context) {
    context.read<AllVaccationsCubit>().emitAllVaccationsState();
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
}
