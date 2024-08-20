import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
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
            horizontal: SizeConfig.screenWidth! * .016,
            vertical: SizeConfig.screenHeight! * .016),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).quickAccessList,
              style: TextStyles.font12blackBold,
            ),
            verticalSpacing(SizeConfig.screenHeight! * .016),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              mainAxisSpacing: 10,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildQuickAccessButton("assets/out_in.png",
                    S.of(context).transaction, context, MyConstants.myTransactions),
                _buildQuickAccessButton("assets/credit.png",
                    S.of(context).credits, context, MyConstants.credits),
                _buildQuickAccessButton("assets/sallary.png",
                    S.of(context).salaries, context, MyConstants.salaries),
                _buildQuickAccessButton("assets/work-time.png",
                    S.of(context).timesOfWork, context, MyConstants.timesOfWork),
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
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! * .005,
            vertical: SizeConfig.screenHeight! * .005),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                switch (id) {
                  case MyConstants.myTransactions:
                    context.pushReplacementNamed(Routes.attendaceScreen);
                  case MyConstants.myRequests:
                    context.pushReplacementNamed(Routes.requestFormScreen);
                  case MyConstants.attendanceAndDepartureReports:
                    context.pushReplacementNamed(Routes.performancePanelScreen);
                  case MyConstants.credits:
                    context.pushReplacementNamed(Routes.departuresScreen);
                  case MyConstants.salaries:
                    context.pushReplacementNamed(Routes.permissionScreen);
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth! * .01,
                    vertical: SizeConfig.screenHeight! * .01),
              ),
              child: Image.asset(
                icon,
                height: SizeConfig.screenHeight! * .04,
              ),
            ),
            const Spacer(),
            FittedBox(
              fit: BoxFit.cover,
              child: Text(
                label,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font12black54Reguler,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
