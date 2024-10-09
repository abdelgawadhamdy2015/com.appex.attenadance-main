import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/shared_pref_helper.dart';
import 'package:ttech_attendance/core/helpers/size_config.dart';
import 'package:ttech_attendance/core/networking/api_constants.dart';
import 'package:ttech_attendance/core/networking/dio_factory.dart';
import 'package:ttech_attendance/core/networking/signal_r_service.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';
import 'package:ttech_attendance/featchers/login/ui/login_screen.dart';

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
            style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
            textAlign: TextAlign.center,
          ),
        )
      ]),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () async {
                context.pop();
                if (ApiConstants.dioExceptionType ==
                    DioExceptionType.badResponse) {
                  ApiConstants.dioExceptionType = DioExceptionType.unknown;
                  await SharedPrefHelper.clearAllData();
                  biometricStorageService.deleteToken();
                  DioFactory.deletTokenHeaderAfterLogOut();
                  navigatorKey.currentContext!
                      .pushReplacementNamed(Routes.loginScreen);
                }
              },
              child: Text(
                textAlign: TextAlign.center,
                actions[0],
                style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

setupLogOutDialogState(
  BuildContext context,
  String data,
  List<String> actions,
) {
  showDialog(
    context: navigatorKey.currentContext!,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.logout_outlined,
        color: Colors.amber,
        size: 32,
      ),
      content: Text(
        textAlign: TextAlign.center,
        data,
        style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end
          //   : MainAxisAlignment.start,
          ,
          children: [
            actions.length > 1
                ? TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      //cancel
                      actions[1],
                      style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
                    ),
                  )
                : Container(),
            actions.length > 1 ? const Spacer() : Container(),
            TextButton(
              onPressed: () async {
                context.pop();

                mySignalRService.stopConnection();

                SharedPrefHelper.clearAllData();
                biometricStorageService.deleteToken();
                DioFactory.deletTokenHeaderAfterLogOut();

                navigatorKey.currentContext!
                    .pushReplacementNamed(Routes.loginScreen);
              },
              child: Text(
                //"ok",
                actions[0],
                style: TextStyles.blackBoldStyle(SizeConfig.fontSize3!),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
