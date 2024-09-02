import 'package:freezed_annotation/freezed_annotation.dart';
part 'performance_employee_response.g.dart';

@JsonSerializable()
class PerformanceEmployeeResponse {
  int? result;
  int? dataCount;
  List<Data>? data;
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

  PerformanceEmployeeResponse(
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

  factory PerformanceEmployeeResponse.fromJson(Map<String, dynamic> json) =>
      _$PerformanceEmployeeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PerformanceEmployeeResponseToJson(this);
}

@JsonSerializable()
class Data {
  List<Employees>? employees;
  int? id;
  String? arabicName;
  String? latinName;
  bool? expanded;

  Data(
      {this.employees,
      this.id,
      this.arabicName,
      this.latinName,
      this.expanded});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Employees {
  List<Day>? days;
  int? id;
  int? branchId;
  int? code;
  String? arabicName;
  String? latinName;
  String? jobAr;
  String? jobEn;
  String? shiftAr;
  String? shiftEn;
  bool? expanded;
  String? totalLateTime;
  String? totalExtraTime;
  String? totalWorkingTime;
  String? totalShiftTime;

  Employees(
      {this.days,
      this.id,
      this.branchId,
      this.code,
      this.arabicName,
      this.latinName,
      this.jobAr,
      this.jobEn,
      this.shiftAr,
      this.shiftEn,
      this.expanded,
      this.totalLateTime,
      this.totalExtraTime,
      this.totalWorkingTime,
      this.totalShiftTime});

  factory Employees.fromJson(Map<String, dynamic> json) =>
      _$EmployeesFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeesToJson(this);
}

@JsonSerializable()
class Day {
  int? branchId;
  int? employeeId;
  String? dayAr;
  String? dayEn;
  DateTime? date;
  @JsonKey(name: 'shift1_TimeIn')
  String? shift1TimeIn;
  @JsonKey(name: 'shift1_TimeOut')
  String? shift1TimeOut;
  @JsonKey(name: 'shift2_TimeIn')
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
  String? totalShiftTime;
  String? lateTime;
  String? extraTime;
  String? workingTime;
  int? status;
  String? statusAr;
  String? statusEn;

  Day(
      {this.branchId,
      this.employeeId,
      this.dayAr,
      this.dayEn,
      this.date,
      this.shift1TimeIn,
      this.shift1TimeOut,
      this.shift2TimeIn,
      this.shift2TimeOut,
      this.shift3TimeIn,
      this.shift3TimeOut,
      this.shift4TimeIn,
      this.shift4TimeOut,
      this.totalShiftTime,
      this.lateTime,
      this.extraTime,
      this.workingTime,
      this.status,
      this.statusAr,
      this.statusEn});

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}
