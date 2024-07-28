// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerformanceEmployeeModel _$PerformanceEmployeeModelFromJson(
        Map<String, dynamic> json) =>
    PerformanceEmployeeModel(
      dateFrom: DateTime.parse(json['dateFrom'] as String),
      dateTo: DateTime.parse(json['dateTo'] as String),
      isMobile: json['isMobile'] as bool,
    );

Map<String, dynamic> _$PerformanceEmployeeModelToJson(
        PerformanceEmployeeModel instance) =>
    <String, dynamic>{
      'dateFrom': instance.dateFrom.toIso8601String(),
      'dateTo': instance.dateTo.toIso8601String(),
      'isMobile': instance.isMobile,
    };
