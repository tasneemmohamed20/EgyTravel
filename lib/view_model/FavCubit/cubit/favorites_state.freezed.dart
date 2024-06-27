// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() favloading,
    required TResult Function(FavResponseModel favResponseModel) favSuccess,
    required TResult Function(ErrorHandler errorHandler) favError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? favloading,
    TResult? Function(FavResponseModel favResponseModel)? favSuccess,
    TResult? Function(ErrorHandler errorHandler)? favError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? favloading,
    TResult Function(FavResponseModel favResponseModel)? favSuccess,
    TResult Function(ErrorHandler errorHandler)? favError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Favloading value) favloading,
    required TResult Function(FavSuccess value) favSuccess,
    required TResult Function(FavError value) favError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Favloading value)? favloading,
    TResult? Function(FavSuccess value)? favSuccess,
    TResult? Function(FavError value)? favError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Favloading value)? favloading,
    TResult Function(FavSuccess value)? favSuccess,
    TResult Function(FavError value)? favError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavStateCopyWith<$Res> {
  factory $FavStateCopyWith(FavState value, $Res Function(FavState) then) =
      _$FavStateCopyWithImpl<$Res, FavState>;
}

/// @nodoc
class _$FavStateCopyWithImpl<$Res, $Val extends FavState>
    implements $FavStateCopyWith<$Res> {
  _$FavStateCopyWithImpl(this._value, this._then);

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
    extends _$FavStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'FavState.initial()';
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
    required TResult Function() favloading,
    required TResult Function(FavResponseModel favResponseModel) favSuccess,
    required TResult Function(ErrorHandler errorHandler) favError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? favloading,
    TResult? Function(FavResponseModel favResponseModel)? favSuccess,
    TResult? Function(ErrorHandler errorHandler)? favError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? favloading,
    TResult Function(FavResponseModel favResponseModel)? favSuccess,
    TResult Function(ErrorHandler errorHandler)? favError,
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
    required TResult Function(Favloading value) favloading,
    required TResult Function(FavSuccess value) favSuccess,
    required TResult Function(FavError value) favError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Favloading value)? favloading,
    TResult? Function(FavSuccess value)? favSuccess,
    TResult? Function(FavError value)? favError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Favloading value)? favloading,
    TResult Function(FavSuccess value)? favSuccess,
    TResult Function(FavError value)? favError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FavState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$FavloadingImplCopyWith<$Res> {
  factory _$$FavloadingImplCopyWith(
          _$FavloadingImpl value, $Res Function(_$FavloadingImpl) then) =
      __$$FavloadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavloadingImplCopyWithImpl<$Res>
    extends _$FavStateCopyWithImpl<$Res, _$FavloadingImpl>
    implements _$$FavloadingImplCopyWith<$Res> {
  __$$FavloadingImplCopyWithImpl(
      _$FavloadingImpl _value, $Res Function(_$FavloadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavloadingImpl implements Favloading {
  const _$FavloadingImpl();

  @override
  String toString() {
    return 'FavState.favloading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FavloadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() favloading,
    required TResult Function(FavResponseModel favResponseModel) favSuccess,
    required TResult Function(ErrorHandler errorHandler) favError,
  }) {
    return favloading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? favloading,
    TResult? Function(FavResponseModel favResponseModel)? favSuccess,
    TResult? Function(ErrorHandler errorHandler)? favError,
  }) {
    return favloading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? favloading,
    TResult Function(FavResponseModel favResponseModel)? favSuccess,
    TResult Function(ErrorHandler errorHandler)? favError,
    required TResult orElse(),
  }) {
    if (favloading != null) {
      return favloading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Favloading value) favloading,
    required TResult Function(FavSuccess value) favSuccess,
    required TResult Function(FavError value) favError,
  }) {
    return favloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Favloading value)? favloading,
    TResult? Function(FavSuccess value)? favSuccess,
    TResult? Function(FavError value)? favError,
  }) {
    return favloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Favloading value)? favloading,
    TResult Function(FavSuccess value)? favSuccess,
    TResult Function(FavError value)? favError,
    required TResult orElse(),
  }) {
    if (favloading != null) {
      return favloading(this);
    }
    return orElse();
  }
}

abstract class Favloading implements FavState {
  const factory Favloading() = _$FavloadingImpl;
}

/// @nodoc
abstract class _$$FavSuccessImplCopyWith<$Res> {
  factory _$$FavSuccessImplCopyWith(
          _$FavSuccessImpl value, $Res Function(_$FavSuccessImpl) then) =
      __$$FavSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FavResponseModel favResponseModel});
}

/// @nodoc
class __$$FavSuccessImplCopyWithImpl<$Res>
    extends _$FavStateCopyWithImpl<$Res, _$FavSuccessImpl>
    implements _$$FavSuccessImplCopyWith<$Res> {
  __$$FavSuccessImplCopyWithImpl(
      _$FavSuccessImpl _value, $Res Function(_$FavSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favResponseModel = null,
  }) {
    return _then(_$FavSuccessImpl(
      null == favResponseModel
          ? _value.favResponseModel
          : favResponseModel // ignore: cast_nullable_to_non_nullable
              as FavResponseModel,
    ));
  }
}

