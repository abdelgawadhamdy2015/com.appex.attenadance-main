// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftModel _$ShiftModelFromJson(Map<String, dynamic> json) => ShiftModel(
      (json['shiftId'] as num).toInt(),
      json['active'] as bool,
      json['shiftToSecondDay'] as bool,
      json['startTime'] as String,
      json['endTime'] as String,
    );

Map<String, dynamic> _$ShiftModelToJson(ShiftModel instance) =>
    <String, dynamic>{
      'shiftId': instance.shiftId,
      'active': instance.active,
      'shiftToSecondDay': instance.shiftToSecondDay,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
