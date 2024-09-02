import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class MyBottomAppBarTablet extends StatefulWidget {
  final String title;
  const MyBottomAppBarTablet({super.key, required this.title});

  @override
  State<MyBottomAppBarTablet> createState() => _MyBottomAppBarTabletState();
}

class _MyBottomAppBarTabletState extends State<MyBottomAppBarTablet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: Text(
            getTitle(),
            style: TextStyles.font35BlackBold,
          ),
        ),
      ],
    );
  }

  String getTitle() {
    switch (widget.title) {
      case MyConstants.myRequests:
        return S.of(context).requestLeave;

      case MyConstants.myTransactions:
        return S.of(context).transaction;
      case MyConstants.attendanceAndDepartureReports:
        return S.of(context).performancePanel;
      case MyConstants.mydepatures:
        return S.of(context).departures;

      default:
        return "";
    }
  }
}
