import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_vaccations_state.freezed.dart';

@freezed
class AllVaccationsState<T> with _$AllVaccationsState<T> {
  const factory AllVaccationsState.initial() = _Initial;
  const factory AllVaccationsState.loading() = Loading;
  const factory AllVaccationsState.success(T data) = Success<T>;
  const factory AllVaccationsState.error({required String error}) = Error;
}
