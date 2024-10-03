// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO)
        initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(CognitoUserSession? session, SelfModel? selfModel,
            String? sessionId)
        goToInitiatives,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(CognitoUserSession? session, SelfModel? selfModel,
            String? sessionId)?
        goToInitiatives,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO)?
        initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(CognitoUserSession? session, SelfModel? selfModel,
            String? sessionId)?
        goToInitiatives,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_GoToInitiatives value) goToInitiatives,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_GoToInitiatives value)? goToInitiatives,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_GoToInitiatives value)? goToInitiatives,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smartConfig = freezed,
    Object? loggedInViaSSO = freezed,
  }) {
    return _then(_$InitialImpl(
      smartConfig: freezed == smartConfig
          ? _value.smartConfig
          : smartConfig // ignore: cast_nullable_to_non_nullable
              as SmartConfiguratorModel?,
      loggedInViaSSO: freezed == loggedInViaSSO
          ? _value.loggedInViaSSO
          : loggedInViaSSO // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements Initial {
  const _$InitialImpl({this.smartConfig, this.loggedInViaSSO});

  @override
  final SmartConfiguratorModel? smartConfig;
  @override
  final bool? loggedInViaSSO;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsState.initial(smartConfig: $smartConfig, loggedInViaSSO: $loggedInViaSSO)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingsState.initial'))
      ..add(DiagnosticsProperty('smartConfig', smartConfig))
      ..add(DiagnosticsProperty('loggedInViaSSO', loggedInViaSSO));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.smartConfig, smartConfig) ||
                other.smartConfig == smartConfig) &&
            (identical(other.loggedInViaSSO, loggedInViaSSO) ||
                other.loggedInViaSSO == loggedInViaSSO));
  }

  @override
  int get hashCode => Object.hash(runtimeType, smartConfig, loggedInViaSSO);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO)
        initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(CognitoUserSession? session, SelfModel? selfModel,
            String? sessionId)
        goToInitiatives,
  }) {
    return initial(smartConfig, loggedInViaSSO);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(CognitoUserSession? session, SelfModel? selfModel,
            String? sessionId)?
        goToInitiatives,
  }) {
    return initial?.call(smartConfig, loggedInViaSSO);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO)?
        initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(CognitoUserSession? session, SelfModel? selfModel,
            String? sessionId)?
        goToInitiatives,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(smartConfig, loggedInViaSSO);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_GoToInitiatives value) goToInitiatives,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_GoToInitiatives value)? goToInitiatives,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_GoToInitiatives value)? goToInitiatives,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements SettingsState {
  const factory Initial(
      {final SmartConfiguratorModel? smartConfig,
      final bool? loggedInViaSSO}) = _$InitialImpl;

  SmartConfiguratorModel? get smartConfig;
  bool? get loggedInViaSSO;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
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
    extends _$SettingsStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SettingsState.loading'));
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
    required TResult Function(
            SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO)
        initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(CognitoUserSession? session, SelfModel? selfModel,
            String? sessionId)
        goToInitiatives,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(CognitoUserSession? session, SelfModel? selfModel,
            String? sessionId)?
        goToInitiatives,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO)?
        initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(CognitoUserSession? session, SelfModel? selfModel,
            String? sessionId)?
        goToInitiatives,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_GoToInitiatives value) goToInitiatives,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_GoToInitiatives value)? goToInitiatives,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_GoToInitiatives value)? goToInitiatives,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SettingsState {
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
    extends _$SettingsStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SettingsState.error'));
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
    required TResult Function(
            SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO)
        initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(CognitoUserSession? session, SelfModel? selfModel,
            String? sessionId)
        goToInitiatives,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(CognitoUserSession? session, SelfModel? selfModel,
            String? sessionId)?
        goToInitiatives,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO)?
        initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(CognitoUserSession? session, SelfModel? selfModel,
            String? sessionId)?
        goToInitiatives,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_GoToInitiatives value) goToInitiatives,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_GoToInitiatives value)? goToInitiatives,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_GoToInitiatives value)? goToInitiatives,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SettingsState {
  const factory _Error() = _$ErrorImpl;
}

/// @nodoc
abstract class _$$GoToInitiativesImplCopyWith<$Res> {
  factory _$$GoToInitiativesImplCopyWith(_$GoToInitiativesImpl value,
          $Res Function(_$GoToInitiativesImpl) then) =
      __$$GoToInitiativesImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CognitoUserSession? session, SelfModel? selfModel, String? sessionId});
}

/// @nodoc
class __$$GoToInitiativesImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$GoToInitiativesImpl>
    implements _$$GoToInitiativesImplCopyWith<$Res> {
  __$$GoToInitiativesImplCopyWithImpl(
      _$GoToInitiativesImpl _value, $Res Function(_$GoToInitiativesImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? selfModel = freezed,
    Object? sessionId = freezed,
  }) {
    return _then(_$GoToInitiativesImpl(
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as CognitoUserSession?,
      selfModel: freezed == selfModel
          ? _value.selfModel
          : selfModel // ignore: cast_nullable_to_non_nullable
              as SelfModel?,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GoToInitiativesImpl
    with DiagnosticableTreeMixin
    implements _GoToInitiatives {
  const _$GoToInitiativesImpl({this.session, this.selfModel, this.sessionId});

  @override
  final CognitoUserSession? session;
  @override
  final SelfModel? selfModel;
  @override
  final String? sessionId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsState.goToInitiatives(session: $session, selfModel: $selfModel, sessionId: $sessionId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingsState.goToInitiatives'))
      ..add(DiagnosticsProperty('session', session))
      ..add(DiagnosticsProperty('selfModel', selfModel))
      ..add(DiagnosticsProperty('sessionId', sessionId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoToInitiativesImpl &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.selfModel, selfModel) ||
                other.selfModel == selfModel) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session, selfModel, sessionId);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoToInitiativesImplCopyWith<_$GoToInitiativesImpl> get copyWith =>
      __$$GoToInitiativesImplCopyWithImpl<_$GoToInitiativesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO)
        initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(CognitoUserSession? session, SelfModel? selfModel,
            String? sessionId)
        goToInitiatives,
  }) {
    return goToInitiatives(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(CognitoUserSession? session, SelfModel? selfModel,
            String? sessionId)?
        goToInitiatives,
  }) {
    return goToInitiatives?.call(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SmartConfiguratorModel? smartConfig, bool? loggedInViaSSO)?
        initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(CognitoUserSession? session, SelfModel? selfModel,
            String? sessionId)?
        goToInitiatives,
    required TResult orElse(),
  }) {
    if (goToInitiatives != null) {
      return goToInitiatives(session, selfModel, sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_GoToInitiatives value) goToInitiatives,
  }) {
    return goToInitiatives(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_GoToInitiatives value)? goToInitiatives,
  }) {
    return goToInitiatives?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_GoToInitiatives value)? goToInitiatives,
    required TResult orElse(),
  }) {
    if (goToInitiatives != null) {
      return goToInitiatives(this);
    }
    return orElse();
  }
}

abstract class _GoToInitiatives implements SettingsState {
  const factory _GoToInitiatives(
      {final CognitoUserSession? session,
      final SelfModel? selfModel,
      final String? sessionId}) = _$GoToInitiativesImpl;

  CognitoUserSession? get session;
  SelfModel? get selfModel;
  String? get sessionId;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoToInitiativesImplCopyWith<_$GoToInitiativesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
