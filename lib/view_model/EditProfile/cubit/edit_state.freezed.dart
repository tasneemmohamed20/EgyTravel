// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() editLoading,
    required TResult Function(T data) editSuccess,
    required TResult Function(String error) editError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? editLoading,
    TResult? Function(T data)? editSuccess,
    TResult? Function(String error)? editError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? editLoading,
    TResult Function(T data)? editSuccess,
    TResult Function(String error)? editError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(EditLoading<T> value) editLoading,
    required TResult Function(EditSuccess<T> value) editSuccess,
    required TResult Function(EditError<T> value) editError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(EditLoading<T> value)? editLoading,
    TResult? Function(EditSuccess<T> value)? editSuccess,
    TResult? Function(EditError<T> value)? editError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(EditLoading<T> value)? editLoading,
    TResult Function(EditSuccess<T> value)? editSuccess,
    TResult Function(EditError<T> value)? editError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditStateCopyWith<T, $Res> {
  factory $EditStateCopyWith(
          EditState<T> value, $Res Function(EditState<T>) then) =
      _$EditStateCopyWithImpl<T, $Res, EditState<T>>;
}

/// @nodoc
class _$EditStateCopyWithImpl<T, $Res, $Val extends EditState<T>>
    implements $EditStateCopyWith<T, $Res> {
  _$EditStateCopyWithImpl(this._value, this._then);

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
    extends _$EditStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
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
    return 'EditState<$T>.initial()';
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
    required TResult Function() editLoading,
    required TResult Function(T data) editSuccess,
    required TResult Function(String error) editError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? editLoading,
    TResult? Function(T data)? editSuccess,
    TResult? Function(String error)? editError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? editLoading,
    TResult Function(T data)? editSuccess,
    TResult Function(String error)? editError,
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
    required TResult Function(EditLoading<T> value) editLoading,
    required TResult Function(EditSuccess<T> value) editSuccess,
    required TResult Function(EditError<T> value) editError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(EditLoading<T> value)? editLoading,
    TResult? Function(EditSuccess<T> value)? editSuccess,
    TResult? Function(EditError<T> value)? editError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(EditLoading<T> value)? editLoading,
    TResult Function(EditSuccess<T> value)? editSuccess,
    TResult Function(EditError<T> value)? editError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements EditState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$EditLoadingImplCopyWith<T, $Res> {
  factory _$$EditLoadingImplCopyWith(_$EditLoadingImpl<T> value,
          $Res Function(_$EditLoadingImpl<T>) then) =
      __$$EditLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$EditLoadingImplCopyWithImpl<T, $Res>
    extends _$EditStateCopyWithImpl<T, $Res, _$EditLoadingImpl<T>>
    implements _$$EditLoadingImplCopyWith<T, $Res> {
  __$$EditLoadingImplCopyWithImpl(
      _$EditLoadingImpl<T> _value, $Res Function(_$EditLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditLoadingImpl<T> implements EditLoading<T> {
  const _$EditLoadingImpl();

  @override
  String toString() {
    return 'EditState<$T>.editLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() editLoading,
    required TResult Function(T data) editSuccess,
    required TResult Function(String error) editError,
  }) {
    return editLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? editLoading,
    TResult? Function(T data)? editSuccess,
    TResult? Function(String error)? editError,
  }) {
    return editLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? editLoading,
    TResult Function(T data)? editSuccess,
    TResult Function(String error)? editError,
    required TResult orElse(),
  }) {
    if (editLoading != null) {
      return editLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(EditLoading<T> value) editLoading,
    required TResult Function(EditSuccess<T> value) editSuccess,
    required TResult Function(EditError<T> value) editError,
  }) {
    return editLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(EditLoading<T> value)? editLoading,
    TResult? Function(EditSuccess<T> value)? editSuccess,
    TResult? Function(EditError<T> value)? editError,
  }) {
    return editLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(EditLoading<T> value)? editLoading,
    TResult Function(EditSuccess<T> value)? editSuccess,
    TResult Function(EditError<T> value)? editError,
    required TResult orElse(),
  }) {
    if (editLoading != null) {
      return editLoading(this);
    }
    return orElse();
  }
}

abstract class EditLoading<T> implements EditState<T> {
  const factory EditLoading() = _$EditLoadingImpl<T>;
}

