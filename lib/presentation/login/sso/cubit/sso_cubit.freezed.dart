// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sso_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SsoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String ssoLoginUrl, String ssoCodeRedirectUrl)
        initial,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        success,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String ssoLoginUrl, String ssoCodeRedirectUrl)? initial,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        success,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String ssoLoginUrl, String ssoCodeRedirectUrl)? initial,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        success,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SsoStateCopyWith<$Res> {
  factory $SsoStateCopyWith(SsoState value, $Res Function(SsoState) then) =
      _$SsoStateCopyWithImpl<$Res, SsoState>;
}

/// @nodoc
class _$SsoStateCopyWithImpl<$Res, $Val extends SsoState>
    implements $SsoStateCopyWith<$Res> {
  _$SsoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SsoState
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
    extends _$SsoStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SsoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SsoState.loading()';
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
    required TResult Function(String ssoLoginUrl, String ssoCodeRedirectUrl)
        initial,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        success,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String ssoLoginUrl, String ssoCodeRedirectUrl)? initial,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        success,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String ssoLoginUrl, String ssoCodeRedirectUrl)? initial,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        success,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SsoState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String ssoLoginUrl, String ssoCodeRedirectUrl});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SsoStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SsoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ssoLoginUrl = null,
    Object? ssoCodeRedirectUrl = null,
  }) {
    return _then(_$InitialImpl(
      null == ssoLoginUrl
          ? _value.ssoLoginUrl
          : ssoLoginUrl // ignore: cast_nullable_to_non_nullable
              as String,
      null == ssoCodeRedirectUrl
          ? _value.ssoCodeRedirectUrl
          : ssoCodeRedirectUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(this.ssoLoginUrl, this.ssoCodeRedirectUrl);

  @override
  final String ssoLoginUrl;
  @override
  final String ssoCodeRedirectUrl;

  @override
  String toString() {
    return 'SsoState.initial(ssoLoginUrl: $ssoLoginUrl, ssoCodeRedirectUrl: $ssoCodeRedirectUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.ssoLoginUrl, ssoLoginUrl) ||
                other.ssoLoginUrl == ssoLoginUrl) &&
            (identical(other.ssoCodeRedirectUrl, ssoCodeRedirectUrl) ||
                other.ssoCodeRedirectUrl == ssoCodeRedirectUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ssoLoginUrl, ssoCodeRedirectUrl);

  /// Create a copy of SsoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String ssoLoginUrl, String ssoCodeRedirectUrl)
        initial,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        success,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function() error,
  }) {
    return initial(ssoLoginUrl, ssoCodeRedirectUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String ssoLoginUrl, String ssoCodeRedirectUrl)? initial,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        success,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function()? error,
  }) {
    return initial?.call(ssoLoginUrl, ssoCodeRedirectUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String ssoLoginUrl, String ssoCodeRedirectUrl)? initial,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        success,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(ssoLoginUrl, ssoCodeRedirectUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SsoState {
  const factory _Initial(
          final String ssoLoginUrl, final String ssoCodeRedirectUrl) =
      _$InitialImpl;

  String get ssoLoginUrl;
  String get ssoCodeRedirectUrl;

  /// Create a copy of SsoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CognitoUserSession session, SelfModel selfModel, String sessionId});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$SsoStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SsoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
    Object? selfModel = null,
    Object? sessionId = null,
  }) {
    return _then(_$SuccessImpl(
      null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as CognitoUserSession,
      null == selfModel
          ? _value.selfModel
          : selfModel // ignore: cast_nullable_to_non_nullable
              as SelfModel,
      null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.session, this.selfModel, this.sessionId);

  @override
  final CognitoUserSession session;
  @override
  final SelfModel selfModel;
  @override
  final String sessionId;

  @override
  String toString() {
    return 'SsoState.success(session: $session, selfModel: $selfModel, sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.selfModel, selfModel) ||
                other.selfModel == selfModel) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session, selfModel, sessionId);

  /// Create a copy of SsoState
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
    required TResult Function(String ssoLoginUrl, String ssoCodeRedirectUrl)
        initial,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        success,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function() error,
  }) {
    return success(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String ssoLoginUrl, String ssoCodeRedirectUrl)? initial,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        success,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function()? error,
  }) {
    return success?.call(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String ssoLoginUrl, String ssoCodeRedirectUrl)? initial,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        success,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(session, selfModel, sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements SsoState {
  const factory _Success(final CognitoUserSession session,
      final SelfModel selfModel, final String sessionId) = _$SuccessImpl;

  CognitoUserSession get session;
  SelfModel get selfModel;
  String get sessionId;

  /// Create a copy of SsoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowPolicyPageImplCopyWith<$Res> {
  factory _$$ShowPolicyPageImplCopyWith(_$ShowPolicyPageImpl value,
          $Res Function(_$ShowPolicyPageImpl) then) =
      __$$ShowPolicyPageImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CognitoUserSession session, SelfModel selfModel, String sessionId});
}

