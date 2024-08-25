import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
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
  Size get preferredSize => Size.fromHeight(SizeConfig.screenHeight! * .01);
}

class BottomAppBarState extends State<MyBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManger.backGroundGray,
      leading: const ArrowBackWidget(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Text(
              getTitle(),
              style: TextStyles.font20BlueBold,
            ),
          ),
        ],
      ),
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
      case MyConstants.myPermission:
        return S.of(context).permission;

      default:
        return "";
    }
  }
}
