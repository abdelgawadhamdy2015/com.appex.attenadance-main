import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class QuickAccessTablet extends StatelessWidget {
  const QuickAccessTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).quickAccessList,
              style: TextStyles.font30BlackBold,
            ),
            verticalSpacing(16),
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
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                switch (id) {
                  case MyConstants.myTransactions:
                    context.pushReplacementNamed(Routes.attendaceScreen);
                    break;
                  case MyConstants.myRequests:
                    context.pushReplacementNamed(Routes.requestFormScreen);
                  case MyConstants.attendanceAndDepartureReports:
                    context.pushReplacementNamed(Routes.performancePanelScreen);
                  case MyConstants.credits:
                    context.pushReplacementNamed(Routes.departuresScreen);

                  default:
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.w),
              ),
              child: Image.asset(
                icon,
                height: MediaQuery.of(context).size.height * .1,
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
                style: TextStyles.font20Black54reguler,
              ),
            ),
          ],
        ),
      ),
    );}}