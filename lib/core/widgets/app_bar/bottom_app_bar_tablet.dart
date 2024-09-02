import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/app_bar/arrow_back_widget.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class MyBottomAppBarTablet extends StatefulWidget
    implements PreferredSizeWidget {
  final String title;
  final BuildContext context;
  const MyBottomAppBarTablet(
      {super.key, required this.title, required this.context});

  @override
  State<MyBottomAppBarTablet> createState() => MyBottomAppBarTabletState();
  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.screenHeight! * .01);
}

class MyBottomAppBarTabletState extends State<MyBottomAppBarTablet> {
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
              style: TextStyles.font30BlueBold,
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
      case MyConstants.permission:
        return S.of(context).RequestPermission;

      default:
        return "";
    }
  }
}
