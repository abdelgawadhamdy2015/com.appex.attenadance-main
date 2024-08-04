import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:ttech_attendance/featchers/attendance/data/models/attendance_request.dart';
import 'package:ttech_attendance/featchers/attendance/data/repo/send_attendance_repo.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/cubit/send_attendance_state.dart';
import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';

import '../../../../../core/helpers/constants.dart';

class SendAttendanceCubit extends Cubit<SendAttendanceState> {
  SendAttendanceCubit(this.sendAttendanceRepo)
      : super(const SendAttendanceState.initial());
  SendAttendanceRepo sendAttendanceRepo;
  bool attendanceRecorded = false;

  Location location = Location();
  GlobalKey formKey = GlobalKey<FormState>();
  DateTime attendanceTime = DateTime(0);
  HeaderData data = HeaderData();
  emiteAttendanceRecord(
      String token, AttendanceRequest attendanceRequest) async {
    emit(const SendAttendanceState.sendLoading());
    final response =
        await sendAttendanceRepo.sendAttendanceRecord(token, attendanceRequest);
    response.when(success: (attendanceResponse) async {
      emit(SendAttendanceState.sendSuccess(attendanceResponse));
    }, failure: (error) async {
      emit(SendAttendanceState.sendError(error: Intl.defaultLocale== english?error.apiErrorModel.errorMessageEn!: error.apiErrorModel.errorMessageAr!));
    });
  }
}
