import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/shared_pref_helper.dart';
import 'package:ttech_attendance/core/networking/api_constants.dart';
import 'package:ttech_attendance/core/networking/signal_r_service.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';

setupDialogState(
    BuildContext context, String data, List<String> actions, bool isError) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: Icon(
        isError ? Icons.error : Icons.done,
        color: isError ? Colors.red : Colors.green,
        size: 32,
      ),
      content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          flex: 1,
          child: Text(
            data,
            style: TextStyles.font16BlackBold,
            textAlign: TextAlign.center,
          ),
        )
      ]),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                context.pop();
                if (ApiConstants.dioExceptionType ==
                    DioExceptionType.badResponse) {
                  ApiConstants.dioExceptionType = DioExceptionType.unknown;
                  SharedPrefHelper.clearAllData();
                  SharedPrefHelper.clearAllSecuredData();
                  context.pushReplacementNamed(Routes.loginScreen);
                }
              },
              child: Text(
                textAlign: TextAlign.center,
                actions[0],
                style: TextStyles.font16BlackBold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

setupLogOutDialogState(BuildContext context, String data, List<String> actions,
    SignalRService? signalService) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.logout_outlined,
        color: Colors.amber,
        size: 32,
      ),
      content: Text(
        textAlign: TextAlign.center,
        data,
        style: TextStyles.font16BlackBold,
      ),
      actions: [
        Row(
          mainAxisAlignment: actions.length > 1
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
          children: [
            actions.length > 1
                ? TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      //cancel
                      actions[1],
                      style: TextStyles.font16BlackBold,
                    ),
                  )
                : Container(),
            TextButton(
              onPressed: () {
                context.pop();
                if (signalService != null) {
                  signalService.stopConnection();
                }
                SharedPrefHelper.clearAllData();
                SharedPrefHelper.clearAllSecuredData();
                context.pushReplacementNamed(Routes.loginScreen);
              },
              child: Text(
                //"ok",
                actions[0],
                style: TextStyles.font16BlackBold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
