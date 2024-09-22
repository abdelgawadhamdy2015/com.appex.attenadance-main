import 'package:json_annotation/json_annotation.dart';
part 'request_model.g.dart';

@JsonSerializable()
class RequestVaccation {
  @JsonKey(name: "VaccationId")
  int? vaccationId;
  bool? isMobile;
  @JsonKey(name: "DateFrom")
  String? dateFrom;
  @JsonKey(name: "DateTo")
  String? dateTo;
  @JsonKey(name: "Note")
  String? note;

  RequestVaccation(
      {this.vaccationId, this.isMobile, this.dateFrom, this.dateTo, this.note});

  factory RequestVaccation.fromJson(Map<String, dynamic> json) =>
      _$RequestVaccationFromJson(json);

  Map<String, dynamic> toJson() => _$RequestVaccationToJson(this);
}
