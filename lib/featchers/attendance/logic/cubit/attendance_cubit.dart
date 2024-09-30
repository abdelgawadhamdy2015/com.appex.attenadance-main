import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/featchers/attendance/data/repo/attendance_repo.dart';
import 'package:ttech_attendance/featchers/attendance/logic/cubit/attendance_state.dart';
import 'package:ttech_attendance/featchers/home/data/models/header_response.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceRepo attendanceRepo;
  AttendanceCubit(this.attendanceRepo) : super(const AttendanceState.initial());
  LatLng currentPosition = const LatLng(45, -120);
  File imageFile = File("");
  File audioFile = File("");

  Location location = Location();
  LocationData? locationData = LocationData.fromMap({});
  GlobalKey formKey = GlobalKey<FormState>();
  HeaderData data = HeaderData();
  List shifts = [];
  DateTime attendanceTime = DateTime(0);
  emitAttendanceState() async {
    emit(const AttendanceState.loading());
    final response = await attendanceRepo.getAttendance();

    response.when(success: (headerResponse) async {
      emit(AttendanceState.success(headerResponse));
    }, failure: (error) async {
      emit(AttendanceState.error(
          error: Intl.defaultLocale == MyConstants.english
              ? error.apiErrorModel.errorMessageEn!
              : error.apiErrorModel.errorMessageAr!));
    });
  }
}
