import 'package:flutter/material.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/networking/signal_r_service.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/theming/text_styles.dart';

setupDialogState(BuildContext context, String data, bool isError) {
  //!loginScreen! ? context.pop() : "";
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: Icon(
        isError ? Icons.error : Icons.done,
        color: isError ? Colors.red : Colors.green,
        size: 32,
      ),
      content: Text(
        data,
        style: TextStyles.font16BlackBold,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();


          },
          child: Text(
            'OK',
            style: TextStyles.font16BlackBold,
          ),
        ),
      ],
    ),
  );
}

setupLogOutDialogState(BuildContext context, String data,
    SignalRService signalService) {
  //!loginScreen! ? context.pop() : "";
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
         Icons.error ,
        color:  Colors.red ,
        size: 32,
      ),
      content: Text(
        data,
        style: TextStyles.font16BlackBold,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
            signalService.stopConnection();
            context.pushReplacementNamed(Routes.loginScreen);
          },
          child: Text(
            'OK',
            style: TextStyles.font16BlackBold,
          ),
        ),
      ],
    ),
  );
}
