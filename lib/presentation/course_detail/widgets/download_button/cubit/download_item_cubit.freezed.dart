// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_item_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DownloadItemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)
        inprogress,
    required TResult Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)
        finished,
    required TResult Function() loading,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? empty,
    TResult? Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)?
        inprogress,
    TResult? Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)?
        finished,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)?
        inprogress,
    TResult Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)?
        finished,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Empty value) empty,
    required TResult Function(Inprogress value) inprogress,
    required TResult Function(Finished value) finished,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Empty value)? empty,
    TResult? Function(Inprogress value)? inprogress,
    TResult? Function(Finished value)? finished,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Empty value)? empty,
    TResult Function(Inprogress value)? inprogress,
    TResult Function(Finished value)? finished,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadItemStateCopyWith<$Res> {
  factory $DownloadItemStateCopyWith(
          DownloadItemState value, $Res Function(DownloadItemState) then) =
      _$DownloadItemStateCopyWithImpl<$Res, DownloadItemState>;
}

/// @nodoc
class _$DownloadItemStateCopyWithImpl<$Res, $Val extends DownloadItemState>
    implements $DownloadItemStateCopyWith<$Res> {
  _$DownloadItemStateCopyWithImpl(this._value, this._then);

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
    extends _$DownloadItemStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadItemState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'DownloadItemState.initial'));
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
    required TResult Function() empty,
    required TResult Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)
        inprogress,
    required TResult Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)
        finished,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? empty,
    TResult? Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)?
        inprogress,
    TResult? Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)?
        finished,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)?
        inprogress,
    TResult Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)?
        finished,
    TResult Function()? loading,
    TResult Function()? error,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Empty value) empty,
    required TResult Function(Inprogress value) inprogress,
    required TResult Function(Finished value) finished,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Empty value)? empty,
    TResult? Function(Inprogress value)? inprogress,
    TResult? Function(Finished value)? finished,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Empty value)? empty,
    TResult Function(Inprogress value)? inprogress,
    TResult Function(Finished value)? finished,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements DownloadItemState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<$Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl value, $Res Function(_$EmptyImpl) then) =
      __$$EmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<$Res>
    extends _$DownloadItemStateCopyWithImpl<$Res, _$EmptyImpl>
    implements _$$EmptyImplCopyWith<$Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl _value, $Res Function(_$EmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyImpl with DiagnosticableTreeMixin implements Empty {
  const _$EmptyImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadItemState.empty()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'DownloadItemState.empty'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)
        inprogress,
    required TResult Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)
        finished,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? empty,
    TResult? Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)?
        inprogress,
    TResult? Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)?
        finished,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)?
        inprogress,
    TResult Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)?
        finished,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Empty value) empty,
    required TResult Function(Inprogress value) inprogress,
    required TResult Function(Finished value) finished,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Empty value)? empty,
    TResult? Function(Inprogress value)? inprogress,
    TResult? Function(Finished value)? finished,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Empty value)? empty,
    TResult Function(Inprogress value)? inprogress,
    TResult Function(Finished value)? finished,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty implements DownloadItemState {
  const factory Empty() = _$EmptyImpl;
}

/// @nodoc
abstract class _$$InprogressImplCopyWith<$Res> {
  factory _$$InprogressImplCopyWith(
          _$InprogressImpl value, $Res Function(_$InprogressImpl) then) =
      __$$InprogressImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double progress,
      String? taskId,
      DownloadTaskStatus downloadTaskStatus,
      DownloadedItem? downloadedItem});
}

/// @nodoc
class __$$InprogressImplCopyWithImpl<$Res>
    extends _$DownloadItemStateCopyWithImpl<$Res, _$InprogressImpl>
    implements _$$InprogressImplCopyWith<$Res> {
  __$$InprogressImplCopyWithImpl(
      _$InprogressImpl _value, $Res Function(_$InprogressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? taskId = freezed,
    Object? downloadTaskStatus = null,
    Object? downloadedItem = freezed,
  }) {
    return _then(_$InprogressImpl(
      null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      null == downloadTaskStatus
          ? _value.downloadTaskStatus
          : downloadTaskStatus // ignore: cast_nullable_to_non_nullable
              as DownloadTaskStatus,
      freezed == downloadedItem
          ? _value.downloadedItem
          : downloadedItem // ignore: cast_nullable_to_non_nullable
              as DownloadedItem?,
    ));
  }
}

