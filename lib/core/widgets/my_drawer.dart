// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/shared_pref_helper.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Apex Attendance'),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: Text(S.of(context).logout),
          onTap: () async {
           
           SharedPrefHelper.clearAllData();
           SharedPrefHelper.clearAllSecuredData();
            context.pushReplacementNamed(Routes.loginScreen);
          },
        ),
      ],
    );
  }
}
