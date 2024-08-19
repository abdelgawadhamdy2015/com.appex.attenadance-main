import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/featchers/permission/data/models/shift_model.dart';
import 'package:ttech_attendance/featchers/permission/logic/cubit/permission_cubit.dart';
import 'package:ttech_attendance/featchers/permission/logic/cubit/permission_state.dart';
import 'package:ttech_attendance/featchers/permission/ui/widgets/check_box_state.dart';

class ListShiftItem extends StatefulWidget {
  const ListShiftItem({super.key, required this.shift, required this.enabled});
  final int shift;
  final bool enabled;

  @override
  State<ListShiftItem> createState() => _ListShiftItemState();
}

class _ListShiftItemState extends State<ListShiftItem> {
  // bool _shiftActive = false;
  bool _shiftToSecondDay = false;

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
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
                  context.read<PermissionCubit>().shiftChecks.add(ShiftModel(
                      widget.shift,
                      value!,
                      false,
                      "",
                      "endTime")); // print(context.read<PermissionCubit>().shiftChecks[0]);
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
                          TextField(
                            controller: _startDateController,
                            decoration: const InputDecoration(
                              labelText: 'Start Date',
                            ),
                            keyboardType: TextInputType.datetime,
                          ),
                          const SizedBox(height: 8.0),
                          TextField(
                            controller: _endDateController,
                            decoration: const InputDecoration(
                              labelText: 'End Date',
                            ),
                            keyboardType: TextInputType.datetime,
                          ),
                          const SizedBox(height: 8.0),
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
