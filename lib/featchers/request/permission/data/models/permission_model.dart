// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_model.g.dart';

@JsonSerializable()
class PermissionModel {
  @JsonValue("Day")
  DateTime? day;
  int? type;
  String? totalHoursForOpenShift;
  String? shift1_start;
  String? shift1_end;
  String? shift2_start;
  String? shift2_end;
  String? shift3_start;
  String? shift3_end;
  String? shift4_start;
  String? shift4_end;
  String? Note;
  bool? Has_shift2;
  bool? Has_shift3;
  bool? Has_shift4;
  bool? shift1_IsExtended;
  bool? shift2_IsExtended;
  bool? shift3_IsExtended;
  bool? shift4_IsExtended;
  bool? isMobile;

  PermissionModel(
      {this.day,
      this.type,
      this.totalHoursForOpenShift,
      this.shift1_start,
      this.shift1_end,
      this.shift2_start,
      this.shift2_end,
      this.shift3_start,
      this.shift3_end,
      this.shift4_start,
      this.shift4_end,
      this.shift1_IsExtended,
      this.shift2_IsExtended,
      this.shift3_IsExtended,
      this.shift4_IsExtended,
      this.Has_shift2,
      this.Has_shift3,
      this.Has_shift4,
      this.isMobile,
      this.Note});

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionModelToJson(this);
}
