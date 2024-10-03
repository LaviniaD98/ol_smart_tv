// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfilePageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            UserInfoModel? userInfoModel,
            String? imageUrl,
            ProgressGoalsConfigModel? progressGoalsConfig,
            LearnerGoalsModel? goals,
            LearnerProgressModel? progress)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            UserInfoModel? userInfoModel,
            String? imageUrl,
            ProgressGoalsConfigModel? progressGoalsConfig,
            LearnerGoalsModel? goals,
            LearnerProgressModel? progress)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            UserInfoModel? userInfoModel,
            String? imageUrl,
            ProgressGoalsConfigModel? progressGoalsConfig,
            LearnerGoalsModel? goals,
            LearnerProgressModel? progress)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilePageStateCopyWith<$Res> {
  factory $ProfilePageStateCopyWith(
          ProfilePageState value, $Res Function(ProfilePageState) then) =
      _$ProfilePageStateCopyWithImpl<$Res, ProfilePageState>;
}

/// @nodoc
class _$ProfilePageStateCopyWithImpl<$Res, $Val extends ProfilePageState>
    implements $ProfilePageStateCopyWith<$Res> {
  _$ProfilePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfilePageState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ProfilePageStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfilePageState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProfilePageState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            UserInfoModel? userInfoModel,
            String? imageUrl,
            ProgressGoalsConfigModel? progressGoalsConfig,
            LearnerGoalsModel? goals,
            LearnerProgressModel? progress)
        success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            UserInfoModel? userInfoModel,
            String? imageUrl,
            ProgressGoalsConfigModel? progressGoalsConfig,
            LearnerGoalsModel? goals,
            LearnerProgressModel? progress)?
        success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            UserInfoModel? userInfoModel,
            String? imageUrl,
            ProgressGoalsConfigModel? progressGoalsConfig,
            LearnerGoalsModel? goals,
            LearnerProgressModel? progress)?
        success,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ProfilePageState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ProfilePageStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfilePageState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'ProfilePageState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            UserInfoModel? userInfoModel,
            String? imageUrl,
            ProgressGoalsConfigModel? progressGoalsConfig,
            LearnerGoalsModel? goals,
            LearnerProgressModel? progress)
        success,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            UserInfoModel? userInfoModel,
            String? imageUrl,
            ProgressGoalsConfigModel? progressGoalsConfig,
            LearnerGoalsModel? goals,
            LearnerProgressModel? progress)?
        success,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            UserInfoModel? userInfoModel,
            String? imageUrl,
            ProgressGoalsConfigModel? progressGoalsConfig,
            LearnerGoalsModel? goals,
            LearnerProgressModel? progress)?
        success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ProfilePageState {
  const factory _Error() = _$ErrorImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {UserInfoModel? userInfoModel,
      String? imageUrl,
      ProgressGoalsConfigModel? progressGoalsConfig,
      LearnerGoalsModel? goals,
      LearnerProgressModel? progress});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ProfilePageStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfilePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfoModel = freezed,
    Object? imageUrl = freezed,
    Object? progressGoalsConfig = freezed,
    Object? goals = freezed,
    Object? progress = freezed,
  }) {
    return _then(_$SuccessImpl(
      userInfoModel: freezed == userInfoModel
          ? _value.userInfoModel
          : userInfoModel // ignore: cast_nullable_to_non_nullable
              as UserInfoModel?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      progressGoalsConfig: freezed == progressGoalsConfig
          ? _value.progressGoalsConfig
          : progressGoalsConfig // ignore: cast_nullable_to_non_nullable
              as ProgressGoalsConfigModel?,
      goals: freezed == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as LearnerGoalsModel?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as LearnerProgressModel?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(
      {this.userInfoModel,
      this.imageUrl,
      this.progressGoalsConfig,
      this.goals,
      this.progress});

  @override
  final UserInfoModel? userInfoModel;
  @override
  final String? imageUrl;
  @override
  final ProgressGoalsConfigModel? progressGoalsConfig;
  @override
  final LearnerGoalsModel? goals;
  @override
  final LearnerProgressModel? progress;

  @override
  String toString() {
    return 'ProfilePageState.success(userInfoModel: $userInfoModel, imageUrl: $imageUrl, progressGoalsConfig: $progressGoalsConfig, goals: $goals, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.userInfoModel, userInfoModel) ||
                other.userInfoModel == userInfoModel) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.progressGoalsConfig, progressGoalsConfig) ||
                other.progressGoalsConfig == progressGoalsConfig) &&
            (identical(other.goals, goals) || other.goals == goals) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userInfoModel, imageUrl,
      progressGoalsConfig, goals, progress);

  /// Create a copy of ProfilePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            UserInfoModel? userInfoModel,
            String? imageUrl,
            ProgressGoalsConfigModel? progressGoalsConfig,
            LearnerGoalsModel? goals,
            LearnerProgressModel? progress)
        success,
  }) {
    return success(
        userInfoModel, imageUrl, progressGoalsConfig, goals, progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            UserInfoModel? userInfoModel,
            String? imageUrl,
            ProgressGoalsConfigModel? progressGoalsConfig,
            LearnerGoalsModel? goals,
            LearnerProgressModel? progress)?
        success,
  }) {
    return success?.call(
        userInfoModel, imageUrl, progressGoalsConfig, goals, progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            UserInfoModel? userInfoModel,
            String? imageUrl,
            ProgressGoalsConfigModel? progressGoalsConfig,
            LearnerGoalsModel? goals,
            LearnerProgressModel? progress)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(
          userInfoModel, imageUrl, progressGoalsConfig, goals, progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ProfilePageState {
  const factory _Success(
      {final UserInfoModel? userInfoModel,
      final String? imageUrl,
      final ProgressGoalsConfigModel? progressGoalsConfig,
      final LearnerGoalsModel? goals,
      final LearnerProgressModel? progress}) = _$SuccessImpl;

  UserInfoModel? get userInfoModel;
  String? get imageUrl;
  ProgressGoalsConfigModel? get progressGoalsConfig;
  LearnerGoalsModel? get goals;
  LearnerProgressModel? get progress;

  /// Create a copy of ProfilePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
