import 'package:bloc/bloc.dart';

import 'froget_password_state.dart';

class FrogetPasswordCubit extends Cubit<FrogetPasswordState> {
  FrogetPasswordCubit() : super(const FrogetPasswordState.initial());
}
