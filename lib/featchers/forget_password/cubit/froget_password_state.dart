import 'package:freezed_annotation/freezed_annotation.dart';

part 'froget_password_state.freezed.dart';

@freezed
class FrogetPasswordState with _$FrogetPasswordState {
  const factory FrogetPasswordState.initial() = _Initial;
}
