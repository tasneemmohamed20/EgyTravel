// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_by_id_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ArticleByIdState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ArticlesByIDResponseModel data) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ArticlesByIDResponseModel data)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ArticlesByIDResponseModel data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ArtLoading value) loading,
    required TResult Function(ArtSuccess value) success,
    required TResult Function(ArtError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ArtLoading value)? loading,
    TResult? Function(ArtSuccess value)? success,
    TResult? Function(ArtError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ArtLoading value)? loading,
    TResult Function(ArtSuccess value)? success,
    TResult Function(ArtError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleByIdStateCopyWith<$Res> {
  factory $ArticleByIdStateCopyWith(
          ArticleByIdState value, $Res Function(ArticleByIdState) then) =
      _$ArticleByIdStateCopyWithImpl<$Res, ArticleByIdState>;
}

/// @nodoc
class _$ArticleByIdStateCopyWithImpl<$Res, $Val extends ArticleByIdState>
    implements $ArticleByIdStateCopyWith<$Res> {
  _$ArticleByIdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ArticleByIdStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ArticleByIdState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ArticlesByIDResponseModel data) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ArticlesByIDResponseModel data)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ArticlesByIDResponseModel data)? success,
    TResult Function(String message)? error,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(ArtLoading value) loading,
    required TResult Function(ArtSuccess value) success,
    required TResult Function(ArtError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ArtLoading value)? loading,
    TResult? Function(ArtSuccess value)? success,
    TResult? Function(ArtError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ArtLoading value)? loading,
    TResult Function(ArtSuccess value)? success,
    TResult Function(ArtError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ArticleByIdState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ArtLoadingImplCopyWith<$Res> {
  factory _$$ArtLoadingImplCopyWith(
          _$ArtLoadingImpl value, $Res Function(_$ArtLoadingImpl) then) =
      __$$ArtLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ArtLoadingImplCopyWithImpl<$Res>
    extends _$ArticleByIdStateCopyWithImpl<$Res, _$ArtLoadingImpl>
    implements _$$ArtLoadingImplCopyWith<$Res> {
  __$$ArtLoadingImplCopyWithImpl(
      _$ArtLoadingImpl _value, $Res Function(_$ArtLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ArtLoadingImpl implements ArtLoading {
  const _$ArtLoadingImpl();

  @override
  String toString() {
    return 'ArticleByIdState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ArtLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ArticlesByIDResponseModel data) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ArticlesByIDResponseModel data)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ArticlesByIDResponseModel data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ArtLoading value) loading,
    required TResult Function(ArtSuccess value) success,
    required TResult Function(ArtError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ArtLoading value)? loading,
    TResult? Function(ArtSuccess value)? success,
    TResult? Function(ArtError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ArtLoading value)? loading,
    TResult Function(ArtSuccess value)? success,
    TResult Function(ArtError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ArtLoading implements ArticleByIdState {
  const factory ArtLoading() = _$ArtLoadingImpl;
}

/// @nodoc
abstract class _$$ArtSuccessImplCopyWith<$Res> {
  factory _$$ArtSuccessImplCopyWith(
          _$ArtSuccessImpl value, $Res Function(_$ArtSuccessImpl) then) =
      __$$ArtSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ArticlesByIDResponseModel data});
}

/// @nodoc
class __$$ArtSuccessImplCopyWithImpl<$Res>
    extends _$ArticleByIdStateCopyWithImpl<$Res, _$ArtSuccessImpl>
    implements _$$ArtSuccessImplCopyWith<$Res> {
  __$$ArtSuccessImplCopyWithImpl(
      _$ArtSuccessImpl _value, $Res Function(_$ArtSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ArtSuccessImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ArticlesByIDResponseModel,
    ));
  }
}

/// @nodoc

class _$ArtSuccessImpl implements ArtSuccess {
  const _$ArtSuccessImpl(this.data);

  @override
  final ArticlesByIDResponseModel data;

  @override
  String toString() {
    return 'ArticleByIdState.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtSuccessImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtSuccessImplCopyWith<_$ArtSuccessImpl> get copyWith =>
      __$$ArtSuccessImplCopyWithImpl<_$ArtSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ArticlesByIDResponseModel data) success,
    required TResult Function(String message) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ArticlesByIDResponseModel data)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ArticlesByIDResponseModel data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ArtLoading value) loading,
    required TResult Function(ArtSuccess value) success,
    required TResult Function(ArtError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ArtLoading value)? loading,
    TResult? Function(ArtSuccess value)? success,
    TResult? Function(ArtError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ArtLoading value)? loading,
    TResult Function(ArtSuccess value)? success,
    TResult Function(ArtError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ArtSuccess implements ArticleByIdState {
  const factory ArtSuccess(final ArticlesByIDResponseModel data) =
      _$ArtSuccessImpl;

  ArticlesByIDResponseModel get data;
  @JsonKey(ignore: true)
  _$$ArtSuccessImplCopyWith<_$ArtSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ArtErrorImplCopyWith<$Res> {
  factory _$$ArtErrorImplCopyWith(
          _$ArtErrorImpl value, $Res Function(_$ArtErrorImpl) then) =
      __$$ArtErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ArtErrorImplCopyWithImpl<$Res>
    extends _$ArticleByIdStateCopyWithImpl<$Res, _$ArtErrorImpl>
    implements _$$ArtErrorImplCopyWith<$Res> {
  __$$ArtErrorImplCopyWithImpl(
      _$ArtErrorImpl _value, $Res Function(_$ArtErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ArtErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ArtErrorImpl implements ArtError {
  const _$ArtErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ArticleByIdState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtErrorImplCopyWith<_$ArtErrorImpl> get copyWith =>
      __$$ArtErrorImplCopyWithImpl<_$ArtErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ArticlesByIDResponseModel data) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ArticlesByIDResponseModel data)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ArticlesByIDResponseModel data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ArtLoading value) loading,
    required TResult Function(ArtSuccess value) success,
    required TResult Function(ArtError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ArtLoading value)? loading,
    TResult? Function(ArtSuccess value)? success,
    TResult? Function(ArtError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ArtLoading value)? loading,
    TResult Function(ArtSuccess value)? success,
    TResult Function(ArtError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ArtError implements ArticleByIdState {
  const factory ArtError({required final String message}) = _$ArtErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ArtErrorImplCopyWith<_$ArtErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
