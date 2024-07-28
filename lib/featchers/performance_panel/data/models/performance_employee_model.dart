import 'package:freezed_annotation/freezed_annotation.dart';
part 'performance_employee_model.g.dart';

@JsonSerializable()
class PerformanceEmployeeModel {
  DateTime dateFrom;
  DateTime dateTo;
  bool isMobile;
  PerformanceEmployeeModel(
      {required this.dateFrom, required this.dateTo, required this.isMobile});

  factory PerformanceEmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$PerformanceEmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PerformanceEmployeeModelToJson(this);
}
