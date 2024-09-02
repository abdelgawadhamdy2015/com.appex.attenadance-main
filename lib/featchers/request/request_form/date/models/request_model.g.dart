// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestVaccation _$RequestVaccationFromJson(Map<String, dynamic> json) =>
    RequestVaccation(
      vaccationId: (json['vaccationId'] as num?)?.toInt(),
      isMobile: json['isMobile'] as bool?,
      dateFrom: json['dateFrom'] as String?,
      dateTo: json['dateTo'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$RequestVaccationToJson(RequestVaccation instance) =>
    <String, dynamic>{
      'vaccationId': instance.vaccationId,
      'isMobile': instance.isMobile,
      'dateFrom': instance.dateFrom,
      'dateTo': instance.dateTo,
      'note': instance.note,
    };
