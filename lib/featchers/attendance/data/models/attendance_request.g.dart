// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceRequest _$AttendanceRequestFromJson(Map<String, dynamic> json) =>
    AttendanceRequest(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      isAttendFingerprint: json['isAttendFingerprint'] as bool?,
      isShift1Complete: json['isShift1Complete'] as bool?,
      isShift2Complete: json['isShift2Complete'] as bool?,
      isShift3Complete: json['isShift3Complete'] as bool?,
      isShift4Complete: json['isShift4Complete'] as bool?,
    );

Map<String, dynamic> _$AttendanceRequestToJson(AttendanceRequest instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'isAttendFingerprint': instance.isAttendFingerprint,
      'isShift1Complete': instance.isShift1Complete,
      'isShift2Complete': instance.isShift2Complete,
      'isShift3Complete': instance.isShift3Complete,
      'isShift4Complete': instance.isShift4Complete,
    };
