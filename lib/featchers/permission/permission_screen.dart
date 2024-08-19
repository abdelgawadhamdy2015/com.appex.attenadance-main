import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_bar/my_app_bar.dart';
import 'package:ttech_attendance/featchers/permission/widgets/list_shift_item.dart';
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
                    hint: Text(S.of(context).email),
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
                      ? const Column(
                          children: [
                            ListShiftItem(
                              shift: 1,
                            ),
                            ListShiftItem(
                              shift: 2,
                            ),
                            ListShiftItem(
                              shift: 3,
                            ),
                            ListShiftItem(
                              shift: 4,
                            ),
                          ],
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
