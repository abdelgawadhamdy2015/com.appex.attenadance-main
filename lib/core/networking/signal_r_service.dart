
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/networking/api_constants.dart';
import 'package:ttech_attendance/core/networking/api_error_model.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';

class SignalRService {
  HubConnection? hubConnection;
  BuildContext context;
SignalRService(this.context);
  Future<void> startConnection(String token) async {
   try{
     hubConnection = HubConnectionBuilder().withUrl(
       'http://192.168.1.253:60/NotificationHub',
       HttpConnectionOptions(
         accessTokenFactory: () async => token,
       ),
     ).build();

     await hubConnection?.start();
     hubConnection!.on("LogoutNotification",(message){
     ApiConstants.dioExceptionType=DioExceptionType.connectionTimeout;

        List? listMessage= message;
        Map<String ,dynamic> map =listMessage!.first;
      ApiConstants.dioExceptionType= DioExceptionType.badResponse;
     ApiErrorModel apiErrorModel=ApiErrorModel.fromJson(map);
        setupDialogState(context,Intl.defaultLocale==arabic? apiErrorModel.errorMessageAr!: apiErrorModel.errorMessageEn!, true);
     });
   }catch (error){
    setupDialogState(context, error.toString(), true);
   }
  }

  void stopConnection() {
    hubConnection?.stop();
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