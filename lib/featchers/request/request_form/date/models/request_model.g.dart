// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestVaccation _$RequestVaccationFromJson(Map<String, dynamic> json) =>
    RequestVaccation(
      vaccationId: (json['VaccationId'] as num?)?.toInt(),
      isMobile: json['isMobile'] as bool?,
      dateFrom: json['DateFrom'] as String?,
      dateTo: json['DateTo'] as String?,
      note: json['Note'] as String?,
    );

Map<String, dynamic> _$RequestVaccationToJson(RequestVaccation instance) =>
    <String, dynamic>{
      'VaccationId': instance.vaccationId,
      'isMobile': instance.isMobile,
      'DateFrom': instance.dateFrom,
      'DateTo': instance.dateTo,
      'Note': instance.note,
    };
