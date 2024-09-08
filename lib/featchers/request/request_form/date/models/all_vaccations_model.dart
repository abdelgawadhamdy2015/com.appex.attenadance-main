import 'package:json_annotation/json_annotation.dart';
import 'package:ttech_attendance/featchers/request/request_form/date/models/add_vaccation_response.dart';
part 'all_vaccations_model.g.dart';

@JsonSerializable()
class AllVaccationsModel {
  int? result;
  int? dataCount;
  List<Data>? data;
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

  AllVaccationsModel(
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

  factory AllVaccationsModel.fromJson(Map<String, dynamic> json) =>
      _$AllVaccationsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllVaccationsModelToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  String? arabicName;
  String? latinName;

  Data({this.id, this.arabicName, this.latinName});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