/// @nodoc

class _$FavSuccessImpl implements FavSuccess {
  const _$FavSuccessImpl(this.favResponseModel);

  @override
  final FavResponseModel favResponseModel;

  @override
  String toString() {
    return 'FavState.favSuccess(favResponseModel: $favResponseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavSuccessImpl &&
            (identical(other.favResponseModel, favResponseModel) ||
                other.favResponseModel == favResponseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, favResponseModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavSuccessImplCopyWith<_$FavSuccessImpl> get copyWith =>
      __$$FavSuccessImplCopyWithImpl<_$FavSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() favloading,
    required TResult Function(FavResponseModel favResponseModel) favSuccess,
    required TResult Function(ErrorHandler errorHandler) favError,
  }) {
    return favSuccess(favResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? favloading,
    TResult? Function(FavResponseModel favResponseModel)? favSuccess,
    TResult? Function(ErrorHandler errorHandler)? favError,
  }) {
    return favSuccess?.call(favResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? favloading,
    TResult Function(FavResponseModel favResponseModel)? favSuccess,
    TResult Function(ErrorHandler errorHandler)? favError,
    required TResult orElse(),
  }) {
    if (favSuccess != null) {
      return favSuccess(favResponseModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Favloading value) favloading,
    required TResult Function(FavSuccess value) favSuccess,
    required TResult Function(FavError value) favError,
  }) {
    return favSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Favloading value)? favloading,
    TResult? Function(FavSuccess value)? favSuccess,
    TResult? Function(FavError value)? favError,
  }) {
    return favSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Favloading value)? favloading,
    TResult Function(FavSuccess value)? favSuccess,
    TResult Function(FavError value)? favError,
    required TResult orElse(),
  }) {
    if (favSuccess != null) {
      return favSuccess(this);
    }
    return orElse();
  }
}

abstract class FavSuccess implements FavState {
  const factory FavSuccess(final FavResponseModel favResponseModel) =
      _$FavSuccessImpl;

  FavResponseModel get favResponseModel;
  @JsonKey(ignore: true)
  _$$FavSuccessImplCopyWith<_$FavSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavErrorImplCopyWith<$Res> {
  factory _$$FavErrorImplCopyWith(
          _$FavErrorImpl value, $Res Function(_$FavErrorImpl) then) =
      __$$FavErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorHandler errorHandler});
}

/// @nodoc
class __$$FavErrorImplCopyWithImpl<$Res>
    extends _$FavStateCopyWithImpl<$Res, _$FavErrorImpl>
    implements _$$FavErrorImplCopyWith<$Res> {
  __$$FavErrorImplCopyWithImpl(
      _$FavErrorImpl _value, $Res Function(_$FavErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorHandler = null,
  }) {
    return _then(_$FavErrorImpl(
      null == errorHandler
          ? _value.errorHandler
          : errorHandler // ignore: cast_nullable_to_non_nullable
              as ErrorHandler,
    ));
  }
}

/// @nodoc

class _$FavErrorImpl implements FavError {
  const _$FavErrorImpl(this.errorHandler);

  @override
  final ErrorHandler errorHandler;

  @override
  String toString() {
    return 'FavState.favError(errorHandler: $errorHandler)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavErrorImpl &&
            (identical(other.errorHandler, errorHandler) ||
                other.errorHandler == errorHandler));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorHandler);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavErrorImplCopyWith<_$FavErrorImpl> get copyWith =>
      __$$FavErrorImplCopyWithImpl<_$FavErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() favloading,
    required TResult Function(FavResponseModel favResponseModel) favSuccess,
    required TResult Function(ErrorHandler errorHandler) favError,
  }) {
    return favError(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? favloading,
    TResult? Function(FavResponseModel favResponseModel)? favSuccess,
    TResult? Function(ErrorHandler errorHandler)? favError,
  }) {
    return favError?.call(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? favloading,
    TResult Function(FavResponseModel favResponseModel)? favSuccess,
    TResult Function(ErrorHandler errorHandler)? favError,
    required TResult orElse(),
  }) {
    if (favError != null) {
      return favError(errorHandler);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Favloading value) favloading,
    required TResult Function(FavSuccess value) favSuccess,
    required TResult Function(FavError value) favError,
  }) {
    return favError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Favloading value)? favloading,
    TResult? Function(FavSuccess value)? favSuccess,
    TResult? Function(FavError value)? favError,
  }) {
    return favError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Favloading value)? favloading,
    TResult Function(FavSuccess value)? favSuccess,
    TResult Function(FavError value)? favError,
    required TResult orElse(),
  }) {
    if (favError != null) {
      return favError(this);
    }
    return orElse();
  }
}

abstract class FavError implements FavState {
  const factory FavError(final ErrorHandler errorHandler) = _$FavErrorImpl;

  ErrorHandler get errorHandler;
  @JsonKey(ignore: true)
  _$$FavErrorImplCopyWith<_$FavErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
