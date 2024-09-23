import 'package:json_annotation/json_annotation.dart';

part 'departure_model.g.dart';

@JsonSerializable()
class DepartureModel {
  String? requestNumber;
  String? requestgDate;
  String? status;
  int? type;
  String? from;
  String? to;

  DepartureModel(this.requestNumber, this.status, this.type, this.from, this.to,
      this.requestgDate);

  factory DepartureModel.fromJson(Map<String, dynamic> json) =>
      _$DepartureModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartureModelToJson(this);
}
