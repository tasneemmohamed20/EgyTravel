// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileloading,
    required TResult Function(GetProfileResponseModel getProfileResponseModel)
        profileSuccess,
    required TResult Function(ErrorHandler errorHandler) profileError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileloading,
    TResult? Function(GetProfileResponseModel getProfileResponseModel)?
        profileSuccess,
    TResult? Function(ErrorHandler errorHandler)? profileError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileloading,
    TResult Function(GetProfileResponseModel getProfileResponseModel)?
        profileSuccess,
    TResult Function(ErrorHandler errorHandler)? profileError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Profileloading value) profileloading,
    required TResult Function(ProfileSuccess value) profileSuccess,
    required TResult Function(ProfileError value) profileError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Profileloading value)? profileloading,
    TResult? Function(ProfileSuccess value)? profileSuccess,
    TResult? Function(ProfileError value)? profileError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Profileloading value)? profileloading,
    TResult Function(ProfileSuccess value)? profileSuccess,
    TResult Function(ProfileError value)? profileError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

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
    extends _$ProfileStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ProfileState.initial()';
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
    required TResult Function() profileloading,
    required TResult Function(GetProfileResponseModel getProfileResponseModel)
        profileSuccess,
    required TResult Function(ErrorHandler errorHandler) profileError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileloading,
    TResult? Function(GetProfileResponseModel getProfileResponseModel)?
        profileSuccess,
    TResult? Function(ErrorHandler errorHandler)? profileError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileloading,
    TResult Function(GetProfileResponseModel getProfileResponseModel)?
        profileSuccess,
    TResult Function(ErrorHandler errorHandler)? profileError,
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
    required TResult Function(Profileloading value) profileloading,
    required TResult Function(ProfileSuccess value) profileSuccess,
    required TResult Function(ProfileError value) profileError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Profileloading value)? profileloading,
    TResult? Function(ProfileSuccess value)? profileSuccess,
    TResult? Function(ProfileError value)? profileError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Profileloading value)? profileloading,
    TResult Function(ProfileSuccess value)? profileSuccess,
    TResult Function(ProfileError value)? profileError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProfileState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ProfileloadingImplCopyWith<$Res> {
  factory _$$ProfileloadingImplCopyWith(_$ProfileloadingImpl value,
          $Res Function(_$ProfileloadingImpl) then) =
      __$$ProfileloadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileloadingImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileloadingImpl>
    implements _$$ProfileloadingImplCopyWith<$Res> {
  __$$ProfileloadingImplCopyWithImpl(
      _$ProfileloadingImpl _value, $Res Function(_$ProfileloadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileloadingImpl implements Profileloading {
  const _$ProfileloadingImpl();

  @override
  String toString() {
    return 'ProfileState.profileloading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileloadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileloading,
    required TResult Function(GetProfileResponseModel getProfileResponseModel)
        profileSuccess,
    required TResult Function(ErrorHandler errorHandler) profileError,
  }) {
    return profileloading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileloading,
    TResult? Function(GetProfileResponseModel getProfileResponseModel)?
        profileSuccess,
    TResult? Function(ErrorHandler errorHandler)? profileError,
  }) {
    return profileloading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileloading,
    TResult Function(GetProfileResponseModel getProfileResponseModel)?
        profileSuccess,
    TResult Function(ErrorHandler errorHandler)? profileError,
    required TResult orElse(),
  }) {
    if (profileloading != null) {
      return profileloading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Profileloading value) profileloading,
    required TResult Function(ProfileSuccess value) profileSuccess,
    required TResult Function(ProfileError value) profileError,
  }) {
    return profileloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Profileloading value)? profileloading,
    TResult? Function(ProfileSuccess value)? profileSuccess,
    TResult? Function(ProfileError value)? profileError,
  }) {
    return profileloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Profileloading value)? profileloading,
    TResult Function(ProfileSuccess value)? profileSuccess,
    TResult Function(ProfileError value)? profileError,
    required TResult orElse(),
  }) {
    if (profileloading != null) {
      return profileloading(this);
    }
    return orElse();
  }
}

abstract class Profileloading implements ProfileState {
  const factory Profileloading() = _$ProfileloadingImpl;
}

/// @nodoc
abstract class _$$ProfileSuccessImplCopyWith<$Res> {
  factory _$$ProfileSuccessImplCopyWith(_$ProfileSuccessImpl value,
          $Res Function(_$ProfileSuccessImpl) then) =
      __$$ProfileSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetProfileResponseModel getProfileResponseModel});
}

/// @nodoc
class __$$ProfileSuccessImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileSuccessImpl>
    implements _$$ProfileSuccessImplCopyWith<$Res> {
  __$$ProfileSuccessImplCopyWithImpl(
      _$ProfileSuccessImpl _value, $Res Function(_$ProfileSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getProfileResponseModel = null,
  }) {
    return _then(_$ProfileSuccessImpl(
      null == getProfileResponseModel
          ? _value.getProfileResponseModel
          : getProfileResponseModel // ignore: cast_nullable_to_non_nullable
              as GetProfileResponseModel,
    ));
  }
}

/// @nodoc

class _$ProfileSuccessImpl implements ProfileSuccess {
  const _$ProfileSuccessImpl(this.getProfileResponseModel);

