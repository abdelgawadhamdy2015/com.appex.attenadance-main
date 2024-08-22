// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PermissionState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() permissionLoading,
    required TResult Function(T data) permissionSuccess,
    required TResult Function(String error) permissionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? permissionLoading,
    TResult? Function(T data)? permissionSuccess,
    TResult? Function(String error)? permissionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? permissionLoading,
    TResult Function(T data)? permissionSuccess,
    TResult Function(String error)? permissionError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(PermissionLoading<T> value) permissionLoading,
    required TResult Function(PermissionSuccess<T> value) permissionSuccess,
    required TResult Function(PermissionError<T> value) permissionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(PermissionLoading<T> value)? permissionLoading,
    TResult? Function(PermissionSuccess<T> value)? permissionSuccess,
    TResult? Function(PermissionError<T> value)? permissionError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(PermissionLoading<T> value)? permissionLoading,
    TResult Function(PermissionSuccess<T> value)? permissionSuccess,
    TResult Function(PermissionError<T> value)? permissionError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionStateCopyWith<T, $Res> {
  factory $PermissionStateCopyWith(
          PermissionState<T> value, $Res Function(PermissionState<T>) then) =
      _$PermissionStateCopyWithImpl<T, $Res, PermissionState<T>>;
}

/// @nodoc
class _$PermissionStateCopyWithImpl<T, $Res, $Val extends PermissionState<T>>
    implements $PermissionStateCopyWith<T, $Res> {
  _$PermissionStateCopyWithImpl(this._value, this._then);

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
    extends _$PermissionStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
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
    return 'PermissionState<$T>.initial()';
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
    required TResult Function() permissionLoading,
    required TResult Function(T data) permissionSuccess,
    required TResult Function(String error) permissionError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? permissionLoading,
    TResult? Function(T data)? permissionSuccess,
    TResult? Function(String error)? permissionError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? permissionLoading,
    TResult Function(T data)? permissionSuccess,
    TResult Function(String error)? permissionError,
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
    required TResult Function(PermissionLoading<T> value) permissionLoading,
    required TResult Function(PermissionSuccess<T> value) permissionSuccess,
    required TResult Function(PermissionError<T> value) permissionError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(PermissionLoading<T> value)? permissionLoading,
    TResult? Function(PermissionSuccess<T> value)? permissionSuccess,
    TResult? Function(PermissionError<T> value)? permissionError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(PermissionLoading<T> value)? permissionLoading,
    TResult Function(PermissionSuccess<T> value)? permissionSuccess,
    TResult Function(PermissionError<T> value)? permissionError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements PermissionState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$PermissionLoadingImplCopyWith<T, $Res> {
  factory _$$PermissionLoadingImplCopyWith(_$PermissionLoadingImpl<T> value,
          $Res Function(_$PermissionLoadingImpl<T>) then) =
      __$$PermissionLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$PermissionLoadingImplCopyWithImpl<T, $Res>
    extends _$PermissionStateCopyWithImpl<T, $Res, _$PermissionLoadingImpl<T>>
    implements _$$PermissionLoadingImplCopyWith<T, $Res> {
  __$$PermissionLoadingImplCopyWithImpl(_$PermissionLoadingImpl<T> _value,
      $Res Function(_$PermissionLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PermissionLoadingImpl<T> implements PermissionLoading<T> {
  const _$PermissionLoadingImpl();

  @override
  String toString() {
    return 'PermissionState<$T>.permissionLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() permissionLoading,
    required TResult Function(T data) permissionSuccess,
    required TResult Function(String error) permissionError,
  }) {
    return permissionLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? permissionLoading,
    TResult? Function(T data)? permissionSuccess,
    TResult? Function(String error)? permissionError,
  }) {
    return permissionLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? permissionLoading,
    TResult Function(T data)? permissionSuccess,
    TResult Function(String error)? permissionError,
    required TResult orElse(),
  }) {
    if (permissionLoading != null) {
      return permissionLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(PermissionLoading<T> value) permissionLoading,
    required TResult Function(PermissionSuccess<T> value) permissionSuccess,
    required TResult Function(PermissionError<T> value) permissionError,
  }) {
    return permissionLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(PermissionLoading<T> value)? permissionLoading,
    TResult? Function(PermissionSuccess<T> value)? permissionSuccess,
    TResult? Function(PermissionError<T> value)? permissionError,
  }) {
    return permissionLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(PermissionLoading<T> value)? permissionLoading,
    TResult Function(PermissionSuccess<T> value)? permissionSuccess,
    TResult Function(PermissionError<T> value)? permissionError,
    required TResult orElse(),
  }) {
    if (permissionLoading != null) {
      return permissionLoading(this);
    }
    return orElse();
  }
}

abstract class PermissionLoading<T> implements PermissionState<T> {
  const factory PermissionLoading() = _$PermissionLoadingImpl<T>;
}

