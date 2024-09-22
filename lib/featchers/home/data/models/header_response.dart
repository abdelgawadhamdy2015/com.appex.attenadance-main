// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'header_response.g.dart';

@JsonSerializable()
class HeaderResponse {
  int? result;
  int? dataCount;
  HeaderData? data;
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

  HeaderResponse({
    this.result,
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
    this.isAuthorizedOnDashboardData,
  });

  factory HeaderResponse.fromJson(Map<String, dynamic> json) =>
      _$HeaderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderResponseToJson(this);
}

@JsonSerializable()
class HeaderData {
  String? empArabicName;
  String? empLatinName;
  DateTime? date;
  String? dayAr;
  String? dayEn;
  @JsonKey(name: "shift1_TimeIn")
  String? shift1TimeIn;
  @JsonKey(name: "shift1_TimeOut")
  String? shift1TimeOut;
  @JsonKey(name: "shift2_TimeIn")
  String? shift2TimeIn;
  @JsonKey(name: "shift2_TimeOut")
  String? shift2TimeOut;
  @JsonKey(name: "shift3_TimeIn")
  String? shift3TimeIn;
  @JsonKey(name: "shift3_TimeOut")
  String? shift3TimeOut;
  @JsonKey(name: "shift4_TimeIn")
  String? shift4TimeIn;
  @JsonKey(name: "shift4_TimeOut")
  String? shift4TimeOut;
  @JsonKey(name: "shift1_Start")
  String? shift1Start;
  @JsonKey(name: "shift1_End")
  String? shift1End;
  @JsonKey(name: "shift2_Start")
  String? shift2Start;
  @JsonKey(name: "shift2_End")
  String? shift2End;
  @JsonKey(name: "shift3_Start")
  String? shift3Start;
  @JsonKey(name: "shift3_End")
  String? shift3End;
  @JsonKey(name: "shift4_Start")
  String? shift4Start;
  @JsonKey(name: "shift4_End")
  String? shift4End;
  String? totalDayHours;
  bool? hasShift2;
  bool? hasShift3;
  bool? hasShift4;
  int? shiftType;

  HeaderData(
      {this.empArabicName,
      this.empLatinName,
      this.date,
      this.dayAr,
      this.dayEn,
      this.shift1TimeIn,
      this.shift1TimeOut,
      this.shift2TimeIn,
      this.shift2TimeOut,
      this.shift3TimeIn,
      this.shift3TimeOut,
      this.shift4TimeIn,
      this.shift4TimeOut,
      this.hasShift2,
      this.hasShift3,
      this.hasShift4,
      this.shiftType,
      this.shift1Start,
      this.shift1End,
      this.shift2Start,
      this.shift2End,
      this.shift3Start,
      this.shift3End,
      this.shift4Start,
      this.shift4End,
      this.totalDayHours});

  factory HeaderData.fromJson(Map<String, dynamic> json) =>
      _$HeaderDataFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderDataToJson(this);
}
