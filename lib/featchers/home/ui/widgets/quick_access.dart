import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../../../../core/helpers/size_config.dart';

class QuickAccess extends StatelessWidget {
  const QuickAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! * .05,
            vertical: SizeConfig.screenHeight! * .01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).quickAccessList,
              style: TextStyles.darkBlueBoldStyle(SizeConfig.fontSize4!),
            ),
            verticalSpacing(SizeConfig.screenHeight! * .01),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildQuickAccessButton(
                    "assets/out_in.png",
                    S.of(context).transaction,
                    context,
                    MyConstants.myTransactions),
                _buildQuickAccessButton("assets/credit.png",
                    S.of(context).credits, context, MyConstants.credits),
                _buildQuickAccessButton(
                    "assets/reports.png",
                    S.of(context).attendanceAndDepartureReports,
                    context,
                    MyConstants.attendanceAndDepartureReports),
                _buildQuickAccessButton("assets/request.png",
                    S.of(context).myRequests, context, MyConstants.myRequests),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAccessButton(
      String icon, String label, BuildContext context, String id) {
    return InkWell(
      onTap: () {
        switch (id) {
          case MyConstants.myTransactions:
            context.pushReplacementNamed(Routes.attendaceScreen);
          case MyConstants.myRequests:
            context.pushReplacementNamed(Routes.requestFormScreen);
          case MyConstants.attendanceAndDepartureReports:
            context.pushReplacementNamed(Routes.performancePanelScreen);
          case MyConstants.credits:
            context.pushReplacementNamed(Routes.departuresScreen);
          // case MyConstants.salaries:
          //context.pushReplacementNamed(Routes.permissionScreen);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: SizeConfig.screenHeight! * .01,
            horizontal: SizeConfig.screenWidth! * .01),
        decoration: BoxDecoration(
            color: ColorManger.lightGray,
            borderRadius: BorderRadius.circular(40)),
        //color: ColorManger.lightGray,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FittedBox(
              child: Image.asset(
                icon,
                height: SizeConfig.screenHeight! * .05,
              ),
            ),
            FittedBox(
              fit: BoxFit.cover,
              child: Text(
                label,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
