import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/arrow_back_widget.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class MyBottomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final BuildContext context;
  const MyBottomAppBar({super.key, required this.title, required this.context});

  @override
  State<MyBottomAppBar> createState() => BottomAppBarState();
  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * .01);
}

class BottomAppBarState extends State<MyBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManger.morelightGray,
      leading: const ArrowBackWidget(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Text(
              getTitle(),
              style: TextStyles.font14blackReguler,
            ),
          ),
        ],
      ),
    );
  }

  String getTitle() {
    switch (widget.title) {
      case myRequests:
        return S.of(context).requestLeave;

      case myTransactions:
        return S.of(context).transaction;
      case attendanceAndDepartureReports:
        return S.of(context).performancePanel;
      case mydepatures:
        return S.of(context).departures;

      default:
        return "";
    }
  }
}