/// @nodoc

class _$InprogressImpl with DiagnosticableTreeMixin implements Inprogress {
  const _$InprogressImpl(
      this.progress, this.taskId, this.downloadTaskStatus, this.downloadedItem);

  @override
  final double progress;
  @override
  final String? taskId;
  @override
  final DownloadTaskStatus downloadTaskStatus;
  @override
  final DownloadedItem? downloadedItem;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadItemState.inprogress(progress: $progress, taskId: $taskId, downloadTaskStatus: $downloadTaskStatus, downloadedItem: $downloadedItem)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DownloadItemState.inprogress'))
      ..add(DiagnosticsProperty('progress', progress))
      ..add(DiagnosticsProperty('taskId', taskId))
      ..add(DiagnosticsProperty('downloadTaskStatus', downloadTaskStatus))
      ..add(DiagnosticsProperty('downloadedItem', downloadedItem));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InprogressImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.downloadTaskStatus, downloadTaskStatus) ||
                other.downloadTaskStatus == downloadTaskStatus) &&
            (identical(other.downloadedItem, downloadedItem) ||
                other.downloadedItem == downloadedItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, progress, taskId, downloadTaskStatus, downloadedItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InprogressImplCopyWith<_$InprogressImpl> get copyWith =>
      __$$InprogressImplCopyWithImpl<_$InprogressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)
        inprogress,
    required TResult Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)
        finished,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return inprogress(progress, taskId, downloadTaskStatus, downloadedItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? empty,
    TResult? Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)?
        inprogress,
    TResult? Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)?
        finished,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return inprogress?.call(
        progress, taskId, downloadTaskStatus, downloadedItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)?
        inprogress,
    TResult Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)?
        finished,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (inprogress != null) {
      return inprogress(progress, taskId, downloadTaskStatus, downloadedItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Empty value) empty,
    required TResult Function(Inprogress value) inprogress,
    required TResult Function(Finished value) finished,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return inprogress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Empty value)? empty,
    TResult? Function(Inprogress value)? inprogress,
    TResult? Function(Finished value)? finished,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return inprogress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Empty value)? empty,
    TResult Function(Inprogress value)? inprogress,
    TResult Function(Finished value)? finished,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (inprogress != null) {
      return inprogress(this);
    }
    return orElse();
  }
}

abstract class Inprogress implements DownloadItemState {
  const factory Inprogress(
      final double progress,
      final String? taskId,
      final DownloadTaskStatus downloadTaskStatus,
      final DownloadedItem? downloadedItem) = _$InprogressImpl;

  double get progress;
  String? get taskId;
  DownloadTaskStatus get downloadTaskStatus;
  DownloadedItem? get downloadedItem;
  @JsonKey(ignore: true)
  _$$InprogressImplCopyWith<_$InprogressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FinishedImplCopyWith<$Res> {
  factory _$$FinishedImplCopyWith(
          _$FinishedImpl value, $Res Function(_$FinishedImpl) then) =
      __$$FinishedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? taskId,
      DownloadedItem? downloadedItem,
      DownloadTaskStatus downloadTaskStatus});
}

/// @nodoc
class __$$FinishedImplCopyWithImpl<$Res>
    extends _$DownloadItemStateCopyWithImpl<$Res, _$FinishedImpl>
    implements _$$FinishedImplCopyWith<$Res> {
  __$$FinishedImplCopyWithImpl(
      _$FinishedImpl _value, $Res Function(_$FinishedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = freezed,
    Object? downloadedItem = freezed,
    Object? downloadTaskStatus = null,
  }) {
    return _then(_$FinishedImpl(
      freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == downloadedItem
          ? _value.downloadedItem
          : downloadedItem // ignore: cast_nullable_to_non_nullable
              as DownloadedItem?,
      null == downloadTaskStatus
          ? _value.downloadTaskStatus
          : downloadTaskStatus // ignore: cast_nullable_to_non_nullable
              as DownloadTaskStatus,
    ));
  }
}

