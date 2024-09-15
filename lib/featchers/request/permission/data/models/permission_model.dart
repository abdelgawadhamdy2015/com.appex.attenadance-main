// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_model.g.dart';

@JsonSerializable()
class PermissionModel {
  @JsonKey(name: "Day")
  DateTime? day;
  int? type;
  String? totalHoursForOpenShift;
  @JsonKey(name: 'shift1_start')
  String? shift1Start;
  @JsonKey(name: 'shift1_end')
  String? shift1End;
  @JsonKey(name: 'shift2_start')
  String? shift2Start;
  @JsonKey(name: 'shift2_end')
  String? shift2End;
  @JsonKey(name: 'shift3_start')
  String? shift3Start;
  @JsonKey(name: 'shift3_end')
  String? shift3End;
  @JsonKey(name: 'shift4_start')
  String? shift4Start;
  @JsonKey(name: 'shift4_end')
  String? shift4End;
  @JsonKey(name: 'Note')
  String? note;
  @JsonKey(name: 'Has_shift2')
  bool? hasShift2;
  @JsonKey(name: 'Has_shift3')
  bool? hasShift3;
  @JsonKey(name: 'Has_shift4')
  bool? hasShift4;
  @JsonKey(name: 'shift1_IsExtended')
  bool? shift1IsExtended;
  @JsonKey(name: 'shift2_IsExtended')
  bool? shift2IsExtended;
  @JsonKey(name: 'shift3_IsExtended')
  bool? shift3IsExtended;
  @JsonKey(name: 'shift4_IsExtended')
  bool? shift4IsExtended;
  bool? isMobile;

  PermissionModel(
      {this.day,
      this.type,
      this.totalHoursForOpenShift,
      this.shift1Start,
      this.shift1End,
      this.shift2Start,
      this.shift2End,
      this.shift3Start,
      this.shift3End,
      this.shift4Start,
      this.shift4End,
      this.shift1IsExtended,
      this.shift2IsExtended,
      this.shift3IsExtended,
      this.shift4IsExtended,
      this.hasShift2,
      this.hasShift3,
      this.hasShift4,
      this.isMobile,
      this.note});

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionModelToJson(this);
}
