import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/helpers/shared_pref_helper.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';
import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';
import 'package:ttech_attendance/featchers/home/logic/cubit/home_cubit.dart';
import 'package:ttech_attendance/featchers/home/logic/cubit/home_state.dart';

class HeaderBlockListener extends StatefulWidget {
  const HeaderBlockListener({super.key});

  @override
  State<HeaderBlockListener> createState() => _HeaderBlockListener();
}

class _HeaderBlockListener extends State<HeaderBlockListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
        child: const SizedBox.shrink(),
        listenWhen: (previous, current) =>
            current is Loading || current is Success || current is Error,
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            success: (headerResponse) async {
              HeaderResponse response = headerResponse;

              if (response.result == 1) {
                context.read<HomeCubit>().data = response.data!;
                await SharedPrefHelper.setData(
                    MyConstants.shiftType, response.data!.shiftType);
              } else {
                Intl.defaultLocale == MyConstants.arabic
                    ? setupDialogState(
                        context,
                        response.errorMessageAr!,
                        true,
                      )
                    : setupDialogState(
                        context,
                        response.errorMessageEn!,
                        true,
                      );
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
        });
  }
}
