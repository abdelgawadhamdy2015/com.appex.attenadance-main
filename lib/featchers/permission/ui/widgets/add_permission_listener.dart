import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/core/widgets/setup_dialog.dart';
import 'package:ttech_attendance/featchers/permission/logic/cubit/permission_cubit.dart';
import 'package:ttech_attendance/featchers/permission/logic/cubit/permission_state.dart';
import 'package:ttech_attendance/featchers/request_form/date/models/add_vaccation_response.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class AddPermissionListener extends StatefulWidget {
  const AddPermissionListener({
    super.key,
  });

  @override
  State<AddPermissionListener> createState() => _AddPermissionListenerState();
}

class _AddPermissionListenerState extends State<AddPermissionListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PermissionCubit, PermissionState>(
      listenWhen: (previous, current) =>
          current is PermissionLoading ||
          current is PermissionSuccess ||
          current is PermissionError,
      listener: (context, state) {
        state.whenOrNull(
          permissionSuccess: (response) async {
            AddVaccationResponse addVaccationResponse = response;
            addVaccationResponse.result == 1
                ? setupDialogState(
                    context,
                    Intl.defaultLocale == MyConstants.arabic
                        ? addVaccationResponse.alart!.messageAr!
                        : addVaccationResponse.alart!.messageEn!,
                    [S.of(context).okDialog],
                    false)
                : setupDialogState(
                    context,
                    Intl.defaultLocale == MyConstants.arabic
                        ? addVaccationResponse.alart!.messageAr!
                        : addVaccationResponse.alart!.messageEn!,
                    [S.of(context).okDialog],
                    true);
          },
          permissionError: (error) {
            setupDialogState(
              context,
              error,
              [S.of(context).okDialog],
              true,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
