import 'package:json_annotation/json_annotation.dart';

part 'departure_model.g.dart';

@JsonSerializable()
class DepartureModel {
  String? name;
  String? status;

  DepartureModel(this.name, this.status);

  factory DepartureModel.fromJson(Map<String, dynamic> json) =>
      _$DepartureModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartureModelToJson(this);
}
