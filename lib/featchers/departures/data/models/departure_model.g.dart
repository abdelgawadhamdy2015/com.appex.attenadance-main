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
      duration: (json['duration'] as num?)?.toInt(),
      note: json['note'] as String?,
      startdate: json['startdate'] as String?,
      enddate: json['enddate'] as String?,
      canDelete: json['canDelete'] as bool?,
      statusArabic: json['statusArabic'] as String?,
      statusEnglish: json['statusEnglish'] as String?,
    );

Map<String, dynamic> _$DepartureModelToJson(DepartureModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'branch': instance.branch,
      'employee': instance.employee,
      'vacation': instance.vacation,
      'duration': instance.duration,
      'note': instance.note,
      'startdate': instance.startdate,
      'enddate': instance.enddate,
      'canDelete': instance.canDelete,
      'statusArabic': instance.statusArabic,
      'statusEnglish': instance.statusEnglish,
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
