// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_vaccation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RequestVaccationState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestLoading,
    required TResult Function(T data) requestSuccess,
    required TResult Function(String error) requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestLoading,
    TResult? Function(T data)? requestSuccess,
    TResult? Function(String error)? requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestLoading,
    TResult Function(T data)? requestSuccess,
    TResult Function(String error)? requestError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RequestLoading<T> value) requestLoading,
    required TResult Function(RequestSuccess<T> value) requestSuccess,
    required TResult Function(RequestError<T> value) requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RequestLoading<T> value)? requestLoading,
    TResult? Function(RequestSuccess<T> value)? requestSuccess,
    TResult? Function(RequestError<T> value)? requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RequestLoading<T> value)? requestLoading,
    TResult Function(RequestSuccess<T> value)? requestSuccess,
    TResult Function(RequestError<T> value)? requestError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestVaccationStateCopyWith<T, $Res> {
  factory $RequestVaccationStateCopyWith(RequestVaccationState<T> value,
          $Res Function(RequestVaccationState<T>) then) =
      _$RequestVaccationStateCopyWithImpl<T, $Res, RequestVaccationState<T>>;
}

/// @nodoc
class _$RequestVaccationStateCopyWithImpl<T, $Res,
        $Val extends RequestVaccationState<T>>
    implements $RequestVaccationStateCopyWith<T, $Res> {
  _$RequestVaccationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$RequestVaccationStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RequestVaccationState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestLoading,
    required TResult Function(T data) requestSuccess,
    required TResult Function(String error) requestError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestLoading,
    TResult? Function(T data)? requestSuccess,
    TResult? Function(String error)? requestError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestLoading,
    TResult Function(T data)? requestSuccess,
    TResult Function(String error)? requestError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RequestLoading<T> value) requestLoading,
    required TResult Function(RequestSuccess<T> value) requestSuccess,
    required TResult Function(RequestError<T> value) requestError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RequestLoading<T> value)? requestLoading,
    TResult? Function(RequestSuccess<T> value)? requestSuccess,
    TResult? Function(RequestError<T> value)? requestError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RequestLoading<T> value)? requestLoading,
    TResult Function(RequestSuccess<T> value)? requestSuccess,
    TResult Function(RequestError<T> value)? requestError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements RequestVaccationState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$RequestLoadingImplCopyWith<T, $Res> {
  factory _$$RequestLoadingImplCopyWith(_$RequestLoadingImpl<T> value,
          $Res Function(_$RequestLoadingImpl<T>) then) =
      __$$RequestLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$RequestLoadingImplCopyWithImpl<T, $Res>
    extends _$RequestVaccationStateCopyWithImpl<T, $Res,
        _$RequestLoadingImpl<T>>
    implements _$$RequestLoadingImplCopyWith<T, $Res> {
  __$$RequestLoadingImplCopyWithImpl(_$RequestLoadingImpl<T> _value,
      $Res Function(_$RequestLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestLoadingImpl<T> implements RequestLoading<T> {
  const _$RequestLoadingImpl();

  @override
  String toString() {
    return 'RequestVaccationState<$T>.requestLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestLoading,
    required TResult Function(T data) requestSuccess,
    required TResult Function(String error) requestError,
  }) {
    return requestLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestLoading,
    TResult? Function(T data)? requestSuccess,
    TResult? Function(String error)? requestError,
  }) {
    return requestLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestLoading,
    TResult Function(T data)? requestSuccess,
    TResult Function(String error)? requestError,
    required TResult orElse(),
  }) {
    if (requestLoading != null) {
      return requestLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RequestLoading<T> value) requestLoading,
    required TResult Function(RequestSuccess<T> value) requestSuccess,
    required TResult Function(RequestError<T> value) requestError,
  }) {
    return requestLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RequestLoading<T> value)? requestLoading,
    TResult? Function(RequestSuccess<T> value)? requestSuccess,
    TResult? Function(RequestError<T> value)? requestError,
  }) {
    return requestLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RequestLoading<T> value)? requestLoading,
    TResult Function(RequestSuccess<T> value)? requestSuccess,
    TResult Function(RequestError<T> value)? requestError,
    required TResult orElse(),
  }) {
    if (requestLoading != null) {
      return requestLoading(this);
    }
    return orElse();
  }
}

abstract class RequestLoading<T> implements RequestVaccationState<T> {
  const factory RequestLoading() = _$RequestLoadingImpl<T>;
}

