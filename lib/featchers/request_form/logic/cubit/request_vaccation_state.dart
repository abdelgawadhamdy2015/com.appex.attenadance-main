import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_vaccation_state.freezed.dart';

@freezed
class RequestVaccationState<T> with _$RequestVaccationState<T> {
  const factory RequestVaccationState.initial() = _Initial;
  const factory RequestVaccationState.loading() = Loading;
  const factory RequestVaccationState.success(T data) = Success<T>;
  const factory RequestVaccationState.error({required String error}) = Error;
}
