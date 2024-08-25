import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';
import 'package:ttech_attendance/featchers/request_form/date/models/all_vaccations_model.dart';
import 'package:ttech_attendance/featchers/request_form/logic/cubit/all_vaccations_cubit.dart';
import 'package:ttech_attendance/featchers/request_form/logic/cubit/all_vaccations_state.dart';

class AllVaccationsListener extends StatefulWidget {
  const AllVaccationsListener({
    super.key,
  });

  @override
  State<AllVaccationsListener> createState() => _RequestBlockListenerState();
}

class _RequestBlockListenerState extends State<AllVaccationsListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AllVaccationsCubit, AllVaccationsState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          },
          success: (allvaccations) async {
            AllVaccationsModel response = allvaccations;
            context.read<AllVaccationsCubit>().vaccations = response.data!;
            if (response.result == 1) {
              for (var name in response.data!) {
                context.read<AllVaccationsCubit>().vacctionsName.add(
                    Intl.defaultLocale == MyConstants.arabic
                        ? name.arabicName!
                        : name.latinName!);
                context.read<AllVaccationsCubit>().vacctionsIds.add(name.id!);
              }
            } else {
              setupDialogState(
                  context,
                  Intl.defaultLocale == MyConstants.arabic
                      ? response.errorMessageAr!
                      : response.errorMessageEn!,
                  true);
            }
          },
          error: (error) {
            setupDialogState(
              context,
              error,
              true,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
