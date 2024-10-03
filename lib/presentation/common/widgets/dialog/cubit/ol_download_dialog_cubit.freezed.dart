// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ol_download_dialog_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OlDownloadDialogState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() downloading,
    required TResult Function() downloadError,
    required TResult Function() permissionError,
    required TResult Function(String filePath) downloadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? downloading,
    TResult? Function()? downloadError,
    TResult? Function()? permissionError,
    TResult? Function(String filePath)? downloadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? downloading,
    TResult Function()? downloadError,
    TResult Function()? permissionError,
    TResult Function(String filePath)? downloadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Downloading value) downloading,
    required TResult Function(DownloadError value) downloadError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(DownloadSuccess value) downloadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Downloading value)? downloading,
    TResult? Function(DownloadError value)? downloadError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(DownloadSuccess value)? downloadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Downloading value)? downloading,
    TResult Function(DownloadError value)? downloadError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(DownloadSuccess value)? downloadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OlDownloadDialogStateCopyWith<$Res> {
  factory $OlDownloadDialogStateCopyWith(OlDownloadDialogState value,
          $Res Function(OlDownloadDialogState) then) =
      _$OlDownloadDialogStateCopyWithImpl<$Res, OlDownloadDialogState>;
}

/// @nodoc
class _$OlDownloadDialogStateCopyWithImpl<$Res,
        $Val extends OlDownloadDialogState>
    implements $OlDownloadDialogStateCopyWith<$Res> {
  _$OlDownloadDialogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OlDownloadDialogState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DownloadingImplCopyWith<$Res> {
  factory _$$DownloadingImplCopyWith(
          _$DownloadingImpl value, $Res Function(_$DownloadingImpl) then) =
      __$$DownloadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadingImplCopyWithImpl<$Res>
    extends _$OlDownloadDialogStateCopyWithImpl<$Res, _$DownloadingImpl>
    implements _$$DownloadingImplCopyWith<$Res> {
  __$$DownloadingImplCopyWithImpl(
      _$DownloadingImpl _value, $Res Function(_$DownloadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OlDownloadDialogState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DownloadingImpl with DiagnosticableTreeMixin implements Downloading {
  const _$DownloadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OlDownloadDialogState.downloading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'OlDownloadDialogState.downloading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownloadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() downloading,
    required TResult Function() downloadError,
    required TResult Function() permissionError,
    required TResult Function(String filePath) downloadSuccess,
  }) {
    return downloading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? downloading,
    TResult? Function()? downloadError,
    TResult? Function()? permissionError,
    TResult? Function(String filePath)? downloadSuccess,
  }) {
    return downloading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? downloading,
    TResult Function()? downloadError,
    TResult Function()? permissionError,
    TResult Function(String filePath)? downloadSuccess,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Downloading value) downloading,
    required TResult Function(DownloadError value) downloadError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(DownloadSuccess value) downloadSuccess,
  }) {
    return downloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Downloading value)? downloading,
    TResult? Function(DownloadError value)? downloadError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(DownloadSuccess value)? downloadSuccess,
  }) {
    return downloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Downloading value)? downloading,
    TResult Function(DownloadError value)? downloadError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(DownloadSuccess value)? downloadSuccess,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading(this);
    }
    return orElse();
  }
}

abstract class Downloading implements OlDownloadDialogState {
  const factory Downloading() = _$DownloadingImpl;
}

/// @nodoc
abstract class _$$DownloadErrorImplCopyWith<$Res> {
  factory _$$DownloadErrorImplCopyWith(
          _$DownloadErrorImpl value, $Res Function(_$DownloadErrorImpl) then) =
      __$$DownloadErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadErrorImplCopyWithImpl<$Res>
    extends _$OlDownloadDialogStateCopyWithImpl<$Res, _$DownloadErrorImpl>
    implements _$$DownloadErrorImplCopyWith<$Res> {
  __$$DownloadErrorImplCopyWithImpl(
      _$DownloadErrorImpl _value, $Res Function(_$DownloadErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of OlDownloadDialogState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DownloadErrorImpl
    with DiagnosticableTreeMixin
    implements DownloadError {
  const _$DownloadErrorImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OlDownloadDialogState.downloadError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'OlDownloadDialogState.downloadError'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownloadErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() downloading,
    required TResult Function() downloadError,
    required TResult Function() permissionError,
    required TResult Function(String filePath) downloadSuccess,
  }) {
    return downloadError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? downloading,
    TResult? Function()? downloadError,
    TResult? Function()? permissionError,
    TResult? Function(String filePath)? downloadSuccess,
  }) {
    return downloadError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? downloading,
    TResult Function()? downloadError,
    TResult Function()? permissionError,
    TResult Function(String filePath)? downloadSuccess,
    required TResult orElse(),
  }) {
    if (downloadError != null) {
      return downloadError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Downloading value) downloading,
    required TResult Function(DownloadError value) downloadError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(DownloadSuccess value) downloadSuccess,
  }) {
    return downloadError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Downloading value)? downloading,
    TResult? Function(DownloadError value)? downloadError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(DownloadSuccess value)? downloadSuccess,
  }) {
    return downloadError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Downloading value)? downloading,
    TResult Function(DownloadError value)? downloadError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(DownloadSuccess value)? downloadSuccess,
    required TResult orElse(),
  }) {
    if (downloadError != null) {
      return downloadError(this);
    }
    return orElse();
  }
}

