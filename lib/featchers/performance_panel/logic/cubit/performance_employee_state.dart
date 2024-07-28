import 'package:freezed_annotation/freezed_annotation.dart';

part 'performance_employee_state.freezed.dart';

@freezed
class PerformanceEmployeeState<T> with _$PerformanceEmployeeState<T> {
  const factory PerformanceEmployeeState.initial() = _Initial;
  const factory PerformanceEmployeeState.loading() = Loading;
  const factory PerformanceEmployeeState.success(T data) = Success<T>;
  const factory PerformanceEmployeeState.error({required String error}) = Error;
}
