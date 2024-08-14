import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/shared_pref_helper.dart';
import 'package:ttech_attendance/core/networking/dio_factory.dart';

import '../../../../core/helpers/constants.dart';
import '../../data/models/login_request_body.dart';
import '../../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dbController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequest(
        username: emailController.text,
        password: passwordController.text,
        companyName: dbController.text,
      ),
    );
    response.when(success: (loginResponse) async {
     await  SharedPrefHelper.setSecuredString(myToken, loginResponse.data!.authToken!.token!);
    DioFactory.setTokenToHeaderAfterLogin(loginResponse.data!.authToken!.token!);
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: Intl.defaultLocale== english?error.apiErrorModel.errorMessageEn!: error.apiErrorModel.errorMessageAr!));
    });
  }
}
