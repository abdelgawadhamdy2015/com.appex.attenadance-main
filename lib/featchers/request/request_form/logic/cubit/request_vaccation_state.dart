import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_vaccation_state.freezed.dart';

@freezed
class RequestVaccationState<T> with _$RequestVaccationState<T> {
  const factory RequestVaccationState.initial() = _Initial;
  const factory RequestVaccationState.requestLoading() = RequestLoading;
  const factory RequestVaccationState.requestSuccess(T data) =
      RequestSuccess<T>;
  const factory RequestVaccationState.requestError({required String error}) =
      RequestError;
}
