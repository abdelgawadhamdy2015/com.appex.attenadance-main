import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_model.g.dart';

@JsonSerializable()
class ShiftModel {
  int shiftId;
  bool active;
  bool shiftToSecondDay;
  String startTime;
  String endTime;

  ShiftModel(this.shiftId, this.active, this.shiftToSecondDay, this.startTime,
      this.endTime);

  factory ShiftModel.fromJson(Map<String, dynamic> json) =>
      _$ShiftModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftModelToJson(this);
}
