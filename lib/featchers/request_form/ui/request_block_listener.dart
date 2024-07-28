// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';
import 'package:ttech_attendance/featchers/request_form/date/models/add_vaccation_response.dart';
import 'package:ttech_attendance/featchers/request_form/logic/cubit/request_vaccation_cubit.dart';
import 'package:ttech_attendance/featchers/request_form/logic/cubit/request_vaccation_state.dart';

class RequestBlockListener extends StatefulWidget {
  const RequestBlockListener({super.key});

  @override
  State<RequestBlockListener> createState() => _RequestBlockListenerState();
}

class _RequestBlockListenerState extends State<RequestBlockListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestVaccationCubit, RequestVaccationState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            const Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            ));
          },
          success: (addVaccationResponse) async {
            AddVaccationResponse response = addVaccationResponse;

            response.result == 1
                ? setupDialogState(
                    context,
                    Intl.defaultLocale == arabic
                        ? response.alart!.messageAr!
                        : response.alart!.messageEn!,
                    false,
                    )
                : setupDialogState(
                    context,
                    Intl.defaultLocale == arabic
                        ? response.alart!.messageAr!
                        : response.alart!.messageEn!,
                    true,
                    );
          },
          error: (error) {
            setupDialogState(context, error, true, );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
