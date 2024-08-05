import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

            for (var name in response.data!) {
              context.read<AllVaccationsCubit>().vacctionsName.add(
                  //Intl.defaultLocale == arabic
                  //   name.arabicName!
                  name.arabicName!);
              context.read<AllVaccationsCubit>().vacctionsIds.add(name.id!);
            }
            //context.pop();
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
