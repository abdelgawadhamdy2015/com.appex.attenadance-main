import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/shared_pref_helper.dart';
import 'package:ttech_attendance/core/networking/signal_r_service.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/generated/l10n.dart';

setupDialogState(BuildContext context, String data, bool isError) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: Icon(
        isError ? Icons.error : Icons.done,
        color: isError ? Colors.red : Colors.green,
        size: 32,
      ),
      content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          data,
          style: TextStyles.font16BlackBold,
        )
      ]),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
            //SharedPrefHelper.clearAllData();
            // SharedPrefHelper.clearAllSecuredData();

            // context.pushReplacementNamed(Routes.loginScreen);
          },
          child: Text(
            textAlign: TextAlign.center,
            "ok",
            // S.of(context).okDialog,
            style: TextStyles.font16BlackBold,
          ),
        ),
      ],
    ),
  );
}

setupLogOutDialogState(
    BuildContext context, String data, SignalRService signalService) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        textAlign: TextAlign.center,
        data,
        style: TextStyles.font16BlackBold,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
            signalService.stopConnection();
            SharedPrefHelper.clearAllData();
            SharedPrefHelper.clearAllSecuredData();

            context.pushReplacementNamed(Routes.loginScreen);
          },
          child: Text(
            "ok",
            // S.of(context).okDialog,
            style: TextStyles.font16BlackBold,
          ),
        ),
      ],
    ),
  );
}
