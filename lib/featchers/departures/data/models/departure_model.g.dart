// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departure_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartureModel _$DepartureModelFromJson(Map<String, dynamic> json) =>
    DepartureModel(
      id: (json['id'] as num?)?.toInt(),
      code: (json['code'] as num?)?.toInt(),
      branch: json['branch'] == null
          ? null
          : Branch.fromJson(json['branch'] as Map<String, dynamic>),
      employee: json['employee'] == null
          ? null
          : Branch.fromJson(json['employee'] as Map<String, dynamic>),
      vacation: json['vacation'] == null
          ? null
          : Branch.fromJson(json['vacation'] as Map<String, dynamic>),
      shift: json['shift'] == null
          ? null
          : Shift.fromJson(json['shift'] as Map<String, dynamic>),
      shiftDetails: json['shiftDetails'] == null
          ? null
          : ShiftDetails.fromJson(json['shiftDetails'] as Map<String, dynamic>),
      duration: (json['duration'] as num?)?.toInt(),
      note: json['note'] as String?,
      startdate: json['startdate'] == null
          ? null
          : DateTime.parse(json['startdate'] as String),
      enddate: json['enddate'] == null
          ? null
          : DateTime.parse(json['enddate'] as String),
      canDelete: json['canDelete'] as bool?,
      statusArabic: json['statusArabic'] as String?,
      statusEnglish: json['statusEnglish'] as String?,
      docDate: json['docDate'] as String?,
      permissiontype: json['permissiontype'] == null
          ? null
          : Shift.fromJson(json['permissiontype'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DepartureModelToJson(DepartureModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'branch': instance.branch,
      'employee': instance.employee,
      'vacation': instance.vacation,
      'shift': instance.shift,
      'shiftDetails': instance.shiftDetails,
      'duration': instance.duration,
      'note': instance.note,
      'startdate': instance.startdate?.toIso8601String(),
      'enddate': instance.enddate?.toIso8601String(),
      'canDelete': instance.canDelete,
      'statusArabic': instance.statusArabic,
      'statusEnglish': instance.statusEnglish,
      'permissiontype': instance.permissiontype,
      'docDate': instance.docDate,
    };

Shift _$ShiftFromJson(Map<String, dynamic> json) => Shift(
      type: (json['type'] as num?)?.toInt(),
      arabicName: json['arabicName'] as String?,
      latinName: json['latinName'] as String?,
    );

Map<String, dynamic> _$ShiftToJson(Shift instance) => <String, dynamic>{
      'type': instance.type,
      'arabicName': instance.arabicName,
      'latinName': instance.latinName,
    };

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      id: (json['id'] as num?)?.toInt(),
      arabicName: json['arabicName'] as String?,
      latinName: json['latinName'] as String?,
    );

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'id': instance.id,
      'arabicName': instance.arabicName,
      'latinName': instance.latinName,
    };

ShiftDetails _$ShiftDetailsFromJson(Map<String, dynamic> json) => ShiftDetails(
      shift1Start: json['shift1_start'] as String?,
      shift1End: json['shift1_end'] as String?,
      shift1IsExtended: json['shift1_IsExtended'] as bool?,
      shift2Start: json['shift2_start'] as String?,
      shift2End: json['shift2_end'] as String?,
      shift2IsExtended: json['shift2_IsExtended'] as bool?,
      hasShift2: json['has_Shift2'] as bool?,
      shift3Start: json['shift3_start'] as String?,
      shift3End: json['shift3_end'] as String?,
      shift3IsExtended: json['shift3_IsExtended'] as bool?,
      hasShift3: json['has_Shift3'] as bool?,
      shift4Start: json['shift4_start'] as String?,
      shift4End: json['shift4_end'] as String?,
      shift4IsExtended: json['shift4_IsExtended'] as bool?,
      hasShift4: json['has_Shift4'] as bool?,
      totalDayHours: json['totalDayHours'] as String?,
    );

Map<String, dynamic> _$ShiftDetailsToJson(ShiftDetails instance) =>
    <String, dynamic>{
      'shift1_start': instance.shift1Start,
      'shift1_end': instance.shift1End,
      'shift2_start': instance.shift2Start,
      'shift2_end': instance.shift2End,
      'shift3_start': instance.shift3Start,
      'shift3_end': instance.shift3End,
      'shift4_start': instance.shift4Start,
      'shift4_end': instance.shift4End,
      'has_Shift2': instance.hasShift2,
      'has_Shift3': instance.hasShift3,
      'has_Shift4': instance.hasShift4,
      'shift1_IsExtended': instance.shift1IsExtended,
      'shift2_IsExtended': instance.shift2IsExtended,
      'shift3_IsExtended': instance.shift3IsExtended,
      'shift4_IsExtended': instance.shift4IsExtended,
      'totalDayHours': instance.totalDayHours,
    };
