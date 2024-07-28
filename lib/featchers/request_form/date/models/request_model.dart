import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part 'request_model.g.dart';

@JsonSerializable()
class RequestVaccation {
  @Key("VaccationId")
  int? vaccationId;
  bool? isMobile;
  @Key("DateFrom")
  String? dateFrom;
  @Key("DateTo")
  String? dateTo;
  @Key("Note")
  String? note;

  RequestVaccation(
      {this.vaccationId, this.isMobile, this.dateFrom, this.dateTo, this.note});

  factory RequestVaccation.fromJson(Map<String, dynamic> json) =>
      _$RequestVaccationFromJson(json);

  Map<String, dynamic> toJson() => _$RequestVaccationToJson(this);
}
