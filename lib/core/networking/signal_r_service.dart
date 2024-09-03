// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/networking/api_constants.dart';
import 'package:ttech_attendance/core/networking/api_error_model.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';
import 'package:ttech_attendance/featchers/login/ui/login_screen.dart';
import 'package:ttech_attendance/generated/l10n.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class SignalRService {
  HubConnection? hubConnection;

  SignalRService();
  Future<void> startConnection(String token) async {
    hubConnection = HubConnectionBuilder()
        .withUrl(
          '${ApiConstants.apiBaseUrl}NotificationHub',
          HttpConnectionOptions(
            accessTokenFactory: () async => token,
          ),
        )
        .build();
    print("connected to signal service");
    await hubConnection?.start();
    hubConnection!.on('LogoutNotification', (message) {
      List? listMessage = message;
      Map<String, dynamic> map = listMessage!.first;
      final context = navigatorKey.currentContext;
      ApiErrorModel apiErrorModel = ApiErrorModel.fromJson(map);
      try {
        setupLogOutDialogState(
            context!,
            Intl.defaultLocale == MyConstants.arabic
                ? apiErrorModel.errorMessageAr!
                : apiErrorModel.errorMessageEn!,
            [S.of(context).okDialog]
            );
        print(map);
        stopConnection();
      } catch (error) {
        print(error);
      }
    });
    mySignalRService = this;
  }

  void stopConnection() {
    hubConnection?.stop();
    hubConnection!.state == HubConnectionState.disconnected
        ? print("signalRService stopped")
        : print("signalRService ${hubConnection!.state}");
  }

  void listenToMessages(Function(String) onMessageReceived) {
    hubConnection?.on('LogoutNotification', (arguments) {
      final user = arguments![0] as ApiErrorModel;
      // final message = arguments[1] as String;
      onMessageReceived(user.errorMessageEn!);
    });
  }

  Future<void> sendMessage(String user, String message) async {
    await hubConnection?.invoke('SendMessage', args: [user, message]);
  }
}
