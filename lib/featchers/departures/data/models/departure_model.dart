import 'package:json_annotation/json_annotation.dart';

part 'departure_model.g.dart';

@JsonSerializable()
class DepartureModel {
  int? id;
  int? code;
  Branch? branch;
  Branch? employee;
  Branch? vacation;
  Shift? shift;
  ShiftDetails? shiftDetails;
  int? duration;
  String? note;
  DateTime? startdate;
  DateTime? enddate;
  bool? canDelete;
  String? statusArabic;
  String? statusEnglish;
  Shift? permissiontype;
  String? docDate;

  DepartureModel(
      {this.id,
      this.code,
      this.branch,
      this.employee,
      this.vacation,
      this.shift,
      this.shiftDetails,
      this.duration,
      this.note,
      this.startdate,
      this.enddate,
      this.canDelete,
      this.statusArabic,
      this.statusEnglish,
      this.docDate,
      this.permissiontype});

  factory DepartureModel.fromJson(Map<String, dynamic> json) =>
      _$DepartureModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartureModelToJson(this);
}

@JsonSerializable()
class Shift {
  int? type;
  String? arabicName;
  String? latinName;
  Shift({this.type, this.arabicName, this.latinName});
  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftToJson(this);
}

@JsonSerializable()
class Branch {
  int? id;
  String? arabicName;
  String? latinName;

  Branch({this.id, this.arabicName, this.latinName});

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);
}

@JsonSerializable()
class ShiftDetails {
  @JsonKey(name: "shift1_start")
  String? shift1Start;
  @JsonKey(name: "shift1_end")
  String? shift1End;
  @JsonKey(name: "shift2_start")
  String? shift2Start;
  @JsonKey(name: "shift2_end")
  String? shift2End;
  @JsonKey(name: "shift3_start")
  String? shift3Start;
  @JsonKey(name: "shift3_end")
  String? shift3End;
  @JsonKey(name: "shift4_start")
  String? shift4Start;
  @JsonKey(name: "shift4_end")
  String? shift4End;
  @JsonKey(name: "has_Shift2")
  bool? hasShift2;
  @JsonKey(name: "has_Shift3")
  bool? hasShift3;
  @JsonKey(name: "has_Shift4")
  bool? hasShift4;
  @JsonKey(name: "shift1_IsExtended")
  bool? shift1IsExtended;
  @JsonKey(name: "shift2_IsExtended")
  bool? shift2IsExtended;
  @JsonKey(name: "shift3_IsExtended")
  bool? shift3IsExtended;
  @JsonKey(name: "shift4_IsExtended")
  bool? shift4IsExtended;
  String? totalDayHours;

  ShiftDetails(
      {this.shift1Start,
      this.shift1End,
      this.shift1IsExtended,
      this.shift2Start,
      this.shift2End,
      this.shift2IsExtended,
      this.hasShift2,
      this.shift3Start,
      this.shift3End,
      this.shift3IsExtended,
      this.hasShift3,
      this.shift4Start,
      this.shift4End,
      this.shift4IsExtended,
      this.hasShift4,
      this.totalDayHours});

  factory ShiftDetails.fromJson(Map<String, dynamic> json) =>
      _$ShiftDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftDetailsToJson(this);
}