/// @nodoc
abstract class _$$RequestSuccessImplCopyWith<T, $Res> {
  factory _$$RequestSuccessImplCopyWith(_$RequestSuccessImpl<T> value,
          $Res Function(_$RequestSuccessImpl<T>) then) =
      __$$RequestSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$RequestSuccessImplCopyWithImpl<T, $Res>
    extends _$RequestVaccationStateCopyWithImpl<T, $Res,
        _$RequestSuccessImpl<T>>
    implements _$$RequestSuccessImplCopyWith<T, $Res> {
  __$$RequestSuccessImplCopyWithImpl(_$RequestSuccessImpl<T> _value,
      $Res Function(_$RequestSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$RequestSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$RequestSuccessImpl<T> implements RequestSuccess<T> {
  const _$RequestSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'RequestVaccationState<$T>.requestSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestSuccessImplCopyWith<T, _$RequestSuccessImpl<T>> get copyWith =>
      __$$RequestSuccessImplCopyWithImpl<T, _$RequestSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestLoading,
    required TResult Function(T data) requestSuccess,
    required TResult Function(String error) requestError,
  }) {
    return requestSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestLoading,
    TResult? Function(T data)? requestSuccess,
    TResult? Function(String error)? requestError,
  }) {
    return requestSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestLoading,
    TResult Function(T data)? requestSuccess,
    TResult Function(String error)? requestError,
    required TResult orElse(),
  }) {
    if (requestSuccess != null) {
      return requestSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RequestLoading<T> value) requestLoading,
    required TResult Function(RequestSuccess<T> value) requestSuccess,
    required TResult Function(RequestError<T> value) requestError,
  }) {
    return requestSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RequestLoading<T> value)? requestLoading,
    TResult? Function(RequestSuccess<T> value)? requestSuccess,
    TResult? Function(RequestError<T> value)? requestError,
  }) {
    return requestSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RequestLoading<T> value)? requestLoading,
    TResult Function(RequestSuccess<T> value)? requestSuccess,
    TResult Function(RequestError<T> value)? requestError,
    required TResult orElse(),
  }) {
    if (requestSuccess != null) {
      return requestSuccess(this);
    }
    return orElse();
  }
}

abstract class RequestSuccess<T> implements RequestVaccationState<T> {
  const factory RequestSuccess(final T data) = _$RequestSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$RequestSuccessImplCopyWith<T, _$RequestSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestErrorImplCopyWith<T, $Res> {
  factory _$$RequestErrorImplCopyWith(_$RequestErrorImpl<T> value,
          $Res Function(_$RequestErrorImpl<T>) then) =
      __$$RequestErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$RequestErrorImplCopyWithImpl<T, $Res>
    extends _$RequestVaccationStateCopyWithImpl<T, $Res, _$RequestErrorImpl<T>>
    implements _$$RequestErrorImplCopyWith<T, $Res> {
  __$$RequestErrorImplCopyWithImpl(
      _$RequestErrorImpl<T> _value, $Res Function(_$RequestErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$RequestErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RequestErrorImpl<T> implements RequestError<T> {
  const _$RequestErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'RequestVaccationState<$T>.requestError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestErrorImplCopyWith<T, _$RequestErrorImpl<T>> get copyWith =>
      __$$RequestErrorImplCopyWithImpl<T, _$RequestErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() requestLoading,
    required TResult Function(T data) requestSuccess,
    required TResult Function(String error) requestError,
  }) {
    return requestError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? requestLoading,
    TResult? Function(T data)? requestSuccess,
    TResult? Function(String error)? requestError,
  }) {
    return requestError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? requestLoading,
    TResult Function(T data)? requestSuccess,
    TResult Function(String error)? requestError,
    required TResult orElse(),
  }) {
    if (requestError != null) {
      return requestError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RequestLoading<T> value) requestLoading,
    required TResult Function(RequestSuccess<T> value) requestSuccess,
    required TResult Function(RequestError<T> value) requestError,
  }) {
    return requestError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RequestLoading<T> value)? requestLoading,
    TResult? Function(RequestSuccess<T> value)? requestSuccess,
    TResult? Function(RequestError<T> value)? requestError,
  }) {
    return requestError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RequestLoading<T> value)? requestLoading,
    TResult Function(RequestSuccess<T> value)? requestSuccess,
    TResult Function(RequestError<T> value)? requestError,
    required TResult orElse(),
  }) {
    if (requestError != null) {
      return requestError(this);
    }
    return orElse();
  }
}

abstract class RequestError<T> implements RequestVaccationState<T> {
  const factory RequestError({required final String error}) =
      _$RequestErrorImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$RequestErrorImplCopyWith<T, _$RequestErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
