// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionModel _$PermissionModelFromJson(Map<String, dynamic> json) =>
    PermissionModel(
      day: json['Day'] == null ? null : DateTime.parse(json['Day'] as String),
      type: (json['type'] as num?)?.toInt(),
      totalHoursForOpenShift: json['totalHoursForOpenShift'] as String?,
      shift1Start: json['shift1_start'] as String?,
      shift1End: json['shift1_end'] as String?,
      shift2Start: json['shift2_start'] as String?,
      shift2End: json['shift2_end'] as String?,
      shift3Start: json['shift3_start'] as String?,
      shift3End: json['shift3_end'] as String?,
      shift4Start: json['shift4_start'] as String?,
      shift4End: json['shift4_end'] as String?,
      shift1IsExtended: json['shift1_IsExtended'] as bool?,
      shift2IsExtended: json['shift2_IsExtended'] as bool?,
      shift3IsExtended: json['shift3_IsExtended'] as bool?,
      shift4IsExtended: json['shift4_IsExtended'] as bool?,
      hasShift2: json['Has_shift2'] as bool?,
      hasShift3: json['Has_shift3'] as bool?,
      hasShift4: json['Has_shift4'] as bool?,
      isMobile: json['isMobile'] as bool?,
      note: json['Note'] as String?,
    );

Map<String, dynamic> _$PermissionModelToJson(PermissionModel instance) =>
    <String, dynamic>{
      'Day': instance.day?.toIso8601String(),
      'type': instance.type,
      'totalHoursForOpenShift': instance.totalHoursForOpenShift,
      'shift1_start': instance.shift1Start,
      'shift1_end': instance.shift1End,
      'shift2_start': instance.shift2Start,
      'shift2_end': instance.shift2End,
      'shift3_start': instance.shift3Start,
      'shift3_end': instance.shift3End,
      'shift4_start': instance.shift4Start,
      'shift4_end': instance.shift4End,
      'Note': instance.note,
      'Has_shift2': instance.hasShift2,
      'Has_shift3': instance.hasShift3,
      'Has_shift4': instance.hasShift4,
      'shift1_IsExtended': instance.shift1IsExtended,
      'shift2_IsExtended': instance.shift2IsExtended,
      'shift3_IsExtended': instance.shift3IsExtended,
      'shift4_IsExtended': instance.shift4IsExtended,
      'isMobile': instance.isMobile,
    };
