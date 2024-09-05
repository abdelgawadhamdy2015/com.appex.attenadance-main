// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/networking/signal_r_service.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManger.darkBlue,
      width: SizeConfig.screenWidth! * .5,
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth! * .01,
                  vertical: SizeConfig.screenHeight! * .01),
              width: SizeConfig.screenWidth! * .4,
              height: SizeConfig.screenHeight! * .1,
              decoration: const BoxDecoration(
                color: ColorManger.darkBlue,
              ),
              child: Text(
                'Apex Attendance',
                style: TextStyles.blackBoldStyle(SizeConfig.fontSize4!),
              ),
            ),
            verticalSpacing(SizeConfig.screenHeight! * .03),
            Padding(
              padding: SizeConfig().getScreenPadding(),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                InkWell(
                  child: Text(
                    S.of(navigatorKey.currentContext!).logout,
                    style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
                  ),
                  onTap: () {
                    setupLogOutDialogState(context, S.of(context).needSignOut, [
                      S.of(navigatorKey.currentContext!).okDialog,
                      S.of(navigatorKey.currentContext!).cancel
                    ]);
                  },
                ),
                horizontalSpacing(SizeConfig.screenWidth! * .01),
                Expanded(
                  child: Icon(
                    Icons.logout_outlined,
                    color: ColorManger.darkBlue,
                    size: SizeConfig.screenWidth! * .05,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
