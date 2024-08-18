// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/networking/api_error_model.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';

class SignalRService {
  HubConnection? hubConnection;
  BuildContext context;
  SignalRService(this.context);
  Future<void> startConnection(String token) async {
    hubConnection = HubConnectionBuilder()
        .withUrl(
          'http://192.168.1.253:60/NotificationHub',
          HttpConnectionOptions(
            accessTokenFactory: () async => token,
          ),
        )
        .build();

    await hubConnection?.start();
    hubConnection!.on("LogoutNotification", (message) {
      List? listMessage = message;
      Map<String, dynamic> map = listMessage!.first;
      ApiErrorModel apiErrorModel = ApiErrorModel.fromJson(map);
      setupLogOutDialogState(
          context,
          Intl.defaultLocale == arabic
              ? apiErrorModel.errorMessageAr!
              : apiErrorModel.errorMessageEn!,
          this);
    });
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
