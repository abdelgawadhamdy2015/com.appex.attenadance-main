// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_vaccation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddVaccationResponse _$AddVaccationResponseFromJson(
        Map<String, dynamic> json) =>
    AddVaccationResponse(
      result: (json['result'] as num?)?.toInt(),
      dataCount: (json['dataCount'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
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

Map<String, dynamic> _$AddVaccationResponseToJson(
        AddVaccationResponse instance) =>
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

Alart _$AlartFromJson(Map<String, dynamic> json) => Alart(
      alartType: (json['alartType'] as num?)?.toInt(),
      type: (json['type'] as num?)?.toInt(),
      titleAr: json['titleAr'] as String?,
      titleEn: json['titleEn'] as String?,
      messageAr: json['messageAr'] as String?,
      messageEn: json['messageEn'] as String?,
    );

Map<String, dynamic> _$AlartToJson(Alart instance) => <String, dynamic>{
      'alartType': instance.alartType,
      'type': instance.type,
      'titleAr': instance.titleAr,
      'titleEn': instance.titleEn,
      'messageAr': instance.messageAr,
      'messageEn': instance.messageEn,
    };