/// @nodoc
abstract class _$$PermissionSuccessImplCopyWith<T, $Res> {
  factory _$$PermissionSuccessImplCopyWith(_$PermissionSuccessImpl<T> value,
          $Res Function(_$PermissionSuccessImpl<T>) then) =
      __$$PermissionSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$PermissionSuccessImplCopyWithImpl<T, $Res>
    extends _$PermissionStateCopyWithImpl<T, $Res, _$PermissionSuccessImpl<T>>
    implements _$$PermissionSuccessImplCopyWith<T, $Res> {
  __$$PermissionSuccessImplCopyWithImpl(_$PermissionSuccessImpl<T> _value,
      $Res Function(_$PermissionSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$PermissionSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$PermissionSuccessImpl<T> implements PermissionSuccess<T> {
  const _$PermissionSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'PermissionState<$T>.permissionSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionSuccessImplCopyWith<T, _$PermissionSuccessImpl<T>>
      get copyWith =>
          __$$PermissionSuccessImplCopyWithImpl<T, _$PermissionSuccessImpl<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() permissionLoading,
    required TResult Function(T data) permissionSuccess,
    required TResult Function(String error) permissionError,
  }) {
    return permissionSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? permissionLoading,
    TResult? Function(T data)? permissionSuccess,
    TResult? Function(String error)? permissionError,
  }) {
    return permissionSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? permissionLoading,
    TResult Function(T data)? permissionSuccess,
    TResult Function(String error)? permissionError,
    required TResult orElse(),
  }) {
    if (permissionSuccess != null) {
      return permissionSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(PermissionLoading<T> value) permissionLoading,
    required TResult Function(PermissionSuccess<T> value) permissionSuccess,
    required TResult Function(PermissionError<T> value) permissionError,
  }) {
    return permissionSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(PermissionLoading<T> value)? permissionLoading,
    TResult? Function(PermissionSuccess<T> value)? permissionSuccess,
    TResult? Function(PermissionError<T> value)? permissionError,
  }) {
    return permissionSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(PermissionLoading<T> value)? permissionLoading,
    TResult Function(PermissionSuccess<T> value)? permissionSuccess,
    TResult Function(PermissionError<T> value)? permissionError,
    required TResult orElse(),
  }) {
    if (permissionSuccess != null) {
      return permissionSuccess(this);
    }
    return orElse();
  }
}

abstract class PermissionSuccess<T> implements PermissionState<T> {
  const factory PermissionSuccess(final T data) = _$PermissionSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$PermissionSuccessImplCopyWith<T, _$PermissionSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PermissionErrorImplCopyWith<T, $Res> {
  factory _$$PermissionErrorImplCopyWith(_$PermissionErrorImpl<T> value,
          $Res Function(_$PermissionErrorImpl<T>) then) =
      __$$PermissionErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PermissionErrorImplCopyWithImpl<T, $Res>
    extends _$PermissionStateCopyWithImpl<T, $Res, _$PermissionErrorImpl<T>>
    implements _$$PermissionErrorImplCopyWith<T, $Res> {
  __$$PermissionErrorImplCopyWithImpl(_$PermissionErrorImpl<T> _value,
      $Res Function(_$PermissionErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PermissionErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PermissionErrorImpl<T> implements PermissionError<T> {
  const _$PermissionErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'PermissionState<$T>.permissionError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionErrorImplCopyWith<T, _$PermissionErrorImpl<T>> get copyWith =>
      __$$PermissionErrorImplCopyWithImpl<T, _$PermissionErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() permissionLoading,
    required TResult Function(T data) permissionSuccess,
    required TResult Function(String error) permissionError,
  }) {
    return permissionError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? permissionLoading,
    TResult? Function(T data)? permissionSuccess,
    TResult? Function(String error)? permissionError,
  }) {
    return permissionError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? permissionLoading,
    TResult Function(T data)? permissionSuccess,
    TResult Function(String error)? permissionError,
    required TResult orElse(),
  }) {
    if (permissionError != null) {
      return permissionError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(PermissionLoading<T> value) permissionLoading,
    required TResult Function(PermissionSuccess<T> value) permissionSuccess,
    required TResult Function(PermissionError<T> value) permissionError,
  }) {
    return permissionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(PermissionLoading<T> value)? permissionLoading,
    TResult? Function(PermissionSuccess<T> value)? permissionSuccess,
    TResult? Function(PermissionError<T> value)? permissionError,
  }) {
    return permissionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(PermissionLoading<T> value)? permissionLoading,
    TResult Function(PermissionSuccess<T> value)? permissionSuccess,
    TResult Function(PermissionError<T> value)? permissionError,
    required TResult orElse(),
  }) {
    if (permissionError != null) {
      return permissionError(this);
    }
    return orElse();
  }
}

abstract class PermissionError<T> implements PermissionState<T> {
  const factory PermissionError({required final String error}) =
      _$PermissionErrorImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$PermissionErrorImplCopyWith<T, _$PermissionErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
