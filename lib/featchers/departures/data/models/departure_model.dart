import 'package:json_annotation/json_annotation.dart';

part 'departure_model.g.dart';

@JsonSerializable()
class DepartureModel {
  int? id;
  int? code;
  Branch? branch;
  Branch? employee;
  Branch? vacation;
  int? duration;
  String? note;
  String? startdate;
  String? enddate;
  bool? canDelete;
  String? statusArabic;
  String? statusEnglish;

  DepartureModel(
      {this.id,
      this.code,
      this.branch,
      this.employee,
      this.vacation,
      this.duration,
      this.note,
      this.startdate,
      this.enddate,
      this.canDelete,
      this.statusArabic,
      this.statusEnglish});

  factory DepartureModel.fromJson(Map<String, dynamic> json) =>
      _$DepartureModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartureModelToJson(this);
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