/// @nodoc
class __$$ShowPolicyPageImplCopyWithImpl<$Res>
    extends _$SsoStateCopyWithImpl<$Res, _$ShowPolicyPageImpl>
    implements _$$ShowPolicyPageImplCopyWith<$Res> {
  __$$ShowPolicyPageImplCopyWithImpl(
      _$ShowPolicyPageImpl _value, $Res Function(_$ShowPolicyPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of SsoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
    Object? selfModel = null,
    Object? sessionId = null,
  }) {
    return _then(_$ShowPolicyPageImpl(
      null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as CognitoUserSession,
      null == selfModel
          ? _value.selfModel
          : selfModel // ignore: cast_nullable_to_non_nullable
              as SelfModel,
      null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShowPolicyPageImpl implements _ShowPolicyPage {
  const _$ShowPolicyPageImpl(this.session, this.selfModel, this.sessionId);

  @override
  final CognitoUserSession session;
  @override
  final SelfModel selfModel;
  @override
  final String sessionId;

  @override
  String toString() {
    return 'SsoState.showPolicyPage(session: $session, selfModel: $selfModel, sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowPolicyPageImpl &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.selfModel, selfModel) ||
                other.selfModel == selfModel) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session, selfModel, sessionId);

  /// Create a copy of SsoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowPolicyPageImplCopyWith<_$ShowPolicyPageImpl> get copyWith =>
      __$$ShowPolicyPageImplCopyWithImpl<_$ShowPolicyPageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String ssoLoginUrl, String ssoCodeRedirectUrl)
        initial,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        success,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function() error,
  }) {
    return showPolicyPage(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String ssoLoginUrl, String ssoCodeRedirectUrl)? initial,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        success,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function()? error,
  }) {
    return showPolicyPage?.call(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String ssoLoginUrl, String ssoCodeRedirectUrl)? initial,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        success,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (showPolicyPage != null) {
      return showPolicyPage(session, selfModel, sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_Error value) error,
  }) {
    return showPolicyPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_Error value)? error,
  }) {
    return showPolicyPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (showPolicyPage != null) {
      return showPolicyPage(this);
    }
    return orElse();
  }
}

abstract class _ShowPolicyPage implements SsoState {
  const factory _ShowPolicyPage(final CognitoUserSession session,
      final SelfModel selfModel, final String sessionId) = _$ShowPolicyPageImpl;

  CognitoUserSession get session;
  SelfModel get selfModel;
  String get sessionId;

  /// Create a copy of SsoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowPolicyPageImplCopyWith<_$ShowPolicyPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SsoStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SsoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'SsoState.error()';
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
    required TResult Function(String ssoLoginUrl, String ssoCodeRedirectUrl)
        initial,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        success,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String ssoLoginUrl, String ssoCodeRedirectUrl)? initial,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        success,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String ssoLoginUrl, String ssoCodeRedirectUrl)? initial,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        success,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SsoState {
  const factory _Error() = _$ErrorImpl;
}
