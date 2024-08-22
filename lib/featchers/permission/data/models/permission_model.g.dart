// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionModel _$PermissionModelFromJson(Map<String, dynamic> json) =>
    PermissionModel(
      day: json['day'] == null ? null : DateTime.parse(json['day'] as String),
      type: (json['type'] as num?)?.toInt(),
      totalHoursForOpenShift: json['totalHoursForOpenShift'] as String?,
      shift1_start: json['shift1_start'] as String?,
      shift1_end: json['shift1_end'] as String?,
      shift2_start: json['shift2_start'] as String?,
      shift2_end: json['shift2_end'] as String?,
      shift3_start: json['shift3_start'] as String?,
      shift3_end: json['shift3_end'] as String?,
      shift4_start: json['shift4_start'] as String?,
      shift4_end: json['shift4_end'] as String?,
      shift1_IsExtended: json['shift1_IsExtended'] as bool?,
      shift2_IsExtended: json['shift2_IsExtended'] as bool?,
      shift3_IsExtended: json['shift3_IsExtended'] as bool?,
      shift4_IsExtended: json['shift4_IsExtended'] as bool?,
      Has_shift2: json['Has_shift2'] as bool?,
      Has_shift3: json['Has_shift3'] as bool?,
      Has_shift4: json['Has_shift4'] as bool?,
      isMobile: json['isMobile'] as bool?,
      Note: json['Note'] as String?,
    );

Map<String, dynamic> _$PermissionModelToJson(PermissionModel instance) =>
    <String, dynamic>{
      'day': instance.day?.toIso8601String(),
      'type': instance.type,
      'totalHoursForOpenShift': instance.totalHoursForOpenShift,
      'shift1_start': instance.shift1_start,
      'shift1_end': instance.shift1_end,
      'shift2_start': instance.shift2_start,
      'shift2_end': instance.shift2_end,
      'shift3_start': instance.shift3_start,
      'shift3_end': instance.shift3_end,
      'shift4_start': instance.shift4_start,
      'shift4_end': instance.shift4_end,
      'Note': instance.Note,
      'Has_shift2': instance.Has_shift2,
      'Has_shift3': instance.Has_shift3,
      'Has_shift4': instance.Has_shift4,
      'shift1_IsExtended': instance.shift1_IsExtended,
      'shift2_IsExtended': instance.shift2_IsExtended,
      'shift3_IsExtended': instance.shift3_IsExtended,
      'shift4_IsExtended': instance.shift4_IsExtended,
      'isMobile': instance.isMobile,
    };
