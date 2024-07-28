// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      result: (json['result'] as num?)?.toInt(),
      dataCount: (json['dataCount'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : LoginResponseData.fromJson(json['data'] as Map<String, dynamic>),
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

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
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

LoginResponseData _$LoginResponseDataFromJson(Map<String, dynamic> json) =>
    LoginResponseData(
      isPeriodEnded: json['isPeriodEnded'] as bool?,
      startPeriod: json['startPeriod'] as String?,
      endPeriod: json['endPeriod'] as String?,
      apps: (json['apps'] as List<dynamic>?)
          ?.map((e) => LoginResponseApps.fromJson(e as Map<String, dynamic>))
          .toList(),
      authToken: json['authToken'] == null
          ? null
          : AuthToken.fromJson(json['authToken'] as Map<String, dynamic>),
      isHaveUpdate: json['isHaveUpdate'] as bool?,
      premissions: (json['premissions'] as List<dynamic>?)
          ?.map((e) => UserPremissions.fromJson(e as Map<String, dynamic>))
          .toList(),
      companyInfo: json['companyInfo'] == null
          ? null
          : CompanyInfo.fromJson(json['companyInfo'] as Map<String, dynamic>),
      updateNumber: (json['updateNumber'] as num?)?.toInt(),
      serverID: (json['serverID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoginResponseDataToJson(LoginResponseData instance) =>
    <String, dynamic>{
      'isPeriodEnded': instance.isPeriodEnded,
      'startPeriod': instance.startPeriod,
      'endPeriod': instance.endPeriod,
      'apps': instance.apps,
      'authToken': instance.authToken,
      'isHaveUpdate': instance.isHaveUpdate,
      'premissions': instance.premissions,
      'companyInfo': instance.companyInfo,
      'updateNumber': instance.updateNumber,
      'serverID': instance.serverID,
    };

LoginResponseApps _$LoginResponseAppsFromJson(Map<String, dynamic> json) =>
    LoginResponseApps(
      appNameAr: json['appNameAr'] as String?,
      appNameEn: json['appNameEn'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoginResponseAppsToJson(LoginResponseApps instance) =>
    <String, dynamic>{
      'appNameAr': instance.appNameAr,
      'appNameEn': instance.appNameEn,
      'id': instance.id,
    };

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) => AuthToken(
      token: json['token'] as String?,
      userInfo: json['userInfo'] == null
          ? null
          : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      expiresIn: json['expiresIn'] as String?,
    );

Map<String, dynamic> _$AuthTokenToJson(AuthToken instance) => <String, dynamic>{
      'token': instance.token,
      'userInfo': instance.userInfo,
      'expiresIn': instance.expiresIn,
    };
