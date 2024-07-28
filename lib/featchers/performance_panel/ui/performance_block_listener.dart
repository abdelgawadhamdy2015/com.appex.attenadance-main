import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/extensions.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/models/performance_employee_response.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_cubit.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_state.dart';

class PerformanceBlockListener extends StatefulWidget {
  const PerformanceBlockListener({super.key});

  @override
  State<PerformanceBlockListener> createState() => _PerformanceBlockListener();
}

class _PerformanceBlockListener extends State<PerformanceBlockListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PerformanceEmployeeCubit, PerformanceEmployeeState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: Colors.greenAccent,
                      ),
                    ));
          },
          success: (performanceResponse) async {
            PerformanceEmployeeResponse response = performanceResponse;
            context.pop();

            response.result == 1
                ? context.read<PerformanceEmployeeCubit>().datalist =
                    response.data!
                : setupDialogState(
                    context,
                    Intl.defaultLocale == arabic
                        ? response.errorMessageAr!
                        : response.errorMessageEn!,
                    true);
          },
          error: (error) {
            context.pop();
            setupDialogState(context, error, true);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
