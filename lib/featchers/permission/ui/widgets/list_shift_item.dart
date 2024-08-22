import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/widgets/mytextfile.dart';
import 'package:ttech_attendance/featchers/permission/data/models/shift_model.dart';
import 'package:ttech_attendance/featchers/permission/logic/cubit/permission_cubit.dart';
import 'package:ttech_attendance/featchers/permission/logic/cubit/permission_state.dart';
import 'package:ttech_attendance/featchers/permission/ui/widgets/check_box_state.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class ListShiftItem extends StatefulWidget {
  const ListShiftItem({super.key, required this.shift, required this.enabled});
  final int shift;
  final bool enabled;

  @override
  State<ListShiftItem> createState() => _ListShiftItemState();
}

class _ListShiftItemState extends State<ListShiftItem> {
  void selectTime(BuildContext context, bool isStart) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      final now = DateTime.now();
      DateTime(
          now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
      setState(() {
        setTextToController(widget.shift, isStart,
            "${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, "0")}");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    final cubit = context.read<PermissionCubit>();

    // List of controllers
    final controllers = [
      cubit.attendanceController1,
      cubit.leaveControoler1,
      cubit.attendanceController2,
      cubit.leaveControoler2,
      cubit.attendanceController3,
      cubit.leaveControoler3,
      cubit.attendanceController4,
      cubit.leaveControoler4,
    ];

    // Add listeners to all controllers
    for (final controller in controllers) {
      controller.addListener(() {
        if (cubit.formKey.currentState?.validate() ?? false) {
          setState(() {}); // Trigger a rebuild to clear the error border
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final checkboxState = Provider.of<CheckboxState>(context);

    return Container(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<PermissionCubit, PermissionState>(
        builder: (context, state) {
          return Column(
            children: [
              CheckboxListTile(
                enabled: widget.enabled,
                title: Text(getShift(widget.shift, context)),
                value: getCheckBoxId(widget.shift, checkboxState),
                onChanged: (bool? value) {
                  context.read<PermissionCubit>().shiftChecks.add(
                      ShiftModel(widget.shift, value!, false, "", "endTime"));
                  setState(() {
                    switch (widget.shift) {
                      case 1:
                        checkboxState.isChecked1 = value;
                        break;
                      case 2:
                        checkboxState.isChecked2 = value;
                        break;
                      case 3:
                        checkboxState.isChecked3 = value;
                        break;
                      case 4:
                        checkboxState.isChecked4 = value;
                        break;
                      default:
                    }
                  });
                },
                subtitle: getCheckBoxId(widget.shift, checkboxState)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpacing(SizeConfig.screenHeight! * .02),
                          MyTextForm(
                            onEditingComplete: () => setState(() {}),
                            onSaved: (p0) => setState(() {}),
                            excep: S.of(context).attendanceTime,
                            onChanged: (value) {
                              setState(() {});
                            },
                            controller: getController(widget.shift, true),
                            labelText: S.of(context).attendanceTime,
                            suffixIcon: const Icon(Icons.access_time),
                            readOnly: true,
                            onTab: () {
                              selectTime(context, true);
                            },
                            validator: (value) {
                              return validate(value ?? "", context,
                                  S.of(context).attendanceTime);
                            },
                          ),
                          verticalSpacing(SizeConfig.screenHeight! * .02),
                          MyTextForm(
                            excep: S.of(context).leaveTime,
                            controller: getController(widget.shift, false),
                            labelText: S.of(context).leaveTime,
                            suffixIcon: const Icon(Icons.access_time),
                            readOnly: true,
                            onTab: () {
                              selectTime(context, false);
                            },
                            validator: (value) {
                              return validate(value ?? "", context,
                                  S.of(context).leaveTime);
                            },
                          ),
                          verticalSpacing(SizeConfig.screenHeight! * .02),
                          CheckboxListTile(
                              title: const Text('Shift to Second Day'),
                              value:
                                  getShiftToSecond(widget.shift, checkboxState),
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    switch (widget.shift) {
                                      case 1:
                                        checkboxState.shifttosecond1 = value!;
                                        break;
                                      case 2:
                                        checkboxState.shifttosecond2 = value!;
                                        break;
                                      case 3:
                                        checkboxState.shifttosecond3 = value!;
                                        break;
                                      case 4:
                                        checkboxState.shifttosecond4 = value!;
                                        break;
                                      default:
                                    }
                                  },
                                );
                              })
                        ],
                      )
                    : null,
              )
            ],
          );
        },
      ),
    );
  }

  getCheckBoxId(int shift, CheckboxState checkboxState) {
    switch (shift) {
      case 1:
        return checkboxState.isChecked1;
      case 2:
        return checkboxState.isChecked2;
      case 3:
        return checkboxState.isChecked3;
      case 4:
        return checkboxState.isChecked4;
      default:
    }
  }

  getShiftToSecond(int shift, CheckboxState checkboxState) {
    switch (shift) {
      case 1:
        return checkboxState.shifttosecond1;
      case 2:
        return checkboxState.shifttosecond2;
      case 3:
        return checkboxState.shifttosecond3;
      case 4:
        return checkboxState.shifttosecond4;
      default:
    }
  }

  getController(int shift, bool isAttendance) {
    switch (shift) {
      case 1:
        return isAttendance
            ? context.read<PermissionCubit>().attendanceController1
            : context.read<PermissionCubit>().leaveControoler1;
      case 2:
        return isAttendance
            ? context.read<PermissionCubit>().attendanceController2
            : context.read<PermissionCubit>().leaveControoler2;
      case 3:
        return isAttendance
            ? context.read<PermissionCubit>().attendanceController3
            : context.read<PermissionCubit>().leaveControoler3;
      case 4:
        return isAttendance
            ? context.read<PermissionCubit>().attendanceController4
            : context.read<PermissionCubit>().leaveControoler4;
      default:
    }
  }

  setTextToController(int shift, bool isAttendance, String time) {
    switch (shift) {
      case 1:
        isAttendance
            ? context.read<PermissionCubit>().attendanceController1.text = time
            : context.read<PermissionCubit>().leaveControoler1.text = time;
      case 2:
        return isAttendance
            ? context.read<PermissionCubit>().attendanceController2.text = time
            : context.read<PermissionCubit>().leaveControoler2.text = time;
      case 3:
        return isAttendance
            ? context.read<PermissionCubit>().attendanceController3.text = time
            : context.read<PermissionCubit>().leaveControoler3.text = time;
      case 4:
        return isAttendance
            ? context.read<PermissionCubit>().attendanceController4.text = time
            : context.read<PermissionCubit>().leaveControoler4.text = time;
      default:
    }
    setState(() {});
  }
}