  @override
  final GetProfileResponseModel getProfileResponseModel;

  @override
  String toString() {
    return 'ProfileState.profileSuccess(getProfileResponseModel: $getProfileResponseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileSuccessImpl &&
            (identical(
                    other.getProfileResponseModel, getProfileResponseModel) ||
                other.getProfileResponseModel == getProfileResponseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getProfileResponseModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileSuccessImplCopyWith<_$ProfileSuccessImpl> get copyWith =>
      __$$ProfileSuccessImplCopyWithImpl<_$ProfileSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileloading,
    required TResult Function(GetProfileResponseModel getProfileResponseModel)
        profileSuccess,
    required TResult Function(ErrorHandler errorHandler) profileError,
  }) {
    return profileSuccess(getProfileResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileloading,
    TResult? Function(GetProfileResponseModel getProfileResponseModel)?
        profileSuccess,
    TResult? Function(ErrorHandler errorHandler)? profileError,
  }) {
    return profileSuccess?.call(getProfileResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileloading,
    TResult Function(GetProfileResponseModel getProfileResponseModel)?
        profileSuccess,
    TResult Function(ErrorHandler errorHandler)? profileError,
    required TResult orElse(),
  }) {
    if (profileSuccess != null) {
      return profileSuccess(getProfileResponseModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Profileloading value) profileloading,
    required TResult Function(ProfileSuccess value) profileSuccess,
    required TResult Function(ProfileError value) profileError,
  }) {
    return profileSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Profileloading value)? profileloading,
    TResult? Function(ProfileSuccess value)? profileSuccess,
    TResult? Function(ProfileError value)? profileError,
  }) {
    return profileSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Profileloading value)? profileloading,
    TResult Function(ProfileSuccess value)? profileSuccess,
    TResult Function(ProfileError value)? profileError,
    required TResult orElse(),
  }) {
    if (profileSuccess != null) {
      return profileSuccess(this);
    }
    return orElse();
  }
}

abstract class ProfileSuccess implements ProfileState {
  const factory ProfileSuccess(
          final GetProfileResponseModel getProfileResponseModel) =
      _$ProfileSuccessImpl;

  GetProfileResponseModel get getProfileResponseModel;
  @JsonKey(ignore: true)
  _$$ProfileSuccessImplCopyWith<_$ProfileSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileErrorImplCopyWith<$Res> {
  factory _$$ProfileErrorImplCopyWith(
          _$ProfileErrorImpl value, $Res Function(_$ProfileErrorImpl) then) =
      __$$ProfileErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorHandler errorHandler});
}

/// @nodoc
class __$$ProfileErrorImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileErrorImpl>
    implements _$$ProfileErrorImplCopyWith<$Res> {
  __$$ProfileErrorImplCopyWithImpl(
      _$ProfileErrorImpl _value, $Res Function(_$ProfileErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorHandler = null,
  }) {
    return _then(_$ProfileErrorImpl(
      null == errorHandler
          ? _value.errorHandler
          : errorHandler // ignore: cast_nullable_to_non_nullable
              as ErrorHandler,
    ));
  }
}

/// @nodoc

class _$ProfileErrorImpl implements ProfileError {
  const _$ProfileErrorImpl(this.errorHandler);

  @override
  final ErrorHandler errorHandler;

  @override
  String toString() {
    return 'ProfileState.profileError(errorHandler: $errorHandler)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileErrorImpl &&
            (identical(other.errorHandler, errorHandler) ||
                other.errorHandler == errorHandler));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorHandler);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileErrorImplCopyWith<_$ProfileErrorImpl> get copyWith =>
      __$$ProfileErrorImplCopyWithImpl<_$ProfileErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileloading,
    required TResult Function(GetProfileResponseModel getProfileResponseModel)
        profileSuccess,
    required TResult Function(ErrorHandler errorHandler) profileError,
  }) {
    return profileError(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileloading,
    TResult? Function(GetProfileResponseModel getProfileResponseModel)?
        profileSuccess,
    TResult? Function(ErrorHandler errorHandler)? profileError,
  }) {
    return profileError?.call(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileloading,
    TResult Function(GetProfileResponseModel getProfileResponseModel)?
        profileSuccess,
    TResult Function(ErrorHandler errorHandler)? profileError,
    required TResult orElse(),
  }) {
    if (profileError != null) {
      return profileError(errorHandler);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Profileloading value) profileloading,
    required TResult Function(ProfileSuccess value) profileSuccess,
    required TResult Function(ProfileError value) profileError,
  }) {
    return profileError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Profileloading value)? profileloading,
    TResult? Function(ProfileSuccess value)? profileSuccess,
    TResult? Function(ProfileError value)? profileError,
  }) {
    return profileError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Profileloading value)? profileloading,
    TResult Function(ProfileSuccess value)? profileSuccess,
    TResult Function(ProfileError value)? profileError,
    required TResult orElse(),
  }) {
    if (profileError != null) {
      return profileError(this);
    }
    return orElse();
  }
}

abstract class ProfileError implements ProfileState {
  const factory ProfileError(final ErrorHandler errorHandler) =
      _$ProfileErrorImpl;

  ErrorHandler get errorHandler;
  @JsonKey(ignore: true)
  _$$ProfileErrorImplCopyWith<_$ProfileErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
