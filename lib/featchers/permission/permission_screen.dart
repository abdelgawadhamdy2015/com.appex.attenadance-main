import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/networking/api_constants.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_app_bar.dart';
import 'package:ttech_attendance/featchers/permission/logic/cubit/permission_cubit.dart';
import 'package:ttech_attendance/featchers/permission/logic/cubit/permission_state.dart';
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

  final List<String> _employees = ['Alice', 'Bob', 'Charlie', 'David'];

  var notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final checkboxState = Provider.of<CheckboxState>(context);

    return Scaffold(
        appBar: MyAppBar(
          changeLanguage: widget.changeLanguage,
          title: S.of(context).permission,
          context: context,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: SizeConfig().getScreenPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dropdown for employee names
                  DropdownButtonFormField<String>(
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
                  verticalSpacing(SizeConfig.screenHeight! * .02),
                  // Text field for date
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: S.of(context).date,
                      hintText:
                          _selectedDate.toLocal().toString().split(' ')[0],
                      suffixIcon: const Icon(Icons.calendar_today),
                    ),
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null && pickedDate != _selectedDate) {
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      }
                    },
                  ),
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
                      : Container(),
                  verticalSpacing(SizeConfig.screenHeight! * .02),
                  TextField(
                    controller: notesController,
                    decoration: InputDecoration(
                      labelText: S.of(context).notes,
                      labelStyle: TextStyles.font12black54Reguler,
                      border: const OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  verticalSpacing(SizeConfig.screenHeight! * .02),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth! * .016,
                        vertical: SizeConfig.screenHeight! * .016),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // validateThenAddVaccation(context);
                          },
                          child: Text(
                            S.of(context).send,
                            style: TextStyles.font16BlueBold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.pushReplacementNamed(Routes.homeScreen);
                          },
                          child: Text(
                            S.of(context).cancel,
                            style: TextStyles.font16BlueBold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
