import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';
import 'package:ttech_attendance/featchers/departures/data/models/departure_response.dart';
import 'package:ttech_attendance/featchers/departures/logic/cubit/departure_cubit.dart';
import 'package:ttech_attendance/featchers/departures/logic/cubit/departure_state.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class DepartureBlocListener extends StatefulWidget {
  const DepartureBlocListener({super.key});

  @override
  State<DepartureBlocListener> createState() => _DepartureBlocListenerState();
}

class _DepartureBlocListenerState extends State<DepartureBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<DepartureCubit, DepartureState>(
        child: const SizedBox.shrink(),
        listenWhen: (previous, current) =>
            current is DepartureLoading ||
            current is DepartureSuccess ||
            current is DepartureError,
        listener: (context, state) {
          state.whenOrNull(
            departureLoading: () {
              const Center(
                child: CircularProgressIndicator(),
              );
            },
            departureSuccess: (response) {
              if (response.result == 1) {
                DepartureResponse departureResponse = response;
                context.read<DepartureCubit>().departures =
                    departureResponse.data!;
              } else {
                setupDialogState(
                    context,
                    Intl.defaultLocale == MyConstants.arabic
                        ? response.errorMessageAr!
                        : response.errorMessageEn!,
                    [S.of(context).okDialog],
                    true);
              }
            },
            departureError: (error) {
              setupDialogState(
                context,
                error,
                [S.of(context).okDialog],
                true,
              );
            },
          );
        });
  }
}
