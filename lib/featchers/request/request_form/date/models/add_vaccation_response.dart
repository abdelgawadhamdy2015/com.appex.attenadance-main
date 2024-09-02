import 'package:json_annotation/json_annotation.dart';
import 'package:ttech_attendance/featchers/request/request_form/date/models/all_vaccations_model.dart';

part 'add_vaccation_response.g.dart';

@JsonSerializable()
class AddVaccationResponse {
  int? result;
  int? dataCount;
  Data? data;
  Alart? alart;
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

  AddVaccationResponse(
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

  factory AddVaccationResponse.fromJson(Map<String, dynamic> json) =>
      _$AddVaccationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddVaccationResponseToJson(this);
}

@JsonSerializable()
class Alart {
  int? alartType;
  int? type;
  String? titleAr;
  String? titleEn;
  String? messageAr;
  String? messageEn;

  Alart(
      {this.alartType,
      this.type,
      this.titleAr,
      this.titleEn,
      this.messageAr,
      this.messageEn});

  factory Alart.fromJson(Map<String, dynamic> json) => _$AlartFromJson(json);

  Map<String, dynamic> toJson() => _$AlartToJson(this);
}
