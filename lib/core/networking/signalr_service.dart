import 'package:signalr_core/signalr_core.dart';
import 'package:ttech_attendance/core/networking/api_constants.dart';

class SignalRService {
  final hubConnection = HubConnectionBuilder().withUrl(
    '${ApiConstants.apiBaseUrl}NotificationHub/',
    HttpConnectionOptions(
      accessTokenFactory: () async => ApiConstants.authToken,
    ),
  ).build();

  Future<void> startConnection() async {
    await hubConnection.start();
    print('SignalR Connected');
  }

  void stopConnection() {
    hubConnection.stop();
  }

  void listenToMessages(Function(String, String) onMessageReceived) {
    hubConnection.on('ReceiveMessage', (arguments) {
      final user = arguments![0] as String;
      final message = arguments[1] as String;
      onMessageReceived(user, message);
    });
  }

  Future<void> sendMessage(String user, String message) async {
    await hubConnection.invoke('SendMessage', args: [user, message]);
  }
}
