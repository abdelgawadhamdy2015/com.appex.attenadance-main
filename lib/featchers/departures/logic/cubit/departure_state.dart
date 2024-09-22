import 'package:freezed_annotation/freezed_annotation.dart';

part 'departure_state.freezed.dart';

@freezed
class DepartureState<T> with _$DepartureState<T> {
  const factory DepartureState.departureInitial() = _Initial;
  const factory DepartureState.departureLoading() = DepartureLoading;
  const factory DepartureState.departureSuccess(T data) = DepartureSuccess<T>;
  const factory DepartureState.departureError({required String error}) = DepartureError;
}