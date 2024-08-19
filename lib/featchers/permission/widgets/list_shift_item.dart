import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';

class ListShiftItem extends StatefulWidget {
  const ListShiftItem({super.key, required this.shift});
  final int shift;

  @override
  State<ListShiftItem> createState() => _ListShiftItemState();
}

class _ListShiftItemState extends State<ListShiftItem> {
  bool _shiftActive = false;
  bool _shiftToSecondDay = false;
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          CheckboxListTile(
            title: Text(getShift(widget.shift, context)),
            value: _shiftActive,
            onChanged: (bool? value) {
              setState(() {
                _shiftActive = value!;
              });
            },
            subtitle: _shiftActive
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
                        value: _shiftToSecondDay,
                        onChanged: (bool? value) {
                          setState(() {
                            _shiftToSecondDay = value!;
                          });
                        },
                      ),
                    ],
                  )
                : null,
          )
        ],
      ),
    );
  }
}
