import 'package:json_annotation/json_annotation.dart';

import 'user_info.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  int? result;
  int? dataCount;
  LoginResponseData? data;
  String? alart;
  int? id;
  int? code;
  String? note;
  int? totalCount;
  String? errorMessageAr;
  String? errorMessageEn;
  int? total;
  String? dateTimeNow;
  int? updateNumber;
  int? isUpdate;
  bool? isPrint;
  int? permissionListId;
  String? employyeNameAr;
  String? employyeNameEn;
  String? posPrintFilesAr;
  String? posPrintFilesEn;
  String? returnPosPrintFilesAr;
  String? returnPosPrintFilesEn;
  bool? isAuthorizedOnDashboardData;

  LoginResponse(
      {this.result,
      this.dataCount,
      this.data,
      this.alart,
      this.id,
      this.code,
      this.note,
      this.totalCount,
      this.errorMessageAr,
      this.errorMessageEn,
      this.total,
      this.dateTimeNow,
      this.updateNumber,
      this.isUpdate,
      this.isPrint,
      this.permissionListId,
      this.employyeNameAr,
      this.employyeNameEn,
      this.posPrintFilesAr,
      this.posPrintFilesEn,
      this.returnPosPrintFilesAr,
      this.returnPosPrintFilesEn,
      this.isAuthorizedOnDashboardData});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginResponseData {
  bool? isPeriodEnded;
  String? startPeriod;
  String? endPeriod;
  List<LoginResponseApps>? apps;
  AuthToken? authToken;
  bool? isHaveUpdate;
  List<UserPremissions>? premissions;
  CompanyInfo? companyInfo;
  int? updateNumber;
  int? serverID;

  LoginResponseData(
      {this.isPeriodEnded,
      this.startPeriod,
      this.endPeriod,
      this.apps,
      this.authToken,
      this.isHaveUpdate,
      this.premissions,
      this.companyInfo,
      this.updateNumber,
      this.serverID});

  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDataToJson(this);
}

@JsonSerializable()
class LoginResponseApps {
  String? appNameAr;
  String? appNameEn;
  int? id;

  LoginResponseApps({this.appNameAr, this.appNameEn, this.id});
  factory LoginResponseApps.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseAppsFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseAppsToJson(this);
}

@JsonSerializable()
class AuthToken {
  String? token;
  UserInfo? userInfo;
  String? expiresIn;

  AuthToken({this.token, this.userInfo, this.expiresIn});
  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);
}
