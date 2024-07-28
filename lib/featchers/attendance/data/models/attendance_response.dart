

import 'package:json_annotation/json_annotation.dart';
part 'attendance_response.g.dart';

@JsonSerializable()
class AttendanceResponse {
  int? result;
  int? totalCount;
  String? errorMessageAr;
  String? errorMessageEn;
  int? total;
  DateTime? dateTimeNow;
  int? updateNumber;
  int? isUpdate;
  bool? isPrint;
  int? permissionListId;
  bool? isAuthorizedOnDashboardData;

  AttendanceResponse(
      {this.result,
      this.totalCount,
      this.errorMessageAr,
      this.errorMessageEn,
      this.total,
      this.dateTimeNow,
      this.updateNumber,
      this.isUpdate,
      this.isPrint,
      this.permissionListId,
      this.isAuthorizedOnDashboardData});

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AttendanceResponseToJson(this);
}
