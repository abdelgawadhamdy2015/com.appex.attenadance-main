import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/networking/signal_r_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignalRService signalRService;

  AuthCubit(this.signalRService, ) : super(AuthInitial()){
    login();
  }

  void login() async {
    emit(AuthLoading());
    try {
      //await signalRService.startConnection(ApiConstants.authToken);
      signalRService.listenToMessages((user) {

        if (user == 'Another Person Has Login Into Your Account From Another Place') {
          print(user);
          emit(AuthLoggedOut());
        }
      });
      emit(AuthConnected());
    } catch (e) {
      print(" auth cubit error : $e");
      emit(AuthError(e.toString()));
    }
  }

  void disconnect() {
    signalRService.stopConnection();
    emit(AuthDisconnected());
  }
}