abstract class DownloadError implements OlDownloadDialogState {
  const factory DownloadError() = _$DownloadErrorImpl;
}

/// @nodoc
abstract class _$$PermissionErrorImplCopyWith<$Res> {
  factory _$$PermissionErrorImplCopyWith(_$PermissionErrorImpl value,
          $Res Function(_$PermissionErrorImpl) then) =
      __$$PermissionErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PermissionErrorImplCopyWithImpl<$Res>
    extends _$OlDownloadDialogStateCopyWithImpl<$Res, _$PermissionErrorImpl>
    implements _$$PermissionErrorImplCopyWith<$Res> {
  __$$PermissionErrorImplCopyWithImpl(
      _$PermissionErrorImpl _value, $Res Function(_$PermissionErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of OlDownloadDialogState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PermissionErrorImpl
    with DiagnosticableTreeMixin
    implements PermissionError {
  const _$PermissionErrorImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OlDownloadDialogState.permissionError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'OlDownloadDialogState.permissionError'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PermissionErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() downloading,
    required TResult Function() downloadError,
    required TResult Function() permissionError,
    required TResult Function(String filePath) downloadSuccess,
  }) {
    return permissionError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? downloading,
    TResult? Function()? downloadError,
    TResult? Function()? permissionError,
    TResult? Function(String filePath)? downloadSuccess,
  }) {
    return permissionError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? downloading,
    TResult Function()? downloadError,
    TResult Function()? permissionError,
    TResult Function(String filePath)? downloadSuccess,
    required TResult orElse(),
  }) {
    if (permissionError != null) {
      return permissionError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Downloading value) downloading,
    required TResult Function(DownloadError value) downloadError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(DownloadSuccess value) downloadSuccess,
  }) {
    return permissionError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Downloading value)? downloading,
    TResult? Function(DownloadError value)? downloadError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(DownloadSuccess value)? downloadSuccess,
  }) {
    return permissionError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Downloading value)? downloading,
    TResult Function(DownloadError value)? downloadError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(DownloadSuccess value)? downloadSuccess,
    required TResult orElse(),
  }) {
    if (permissionError != null) {
      return permissionError(this);
    }
    return orElse();
  }
}

abstract class PermissionError implements OlDownloadDialogState {
  const factory PermissionError() = _$PermissionErrorImpl;
}

/// @nodoc
abstract class _$$DownloadSuccessImplCopyWith<$Res> {
  factory _$$DownloadSuccessImplCopyWith(_$DownloadSuccessImpl value,
          $Res Function(_$DownloadSuccessImpl) then) =
      __$$DownloadSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String filePath});
}

/// @nodoc
class __$$DownloadSuccessImplCopyWithImpl<$Res>
    extends _$OlDownloadDialogStateCopyWithImpl<$Res, _$DownloadSuccessImpl>
    implements _$$DownloadSuccessImplCopyWith<$Res> {
  __$$DownloadSuccessImplCopyWithImpl(
      _$DownloadSuccessImpl _value, $Res Function(_$DownloadSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of OlDownloadDialogState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
  }) {
    return _then(_$DownloadSuccessImpl(
      null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DownloadSuccessImpl
    with DiagnosticableTreeMixin
    implements DownloadSuccess {
  const _$DownloadSuccessImpl(this.filePath);

  @override
  final String filePath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OlDownloadDialogState.downloadSuccess(filePath: $filePath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'OlDownloadDialogState.downloadSuccess'))
      ..add(DiagnosticsProperty('filePath', filePath));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadSuccessImpl &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath);

  /// Create a copy of OlDownloadDialogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadSuccessImplCopyWith<_$DownloadSuccessImpl> get copyWith =>
      __$$DownloadSuccessImplCopyWithImpl<_$DownloadSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() downloading,
    required TResult Function() downloadError,
    required TResult Function() permissionError,
    required TResult Function(String filePath) downloadSuccess,
  }) {
    return downloadSuccess(filePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? downloading,
    TResult? Function()? downloadError,
    TResult? Function()? permissionError,
    TResult? Function(String filePath)? downloadSuccess,
  }) {
    return downloadSuccess?.call(filePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? downloading,
    TResult Function()? downloadError,
    TResult Function()? permissionError,
    TResult Function(String filePath)? downloadSuccess,
    required TResult orElse(),
  }) {
    if (downloadSuccess != null) {
      return downloadSuccess(filePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Downloading value) downloading,
    required TResult Function(DownloadError value) downloadError,
    required TResult Function(PermissionError value) permissionError,
    required TResult Function(DownloadSuccess value) downloadSuccess,
  }) {
    return downloadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Downloading value)? downloading,
    TResult? Function(DownloadError value)? downloadError,
    TResult? Function(PermissionError value)? permissionError,
    TResult? Function(DownloadSuccess value)? downloadSuccess,
  }) {
    return downloadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Downloading value)? downloading,
    TResult Function(DownloadError value)? downloadError,
    TResult Function(PermissionError value)? permissionError,
    TResult Function(DownloadSuccess value)? downloadSuccess,
    required TResult orElse(),
  }) {
    if (downloadSuccess != null) {
      return downloadSuccess(this);
    }
    return orElse();
  }
}

abstract class DownloadSuccess implements OlDownloadDialogState {
  const factory DownloadSuccess(final String filePath) = _$DownloadSuccessImpl;

  String get filePath;

  /// Create a copy of OlDownloadDialogState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DownloadSuccessImplCopyWith<_$DownloadSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
