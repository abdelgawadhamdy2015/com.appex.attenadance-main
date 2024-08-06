import 'package:freezed_annotation/freezed_annotation.dart';

part  'send_attendance_state.freezed.dart';

@freezed
class SendAttendanceState<T> with _$SendAttendanceState<T> {
  const factory SendAttendanceState.initial() = _Initial;
  const factory SendAttendanceState.sendLoading() = SendLoading;
  const factory SendAttendanceState.sendSuccess(T data) = SendSuccess<T>;
  const factory SendAttendanceState.sendError({required String error}) = SendError;
}
