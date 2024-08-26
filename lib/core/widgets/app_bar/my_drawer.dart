// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/helper_methods.dart';
import 'package:ttech_attendance/core/helpers/shared_pref_helper.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
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
            child: Text(S.of(context).logout),
            onTap: () {
              setupLogOutDialogState(context, S.of(context).needSignOut,
                  [S.of(context).okDialog, S.of(context).cancel], null);
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

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content:
              const Text('Are you sure you want to go to the login screen?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                SharedPrefHelper.clearAllData();
                SharedPrefHelper.clearAllSecuredData();
                context.pushReplacementNamed("/");
                // .pushNamed("/"); // Navigate to login screen
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
