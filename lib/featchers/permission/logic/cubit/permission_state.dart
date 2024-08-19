import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_state.freezed.dart';

@freezed
class PermissionState<T> with _$PermissionState<T> {
  const factory PermissionState.initial() = _Initial;
  const factory PermissionState.permissionLoading() = PermissionLoading;
  const factory PermissionState.permissionSuccess(T data) =
      PermissionSuccess<T>;
  const factory PermissionState.permissionError({required String error}) =
      permissionError;
}
