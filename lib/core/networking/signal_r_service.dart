
import 'package:dio/dio.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:ttech_attendance/core/networking/api_constants.dart';
import 'package:ttech_attendance/core/networking/api_error_model.dart';

class SignalRService {
  HubConnection? hubConnection;

  Future<void> startConnection(String token) async {
   try{
     hubConnection = HubConnectionBuilder().withUrl(
       '${ApiConstants.apiBaseUrl}NotificationHub',
       HttpConnectionOptions(
         accessTokenFactory: () async => token,
       ),
     ).build();

     await hubConnection?.start();
     hubConnection!.on("LogoutNotification",(message){
     ApiConstants.dioExceptionType=DioExceptionType.connectionTimeout;
        print(message);
     });
     print('SignalR Connected');
   }catch (error){
     print( "SignalR connection error :  ${error.toString()}");
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