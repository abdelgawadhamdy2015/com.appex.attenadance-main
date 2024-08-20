import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
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
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();

  void selectTime(BuildContext context, bool isStart) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      final now = DateTime.now();
      final dateTime = DateTime(
          now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
      setState(() {
        isStart
            ? startController.text = selectedTime.format(context)
            : endController.text = selectedTime.format(context);
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
                          TextField(
                            controller: startController,
                            decoration: InputDecoration(
                              labelText: S.of(context).attendanceTime,
                              border: const OutlineInputBorder(),
                              suffixIcon: const Icon(Icons.access_time),
                            ),
                            readOnly: true,
                            onTap: () {
                              selectTime(context, true);
                            },
                          ),
                          verticalSpacing(SizeConfig.screenHeight! * .02),
                          TextField(
                            controller: endController,
                            decoration: InputDecoration(
                              labelText: S.of(context).leaveTime,
                              border: const OutlineInputBorder(),
                              suffixIcon: const Icon(Icons.access_time),
                            ),
                            readOnly: true,
                            onTap: () {
                              selectTime(context, false);
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
}