/// @nodoc

class _$FinishedImpl with DiagnosticableTreeMixin implements Finished {
  const _$FinishedImpl(
      this.taskId, this.downloadedItem, this.downloadTaskStatus);

  @override
  final String? taskId;
  @override
  final DownloadedItem? downloadedItem;
  @override
  final DownloadTaskStatus downloadTaskStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadItemState.finished(taskId: $taskId, downloadedItem: $downloadedItem, downloadTaskStatus: $downloadTaskStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DownloadItemState.finished'))
      ..add(DiagnosticsProperty('taskId', taskId))
      ..add(DiagnosticsProperty('downloadedItem', downloadedItem))
      ..add(DiagnosticsProperty('downloadTaskStatus', downloadTaskStatus));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinishedImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.downloadedItem, downloadedItem) ||
                other.downloadedItem == downloadedItem) &&
            (identical(other.downloadTaskStatus, downloadTaskStatus) ||
                other.downloadTaskStatus == downloadTaskStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, taskId, downloadedItem, downloadTaskStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FinishedImplCopyWith<_$FinishedImpl> get copyWith =>
      __$$FinishedImplCopyWithImpl<_$FinishedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)
        inprogress,
    required TResult Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)
        finished,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return finished(taskId, downloadedItem, downloadTaskStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? empty,
    TResult? Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)?
        inprogress,
    TResult? Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)?
        finished,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return finished?.call(taskId, downloadedItem, downloadTaskStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)?
        inprogress,
    TResult Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)?
        finished,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(taskId, downloadedItem, downloadTaskStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Empty value) empty,
    required TResult Function(Inprogress value) inprogress,
    required TResult Function(Finished value) finished,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Empty value)? empty,
    TResult? Function(Inprogress value)? inprogress,
    TResult? Function(Finished value)? finished,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Empty value)? empty,
    TResult Function(Inprogress value)? inprogress,
    TResult Function(Finished value)? finished,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class Finished implements DownloadItemState {
  const factory Finished(
      final String? taskId,
      final DownloadedItem? downloadedItem,
      final DownloadTaskStatus downloadTaskStatus) = _$FinishedImpl;

  String? get taskId;
  DownloadedItem? get downloadedItem;
  DownloadTaskStatus get downloadTaskStatus;
  @JsonKey(ignore: true)
  _$$FinishedImplCopyWith<_$FinishedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$DownloadItemStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadItemState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'DownloadItemState.loading'));
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
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)
        inprogress,
    required TResult Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)
        finished,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? empty,
    TResult? Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)?
        inprogress,
    TResult? Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)?
        finished,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)?
        inprogress,
    TResult Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)?
        finished,
    TResult Function()? loading,
    TResult Function()? error,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Empty value) empty,
    required TResult Function(Inprogress value) inprogress,
    required TResult Function(Finished value) finished,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Empty value)? empty,
    TResult? Function(Inprogress value)? inprogress,
    TResult? Function(Finished value)? finished,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Empty value)? empty,
    TResult Function(Inprogress value)? inprogress,
    TResult Function(Finished value)? finished,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements DownloadItemState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$DownloadItemStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements Error {
  const _$ErrorImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadItemState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'DownloadItemState.error'));
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
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)
        inprogress,
    required TResult Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)
        finished,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? empty,
    TResult? Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)?
        inprogress,
    TResult? Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)?
        finished,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function(
            double progress,
            String? taskId,
            DownloadTaskStatus downloadTaskStatus,
            DownloadedItem? downloadedItem)?
        inprogress,
    TResult Function(String? taskId, DownloadedItem? downloadedItem,
            DownloadTaskStatus downloadTaskStatus)?
        finished,
    TResult Function()? loading,
    TResult Function()? error,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Empty value) empty,
    required TResult Function(Inprogress value) inprogress,
    required TResult Function(Finished value) finished,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Empty value)? empty,
    TResult? Function(Inprogress value)? inprogress,
    TResult? Function(Finished value)? finished,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Empty value)? empty,
    TResult Function(Inprogress value)? inprogress,
    TResult Function(Finished value)? finished,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements DownloadItemState {
  const factory Error() = _$ErrorImpl;
}
