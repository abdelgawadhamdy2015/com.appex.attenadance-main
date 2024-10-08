import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:ttech_attendance/core/helpers/file_converter.dart';
part 'attendance_request.g.dart';

@JsonSerializable()
class AttendanceRequest {
  double? x;
  double? y;
  bool? isAttendFingerprint;
  bool? isShift1Complete;
  bool? isShift2Complete;
  bool? isShift3Complete;
  bool? isShift4Complete;
  @FileConverter()
  File? imageFile;
  @FileConverter()
  File? audioFile;

  AttendanceRequest(
      {required this.x,
      required this.y,
      this.isAttendFingerprint,
      this.isShift1Complete,
      this.isShift2Complete,
      this.isShift3Complete,
      this.isShift4Complete,
      this.audioFile,
      this.imageFile});

  factory AttendanceRequest.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AttendanceRequestToJson(this);
}
