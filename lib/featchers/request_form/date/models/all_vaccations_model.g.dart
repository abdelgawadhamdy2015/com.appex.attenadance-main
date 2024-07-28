// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_vaccations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllVaccationsModel _$AllVaccationsModelFromJson(Map<String, dynamic> json) =>
    AllVaccationsModel(
      result: (json['result'] as num?)?.toInt(),
      dataCount: (json['dataCount'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      alart: json['alart'] == null
          ? null
          : Alart.fromJson(json['alart'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      code: (json['code'] as num?)?.toInt(),
      note: json['note'] as String?,
      totalCount: (json['totalCount'] as num?)?.toInt(),
      errorMessageAr: json['errorMessageAr'] as String?,
      errorMessageEn: json['errorMessageEn'] as String?,
      total: (json['total'] as num?)?.toInt(),
      dateTimeNow: json['dateTimeNow'] as String?,
      updateNumber: (json['updateNumber'] as num?)?.toInt(),
      isUpdate: (json['isUpdate'] as num?)?.toInt(),
      isPrint: json['isPrint'] as bool?,
      permissionListId: (json['permissionListId'] as num?)?.toInt(),
      employyeNameAr: json['employyeNameAr'] as String?,
      employyeNameEn: json['employyeNameEn'] as String?,
      posPrintFilesAr: json['posPrintFilesAr'] as String?,
      posPrintFilesEn: json['posPrintFilesEn'] as String?,
      returnPosPrintFilesAr: json['returnPosPrintFilesAr'] as String?,
      returnPosPrintFilesEn: json['returnPosPrintFilesEn'] as String?,
      isAuthorizedOnDashboardData: json['isAuthorizedOnDashboardData'] as bool?,
    );

Map<String, dynamic> _$AllVaccationsModelToJson(AllVaccationsModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'dataCount': instance.dataCount,
      'data': instance.data,
      'alart': instance.alart,
      'id': instance.id,
      'code': instance.code,
      'note': instance.note,
      'totalCount': instance.totalCount,
      'errorMessageAr': instance.errorMessageAr,
      'errorMessageEn': instance.errorMessageEn,
      'total': instance.total,
      'dateTimeNow': instance.dateTimeNow,
      'updateNumber': instance.updateNumber,
      'isUpdate': instance.isUpdate,
      'isPrint': instance.isPrint,
      'permissionListId': instance.permissionListId,
      'employyeNameAr': instance.employyeNameAr,
      'employyeNameEn': instance.employyeNameEn,
      'posPrintFilesAr': instance.posPrintFilesAr,
      'posPrintFilesEn': instance.posPrintFilesEn,
      'returnPosPrintFilesAr': instance.returnPosPrintFilesAr,
      'returnPosPrintFilesEn': instance.returnPosPrintFilesEn,
      'isAuthorizedOnDashboardData': instance.isAuthorizedOnDashboardData,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      arabicName: json['arabicName'] as String?,
      latinName: json['latinName'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'arabicName': instance.arabicName,
      'latinName': instance.latinName,
    };
