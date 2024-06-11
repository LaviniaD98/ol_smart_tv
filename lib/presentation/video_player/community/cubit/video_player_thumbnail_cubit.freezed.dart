// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_player_thumbnail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoPlayerThumbnailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() tracking,
    required TResult Function() error,
    required TResult Function(SourceModel source, String thumbnail) done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? tracking,
    TResult? Function()? error,
    TResult? Function(SourceModel source, String thumbnail)? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? tracking,
    TResult Function()? error,
    TResult Function(SourceModel source, String thumbnail)? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Error value) error,
    required TResult Function(_Done value) done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Error value)? error,
    TResult? Function(_Done value)? done,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Error value)? error,
    TResult Function(_Done value)? done,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoPlayerThumbnailStateCopyWith<$Res> {
  factory $VideoPlayerThumbnailStateCopyWith(VideoPlayerThumbnailState value,
          $Res Function(VideoPlayerThumbnailState) then) =
      _$VideoPlayerThumbnailStateCopyWithImpl<$Res, VideoPlayerThumbnailState>;
}

/// @nodoc
class _$VideoPlayerThumbnailStateCopyWithImpl<$Res,
        $Val extends VideoPlayerThumbnailState>
    implements $VideoPlayerThumbnailStateCopyWith<$Res> {
  _$VideoPlayerThumbnailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$VideoPlayerThumbnailStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'VideoPlayerThumbnailState.loading()';
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
    required TResult Function() tracking,
    required TResult Function() error,
    required TResult Function(SourceModel source, String thumbnail) done,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? tracking,
    TResult? Function()? error,
    TResult? Function(SourceModel source, String thumbnail)? done,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? tracking,
    TResult Function()? error,
    TResult Function(SourceModel source, String thumbnail)? done,
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
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Error value) error,
    required TResult Function(_Done value) done,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Error value)? error,
    TResult? Function(_Done value)? done,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Error value)? error,
    TResult Function(_Done value)? done,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements VideoPlayerThumbnailState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$TrackingImplCopyWith<$Res> {
  factory _$$TrackingImplCopyWith(
          _$TrackingImpl value, $Res Function(_$TrackingImpl) then) =
      __$$TrackingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TrackingImplCopyWithImpl<$Res>
    extends _$VideoPlayerThumbnailStateCopyWithImpl<$Res, _$TrackingImpl>
    implements _$$TrackingImplCopyWith<$Res> {
  __$$TrackingImplCopyWithImpl(
      _$TrackingImpl _value, $Res Function(_$TrackingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TrackingImpl implements _Tracking {
  const _$TrackingImpl();

  @override
  String toString() {
    return 'VideoPlayerThumbnailState.tracking()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TrackingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() tracking,
    required TResult Function() error,
    required TResult Function(SourceModel source, String thumbnail) done,
  }) {
    return tracking();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? tracking,
    TResult? Function()? error,
    TResult? Function(SourceModel source, String thumbnail)? done,
  }) {
    return tracking?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? tracking,
    TResult Function()? error,
    TResult Function(SourceModel source, String thumbnail)? done,
    required TResult orElse(),
  }) {
    if (tracking != null) {
      return tracking();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Error value) error,
    required TResult Function(_Done value) done,
  }) {
    return tracking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Error value)? error,
    TResult? Function(_Done value)? done,
  }) {
    return tracking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Error value)? error,
    TResult Function(_Done value)? done,
    required TResult orElse(),
  }) {
    if (tracking != null) {
      return tracking(this);
    }
    return orElse();
  }
}

abstract class _Tracking implements VideoPlayerThumbnailState {
  const factory _Tracking() = _$TrackingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$VideoPlayerThumbnailStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'VideoPlayerThumbnailState.error()';
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
    required TResult Function() tracking,
    required TResult Function() error,
    required TResult Function(SourceModel source, String thumbnail) done,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? tracking,
    TResult? Function()? error,
    TResult? Function(SourceModel source, String thumbnail)? done,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? tracking,
    TResult Function()? error,
    TResult Function(SourceModel source, String thumbnail)? done,
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
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Error value) error,
    required TResult Function(_Done value) done,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Error value)? error,
    TResult? Function(_Done value)? done,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Error value)? error,
    TResult Function(_Done value)? done,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements VideoPlayerThumbnailState {
  const factory _Error() = _$ErrorImpl;
}

/// @nodoc
abstract class _$$DoneImplCopyWith<$Res> {
  factory _$$DoneImplCopyWith(
          _$DoneImpl value, $Res Function(_$DoneImpl) then) =
      __$$DoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SourceModel source, String thumbnail});
}

/// @nodoc
class __$$DoneImplCopyWithImpl<$Res>
    extends _$VideoPlayerThumbnailStateCopyWithImpl<$Res, _$DoneImpl>
    implements _$$DoneImplCopyWith<$Res> {
  __$$DoneImplCopyWithImpl(_$DoneImpl _value, $Res Function(_$DoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? thumbnail = null,
  }) {
    return _then(_$DoneImpl(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SourceModel,
      null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DoneImpl implements _Done {
  const _$DoneImpl(this.source, this.thumbnail);

  @override
  final SourceModel source;
  @override
  final String thumbnail;

  @override
  String toString() {
    return 'VideoPlayerThumbnailState.done(source: $source, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoneImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source, thumbnail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoneImplCopyWith<_$DoneImpl> get copyWith =>
      __$$DoneImplCopyWithImpl<_$DoneImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() tracking,
    required TResult Function() error,
    required TResult Function(SourceModel source, String thumbnail) done,
  }) {
    return done(source, thumbnail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? tracking,
    TResult? Function()? error,
    TResult? Function(SourceModel source, String thumbnail)? done,
  }) {
    return done?.call(source, thumbnail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? tracking,
    TResult Function()? error,
    TResult Function(SourceModel source, String thumbnail)? done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(source, thumbnail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Error value) error,
    required TResult Function(_Done value) done,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Error value)? error,
    TResult? Function(_Done value)? done,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Error value)? error,
    TResult Function(_Done value)? done,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class _Done implements VideoPlayerThumbnailState {
  const factory _Done(final SourceModel source, final String thumbnail) =
      _$DoneImpl;

  SourceModel get source;
  String get thumbnail;
  @JsonKey(ignore: true)
  _$$DoneImplCopyWith<_$DoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
