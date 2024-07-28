import 'package:json_annotation/json_annotation.dart';
part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  String? userId;
  String? userName;
  String? arabicName;
  String? latinName;
  String? permissionNameAr;
  String? permissionNameEn;
  String? imageUrl;

  UserInfo(
      {this.userId,
      this.userName,
      this.arabicName,
      this.latinName,
      this.permissionNameAr,
      this.permissionNameEn,
      this.imageUrl});

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

@JsonSerializable()
class UserPremissions {
  int? id;
  bool? isAdd;
  bool? isEdit;
  bool? isDelete;
  bool? isShow;
  bool? isPrint;

  UserPremissions(
      {this.id,
      this.isAdd,
      this.isEdit,
      this.isDelete,
      this.isShow,
      this.isPrint});

  factory UserPremissions.fromJson(Map<String, dynamic> json) =>
      _$UserPremissionsFromJson(json);

  Map<String, dynamic> toJson() => _$UserPremissionsToJson(this);
}

@JsonSerializable()
class CompanyInfo {
  String? companyNameAr;
  String? companyNameEn;
  int? subId;

  CompanyInfo({this.companyNameAr, this.companyNameEn, this.subId});
  factory CompanyInfo.fromJson(Map<String, dynamic> json) =>
      _$CompanyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyInfoToJson(this);
}
