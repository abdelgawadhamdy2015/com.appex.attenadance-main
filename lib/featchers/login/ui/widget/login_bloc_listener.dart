// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/helpers/shared_pref_helper.dart';
import 'package:ttech_attendance/core/networking/dio_factory.dart';
import 'package:ttech_attendance/core/routing/routes.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';
import 'package:ttech_attendance/featchers/login/data/models/login_response.dart';
import 'package:ttech_attendance/featchers/login/logic/cubit/login_state.dart';
import 'package:ttech_attendance/generated/l10n.dart';

import '../../../../core/networking/signal_r_service.dart';
import '../../logic/cubit/login_cubit.dart';

class LoginBlocListener extends StatefulWidget {
  final bool rememberMe;

  final Function(Locale) changeLanguage;

  const LoginBlocListener(
      {super.key, required this.rememberMe, required this.changeLanguage});

  @override
  State<LoginBlocListener> createState() => _LoginBlocListenerState();
}

class _LoginBlocListenerState extends State<LoginBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            // showDialog(
            //     context: context,
            //     builder: (context) => const Center(
            //           child: CircularProgressIndicator(
            //             color: Colors.greenAccent,
            //           ),
            //         ));
          },
          success: (loginResponse) async {
            LoginResponse response = loginResponse;
            context.read<LoginCubit>().loadingLogin = false;
            if (response.result == 1) {
              SignalRService()
                  .startConnection(response.data!.authToken!.token!);
              await SharedPrefHelper.setSecuredString(
                  MyConstants.myToken, loginResponse.data!.authToken!.token!);
              DioFactory.setTokenToHeaderAfterLogin(
                  loginResponse.data!.authToken!.token!);

              context.pushReplacementNamed(Routes.homeScreen);
            } else {
              // context.pop();
              setupDialogState(context, response.errorMessageAr!,
                  [S.of(context).okDialog], true);
            }

            if (widget.rememberMe) {
              SharedPrefHelper.setData(MyConstants.isLoggedIn, true);
            }
          },
          error: (error) {
            setupDialogState(context, error, [S.of(context).okDialog], true);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
