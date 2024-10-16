// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeaderResponse _$HeaderResponseFromJson(Map<String, dynamic> json) =>
    HeaderResponse(
      result: (json['result'] as num?)?.toInt(),
      dataCount: (json['dataCount'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : HeaderData.fromJson(json['data'] as Map<String, dynamic>),
      alart: json['alart'] as String?,
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

Map<String, dynamic> _$HeaderResponseToJson(HeaderResponse instance) =>
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

HeaderData _$HeaderDataFromJson(Map<String, dynamic> json) => HeaderData(
      empArabicName: json['empArabicName'] as String?,
      empLatinName: json['empLatinName'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      dayAr: json['dayAr'] as String?,
      dayEn: json['dayEn'] as String?,
      shift1_TimeIn: json['shift1_TimeIn'] as String?,
      shift1_TimeOut: json['shift1_TimeOut'] as String?,
      shift2_TimeIn: json['shift2_TimeIn'] as String?,
      shift2_TimeOut: json['shift2_TimeOut'] as String?,
      shift3_TimeIn: json['shift3_TimeIn'] as String?,
      shift3_TimeOut: json['shift3_TimeOut'] as String?,
      shift4_TimeIn: json['shift4_TimeIn'] as String?,
      shift4_TimeOut: json['shift4_TimeOut'] as String?,
      hasShift2: json['hasShift2'] as bool?,
      hasShift3: json['hasShift3'] as bool?,
      hasShift4: json['hasShift4'] as bool?,
      shiftType: (json['shiftType'] as num?)?.toInt(),
      shift1_Start: json['shift1_Start'] as String?,
      shift1_End: json['shift1_End'] as String?,
      shift2_Start: json['shift2_Start'] as String?,
      shift2_End: json['shift2_End'] as String?,
      shift3_Start: json['shift3_Start'] as String?,
      shift3_End: json['shift3_End'] as String?,
      shift4_Start: json['shift4_Start'] as String?,
      shift4_End: json['shift4_End'] as String?,
      totalDayHours: json['totalDayHours'] as String?,
    );

Map<String, dynamic> _$HeaderDataToJson(HeaderData instance) =>
    <String, dynamic>{
      'empArabicName': instance.empArabicName,
      'empLatinName': instance.empLatinName,
      'date': instance.date?.toIso8601String(),
      'dayAr': instance.dayAr,
      'dayEn': instance.dayEn,
      'shift1_TimeIn': instance.shift1_TimeIn,
      'shift1_TimeOut': instance.shift1_TimeOut,
      'shift2_TimeIn': instance.shift2_TimeIn,
      'shift2_TimeOut': instance.shift2_TimeOut,
      'shift3_TimeIn': instance.shift3_TimeIn,
      'shift3_TimeOut': instance.shift3_TimeOut,
      'shift4_TimeIn': instance.shift4_TimeIn,
      'shift4_TimeOut': instance.shift4_TimeOut,
      'shift1_Start': instance.shift1_Start,
      'shift1_End': instance.shift1_End,
      'shift2_Start': instance.shift2_Start,
      'shift2_End': instance.shift2_End,
      'shift3_Start': instance.shift3_Start,
      'shift3_End': instance.shift3_End,
      'shift4_Start': instance.shift4_Start,
      'shift4_End': instance.shift4_End,
      'totalDayHours': instance.totalDayHours,
      'hasShift2': instance.hasShift2,
      'hasShift3': instance.hasShift3,
      'hasShift4': instance.hasShift4,
      'shiftType': instance.shiftType,
    };
