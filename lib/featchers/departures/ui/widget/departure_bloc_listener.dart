import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';
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
            departureSuccess: (departureREsponse) {
              
              // DepartureResponse response = departureREsponse;
              // if (response.result == 1) {
              //   context.read<AttendanceCubit>().data = response.data!;
              //   context.read<AttendanceCubit>().shifts=[
              //     response.data!.shift1_TimeIn,
              //     response.data!.shift1_TimeOut,
              //     response.data!.shift2_TimeIn,
              //     response.data!.shift2_TimeOut,
              //     response.data!.shift3_TimeIn,
              //     response.data!.shift3_TimeOut,
              //     response.data!.shift4_TimeIn,
              //     response.data!.shift4_TimeOut,
              //   ];
              //   context.read<DepartureCubit>().departure = response.data!;
              // } else {
              //   setupDialogState(
              //       context,
              //       Intl.defaultLocale == MyConstants.arabic
              //           ? response.errorMessageAr!
              //           : response.errorMessageEn!,
              //       [S.of(context).okDialog], true
              //       );
              // }
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
