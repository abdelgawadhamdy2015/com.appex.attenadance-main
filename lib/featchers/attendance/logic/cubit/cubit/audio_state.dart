import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_state.freezed.dart';

@freezed
class AudioState<T> with _$AudioState<T> {
  const factory AudioState.initial() = _Initial;
  const factory AudioState.loading() = Loading;
  const factory AudioState.success(T data) = Success<T>;
  const factory AudioState.error({required String error}) = Error;
}
