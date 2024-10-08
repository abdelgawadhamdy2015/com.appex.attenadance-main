import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ttech_attendance/featchers/departures/data/models/departure_model.dart';
part 'departure_response.g.dart';

@JsonSerializable()
class DepartureResponse {
  int? result;
  int? dataCount;
  List<DepartureModel>? data;
  int? alart;
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

  DepartureResponse(
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

  factory DepartureResponse.fromJson(Map<String, dynamic> json) =>
      _$DepartureResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DepartureResponseToJson(this);
}
