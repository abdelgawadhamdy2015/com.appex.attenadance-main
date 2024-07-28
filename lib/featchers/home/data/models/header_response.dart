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

  HeaderResponse(
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
  String? shift1_TimeIn;
  String? shift1_TimeOut;
  String? shift2_TimeIn;
  String? shift2_TimeOut;
  String? shift3_TimeIn;
  String? shift3_TimeOut;
  String? shift4_TimeIn;
  String? shift4_TimeOut;
  String? shift1_Start;
  String? shift1_End;
  String? shift2_Start;
  String? shift2_End;
  String? shift3_Start;
  String? shift3_End;
  String? shift4_Start;
  String? shift4_End;
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
      this.shift1_TimeIn,
      this.shift1_TimeOut,
      this.shift2_TimeIn,
      this.shift2_TimeOut,
      this.shift3_TimeIn,
      this.shift3_TimeOut,
      this.shift4_TimeIn,
      this.shift4_TimeOut,
      this.hasShift2,
      this.hasShift3,
      this.hasShift4,
      this.shiftType,
      this.shift1_Start,
      this.shift1_End,
      this.shift2_Start,
      this.shift2_End,
      this.shift3_Start,
      this.shift3_End,
      this.shift4_Start,
      this.shift4_End,
      this.totalDayHours});

  factory HeaderData.fromJson(Map<String, dynamic> json) =>
      _$HeaderDataFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderDataToJson(this);
}
