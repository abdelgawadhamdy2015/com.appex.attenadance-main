import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ttech_attendance/core/networking/signalr_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignalRService signalRService;

  AuthCubit(this.signalRService) : super(AuthInitial());

  void connect() async {
    try {
      await signalRService.startConnection();
      signalRService.listenToMessages((user, message) {
        if (message == 'logout') {
          emit(AuthLoggedOut());
        }
      });
      emit(AuthConnected());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void disconnect() {
    signalRService.stopConnection();
    emit(AuthDisconnected());
  }
}
