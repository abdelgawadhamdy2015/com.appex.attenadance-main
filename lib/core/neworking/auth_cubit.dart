// import 'package:bloc/bloc.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:web_socket_channel/status.dart' as status;
//
// class AuthCubit extends Cubit<bool> {
//   WebSocketChannel? _channel;
//
//   AuthCubit() : super(true);
//
//   void connect() {
//     _channel = WebSocketChannel.connect(Uri.parse('ws://your.websocket.url'));
//
//     _channel!.stream.listen((message) {
//       if (message == 'logout') {
//         emit(false);
//       }
//     });
//   }
//
//   void disconnect() {
//     _channel?.sink.close(status.goingAway);
//   }
//
//   @override
//   Future<void> close() {
//     disconnect();
//     return super.close();
//   }
// }