/// @nodoc
abstract class _$$EditSuccessImplCopyWith<T, $Res> {
  factory _$$EditSuccessImplCopyWith(_$EditSuccessImpl<T> value,
          $Res Function(_$EditSuccessImpl<T>) then) =
      __$$EditSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$EditSuccessImplCopyWithImpl<T, $Res>
    extends _$EditStateCopyWithImpl<T, $Res, _$EditSuccessImpl<T>>
    implements _$$EditSuccessImplCopyWith<T, $Res> {
  __$$EditSuccessImplCopyWithImpl(
      _$EditSuccessImpl<T> _value, $Res Function(_$EditSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$EditSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$EditSuccessImpl<T> implements EditSuccess<T> {
  const _$EditSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'EditState<$T>.editSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditSuccessImplCopyWith<T, _$EditSuccessImpl<T>> get copyWith =>
      __$$EditSuccessImplCopyWithImpl<T, _$EditSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() editLoading,
    required TResult Function(T data) editSuccess,
    required TResult Function(String error) editError,
  }) {
    return editSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? editLoading,
    TResult? Function(T data)? editSuccess,
    TResult? Function(String error)? editError,
  }) {
    return editSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? editLoading,
    TResult Function(T data)? editSuccess,
    TResult Function(String error)? editError,
    required TResult orElse(),
  }) {
    if (editSuccess != null) {
      return editSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(EditLoading<T> value) editLoading,
    required TResult Function(EditSuccess<T> value) editSuccess,
    required TResult Function(EditError<T> value) editError,
  }) {
    return editSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(EditLoading<T> value)? editLoading,
    TResult? Function(EditSuccess<T> value)? editSuccess,
    TResult? Function(EditError<T> value)? editError,
  }) {
    return editSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(EditLoading<T> value)? editLoading,
    TResult Function(EditSuccess<T> value)? editSuccess,
    TResult Function(EditError<T> value)? editError,
    required TResult orElse(),
  }) {
    if (editSuccess != null) {
      return editSuccess(this);
    }
    return orElse();
  }
}

abstract class EditSuccess<T> implements EditState<T> {
  const factory EditSuccess(final T data) = _$EditSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$EditSuccessImplCopyWith<T, _$EditSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditErrorImplCopyWith<T, $Res> {
  factory _$$EditErrorImplCopyWith(
          _$EditErrorImpl<T> value, $Res Function(_$EditErrorImpl<T>) then) =
      __$$EditErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$EditErrorImplCopyWithImpl<T, $Res>
    extends _$EditStateCopyWithImpl<T, $Res, _$EditErrorImpl<T>>
    implements _$$EditErrorImplCopyWith<T, $Res> {
  __$$EditErrorImplCopyWithImpl(
      _$EditErrorImpl<T> _value, $Res Function(_$EditErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$EditErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditErrorImpl<T> implements EditError<T> {
  const _$EditErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'EditState<$T>.editError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditErrorImplCopyWith<T, _$EditErrorImpl<T>> get copyWith =>
      __$$EditErrorImplCopyWithImpl<T, _$EditErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() editLoading,
    required TResult Function(T data) editSuccess,
    required TResult Function(String error) editError,
  }) {
    return editError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? editLoading,
    TResult? Function(T data)? editSuccess,
    TResult? Function(String error)? editError,
  }) {
    return editError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? editLoading,
    TResult Function(T data)? editSuccess,
    TResult Function(String error)? editError,
    required TResult orElse(),
  }) {
    if (editError != null) {
      return editError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(EditLoading<T> value) editLoading,
    required TResult Function(EditSuccess<T> value) editSuccess,
    required TResult Function(EditError<T> value) editError,
  }) {
    return editError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(EditLoading<T> value)? editLoading,
    TResult? Function(EditSuccess<T> value)? editSuccess,
    TResult? Function(EditError<T> value)? editError,
  }) {
    return editError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(EditLoading<T> value)? editLoading,
    TResult Function(EditSuccess<T> value)? editSuccess,
    TResult Function(EditError<T> value)? editError,
    required TResult orElse(),
  }) {
    if (editError != null) {
      return editError(this);
    }
    return orElse();
  }
}

abstract class EditError<T> implements EditState<T> {
  const factory EditError({required final String error}) = _$EditErrorImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$EditErrorImplCopyWith<T, _$EditErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
