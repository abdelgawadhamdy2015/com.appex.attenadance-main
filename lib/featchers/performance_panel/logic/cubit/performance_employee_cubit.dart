import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/models/performance_employee_model.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/repo/performance_employee_repo.dart';
import 'package:ttech_attendance/featchers/performance_panel/logic/cubit/performance_employee_state.dart';

import '../../../../core/helpers/constants.dart';
import '../../data/models/performance_employee_response.dart';

class PerformanceEmployeeCubit extends Cubit<PerformanceEmployeeState> {
  PerformanceEmployeeRepo employeeRepo;

  PerformanceEmployeeCubit(this.employeeRepo)
      : super(const PerformanceEmployeeState.initial());

  final formKey = GlobalKey<FormState>();
  List<Data> datalist = [];

  void emitRPerformanceEmployeeState(
       PerformanceEmployeeModel employeeModel) async {
    emit(const PerformanceEmployeeState.loading());
    final response = await employeeRepo.getPerfromance( employeeModel);

    response.when(success: (performanceEmployeeResponse) async {
      emit(PerformanceEmployeeState.success(performanceEmployeeResponse));
    }, failure: (error) {
      emit(PerformanceEmployeeState.error(error: Intl.defaultLocale== MyConstants.english?error.apiErrorModel.errorMessageEn!: error.apiErrorModel.errorMessageAr!));
    });
  }
}
