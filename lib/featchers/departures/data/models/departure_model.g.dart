// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departure_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartureModel _$DepartureModelFromJson(Map<String, dynamic> json) =>
    DepartureModel(
      json['requestNumber'] as String?,
      json['status'] as String?,
      (json['type'] as num?)?.toInt(),
      json['from'] as String?,
      json['to'] as String?,
      json['requestgDate'] as String?,
    );

Map<String, dynamic> _$DepartureModelToJson(DepartureModel instance) =>
    <String, dynamic>{
      'requestNumber': instance.requestNumber,
      'requestgDate': instance.requestgDate,
      'status': instance.status,
      'type': instance.type,
      'from': instance.from,
      'to': instance.to,
    };
