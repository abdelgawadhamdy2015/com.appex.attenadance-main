import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ttech_attendance/core/helpers/app_regex.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/shared_pref_helper.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_app_bar.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_drawer.dart';
import 'package:ttech_attendance/core/widgets/app_text_button.dart';
import 'package:ttech_attendance/core/widgets/indicator/my_progress_indicator.dart';
import 'package:ttech_attendance/core/widgets/mytextfile.dart';
import 'package:ttech_attendance/featchers/permission/data/models/permission_model.dart';
import 'package:ttech_attendance/featchers/permission/logic/cubit/permission_cubit.dart';
import 'package:ttech_attendance/featchers/permission/logic/cubit/permission_state.dart';
import 'package:ttech_attendance/featchers/permission/ui/widgets/add_permission_listener.dart';
import 'package:ttech_attendance/featchers/permission/ui/widgets/check_box_state.dart';
import 'package:ttech_attendance/featchers/permission/ui/widgets/list_shift_item.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key, required this.changeLanguage});
  final Function(Locale locale) changeLanguage;

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  String? _selectedEmployee;
  DateTime _selectedDate = DateTime.now();
  String _permissionType = 'Temporary';
  int shiftType = 0;

  final List<String> _employees = ['Alice', 'Bob', 'Charlie', 'David'];

  late PermissionCubit permissionCubit;
  @override
  void initState() {
    super.initState();
    getShiftType();
    permissionCubit = context.read<PermissionCubit>();
    permissionCubit.dayController.addListener(() {
      if (permissionCubit.formKey.currentState?.validate() ?? false) {
        setState(() {}); // Trigger a rebuild to clear the error border
      }
    });
    permissionCubit.totalHoursController.addListener(() {
      if (permissionCubit.formKey.currentState?.validate() ?? false) {
        setState(() {}); // Trigger a rebuild to clear the error border
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final checkboxState = Provider.of<CheckboxState>(context);
    if (kDebugMode) {
      print("Shift type is : --- $shiftType");
    }
    return Scaffold(
      appBar: MyAppBar(
          changeLanguage: widget.changeLanguage,
          context: context,
          title: MyConstants.myPermission),
      drawer: const Drawer(child: MyDrawer()),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: SizeConfig().getScreenPadding(),
            child: Form(
              key: permissionCubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dropdown for employee names
                  Visibility(
                    visible: false,
                    child: DropdownButtonFormField<String>(
                      hint: Text(S.of(context).name),
                      value: _selectedEmployee,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedEmployee = newValue;
                        });
                      },
                      items: _employees.map((String employee) {
                        return DropdownMenuItem<String>(
                          value: employee,
                          child: Text(employee),
                        );
                      }).toList(),
                    ),
                  ),
                  verticalSpacing(SizeConfig.screenHeight! * .02),
                  MyTextForm(
                      fillColor: ColorManger.lightGray,
                      readOnly: true,
                      labelText: S.of(context).date,
                      //hint: S.of(context).date,
                      excep: S.of(context).date,
                      suffixIcon: const Icon(Icons.calendar_today),
                      controller: context.read<PermissionCubit>().dayController,
                      onTab: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null && pickedDate != _selectedDate) {
                          setState(() {
                            _selectedDate = pickedDate;
                            permissionCubit.dayController.text = _selectedDate
                                .toLocal()
                                .toString()
                                .split(' ')[0];
                          });
                        }
                      }),
                  verticalSpacing(SizeConfig.screenHeight! * .02),

                  Text(S.of(context).permissionType),
                  verticalSpacing(SizeConfig.screenHeight! * .02),

                  // Radio buttons for permission type
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(S.of(context).temporary),
                          leading: Radio<String>(
                            activeColor: ColorManger.mainBlue,
                            value: 'Temporary',
                            groupValue: _permissionType,
                            onChanged: (String? value) {
                              setState(() {
                                _permissionType = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      verticalSpacing(SizeConfig.screenHeight! * .02),
                      Expanded(
                        child: ListTile(
                          title: Text(S.of(context).fullDay),
                          leading: Radio<String>(
                            activeColor: ColorManger.mainBlue,
                            value: 'FullDay',
                            groupValue: _permissionType,
                            onChanged: (String? value) {
                              setState(() {
                                _permissionType = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpacing(SizeConfig.screenHeight! * .02),

                  _permissionType == "Temporary"
                      ? shiftType != 1
                          ? BlocBuilder<PermissionCubit, PermissionState>(
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    const ListShiftItem(
                                      shift: 1,
                                      enabled: true,
                                    ),
                                    checkboxState.isChecked1 &&
                                            !checkboxState.shifttosecond1
                                        ? const ListShiftItem(
                                            shift: 2,
                                            enabled: true,
                                          )
                                        : const ListShiftItem(
                                            shift: 2,
                                            enabled: false,
                                          ),
                                    checkboxState.isChecked2 &&
                                            !checkboxState.shifttosecond2
                                        ? const ListShiftItem(
                                            shift: 3,
                                            enabled: true,
                                          )
                                        : const ListShiftItem(
                                            shift: 3,
                                            enabled: false,
                                          ),
                                    checkboxState.isChecked3 &&
                                            !checkboxState.shifttosecond3
                                        ? const ListShiftItem(
                                            shift: 4,
                                            enabled: true,
                                          )
                                        : const ListShiftItem(
                                            shift: 4,
                                            enabled: false,
                                          )
                                  ],
                                );
                              },
                            )
                          : Row(
                              children: [
                                Text(S.of(context).timesOfWork),
                                horizontalSpacing(
                                    SizeConfig.screenWidth! * .02),
                                Expanded(
                                  child: MyTextForm(
                                    controller:
                                        permissionCubit.totalHoursController,
                                    labelText: S.of(context).timesOfWork,
                                    hintText: "ex 7:30",
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "\u26A0 ${S.of(context).pleaseFill} ${S.of(context).timesOfWork} ";
                                      } else if (!AppRegex.hasMatchesTimeFormat(
                                          value)) {
                                        return "\u26A0 ${S.of(context).matchTimeFormat}";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            )
                      : Container(),
                  verticalSpacing(SizeConfig.screenHeight! * .02),
                  TextField(
                    controller: permissionCubit.noteController,
                    decoration: InputDecoration(
                      labelText: S.of(context).notes,
                      labelStyle: TextStyles.font12black54Reguler,
                      border: const OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  const AddPermissionListener(),
                  verticalSpacing(SizeConfig.screenHeight! * .02),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth! * .016,
                        vertical: SizeConfig.screenHeight! * .016),
                    child: BlocBuilder<PermissionCubit, PermissionState>(
                      builder: (context, state) {
                        return context.read<PermissionCubit>().loading
                            ? MyProgressIndicator(
                                hight: SizeConfig.screenHeight! * .08,
                                width: SizeConfig.screenWidth! * .08)
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.screenWidth! * .1),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      AppButtonText(
                                        buttonWidth:
                                            SizeConfig.screenWidth! * .3,
                                        backGroundColor:
                                            ColorManger.buttonGreen,
                                        textStyle: TextStyles.font15WhiteBold,
                                        onPressed: () {
                                          validateThenAddAttendancePermission(
                                              context, checkboxState);
                                        },
                                        butonText: S.of(context).send,
                                      ),
                                    ]),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getShiftType() async {
    shiftType = await SharedPrefHelper.getInt(MyConstants.shiftType);

    setState(() {});
  }

  void validateThenAddAttendancePermission(
      BuildContext context, CheckboxState checkboxState) {
    if (permissionCubit.formKey.currentState!.validate()) {
      context.read<PermissionCubit>().emitAddPermissionState(
            PermissionModel(
              day: _selectedDate,
              shift1_start: permissionCubit.attendanceController1.text,
              shift1_end: permissionCubit.leaveControoler1.text,
              shift2_start: permissionCubit.attendanceController2.text,
              shift2_end: permissionCubit.leaveControoler2.text,
              shift3_start: permissionCubit.attendanceController3.text,
              shift3_end: permissionCubit.leaveControoler3.text,
              shift4_start: permissionCubit.attendanceController4.text,
              shift4_end: permissionCubit.leaveControoler4.text,
              isMobile: true,
              shift1_IsExtended: checkboxState.shifttosecond1,
              shift2_IsExtended: checkboxState.shifttosecond2,
              shift3_IsExtended: checkboxState.shifttosecond3,
              shift4_IsExtended: checkboxState.shifttosecond4,
              Note: permissionCubit.noteController.text,
              Has_shift2: checkboxState.isChecked2,
              Has_shift3: checkboxState.isChecked3,
              Has_shift4: checkboxState.isChecked4,
              type: getType(),
              totalHoursForOpenShift: permissionCubit.totalHoursController.text,
            ),
          );
    }
  }

  getType() {
    return _permissionType == "Temporary" ? 2 : 1;
  }
}
