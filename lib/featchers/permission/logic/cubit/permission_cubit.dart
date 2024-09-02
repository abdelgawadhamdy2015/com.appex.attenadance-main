import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/featchers/permission/data/models/permission_model.dart';
import 'package:ttech_attendance/featchers/permission/data/models/shift_model.dart';
import 'package:ttech_attendance/featchers/permission/data/repo/permission_repo.dart';
import 'package:ttech_attendance/featchers/permission/logic/cubit/permission_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  final PermissionRepo permissionRepo;
  PermissionCubit({required this.permissionRepo})
      : super(const PermissionState.initial());
  List<ShiftModel> shiftChecks = [];
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController dayController = TextEditingController();
  TextEditingController attendanceController1 = TextEditingController();
  TextEditingController leaveControoler1 = TextEditingController();
  TextEditingController attendanceController2 = TextEditingController();
  TextEditingController leaveControoler2 = TextEditingController();
  TextEditingController attendanceController3 = TextEditingController();
  TextEditingController leaveControoler3 = TextEditingController();
  TextEditingController attendanceController4 = TextEditingController();
  TextEditingController leaveControoler4 = TextEditingController();
  TextEditingController totalHoursController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  void emitAddPermissionState(PermissionModel permissionModel) async {
    emit(const PermissionState.permissionLoading());
    loading = true;

    final response =
        await permissionRepo.addAttendancePermission(permissionModel);

    response.when(success: (performanceEmployeeResponse) async {
      emit(PermissionState.permissionSuccess(performanceEmployeeResponse));
      loading = false;
    }, failure: (error) {
      emit(PermissionState.permissionError(
          error: Intl.defaultLocale == MyConstants.english
              ? error.apiErrorModel.errorMessageEn!
              : error.apiErrorModel.errorMessageAr!));
      loading = false;
    });
  }
}
