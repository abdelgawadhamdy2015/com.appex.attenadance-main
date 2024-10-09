import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_state.freezed.dart';

@freezed
class AttendanceState<T> with _$AttendanceState<T> {
  const factory AttendanceState.initial() = _Initial;
  const factory AttendanceState.loading() = AttendanceStateLoading;
  const factory AttendanceState.success(T data) = AttendanceStateSuccess<T>;
  const factory AttendanceState.error({required String error}) = AttendanceStateError;
}
