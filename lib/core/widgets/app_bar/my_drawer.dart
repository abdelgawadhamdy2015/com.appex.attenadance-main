// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/networking/signal_r_service.dart';
import 'package:ttech_attendance/core/theming/colors.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,

      children: [
        Container(
          padding: EdgeInsets.only(
              right: SizeConfig.screenWidth! * .1,
              top: SizeConfig.screenHeight! * .1),
          width: SizeConfig.screenWidth! * .4,
          height: SizeConfig.screenHeight! * .15,
          decoration: const BoxDecoration(
            color: ColorManger.darkBlue,
          ),
          child: const Text('Apex Attendance'),
        ),
        verticalSpacing(SizeConfig.screenHeight! * .03),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
            child: Text(S.of(navigatorKey.currentContext!).logout),
            onTap: () {
              setupLogOutDialogState(context, S.of(context).needSignOut, [
                S.of(navigatorKey.currentContext!).okDialog,
                S.of(navigatorKey.currentContext!).cancel
              ]);
            },
          ),
          horizontalSpacing(SizeConfig.screenWidth! * .1),
          const Icon(
            Icons.logout_outlined,
            color: ColorManger.darkBlue,
            size: 32,
          ),
        ]),
      ],
    );
  }
}
