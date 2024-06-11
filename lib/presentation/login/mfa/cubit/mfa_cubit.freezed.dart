// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mfa_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MfaState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(String code) recoverPassword,
    required TResult Function(int tentative) tryAgain,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(String code)? recoverPassword,
    TResult? Function(int tentative)? tryAgain,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(String code)? recoverPassword,
    TResult Function(int tentative)? tryAgain,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_RecoverPassword value) recoverPassword,
    required TResult Function(_TryAgain value) tryAgain,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_RecoverPassword value)? recoverPassword,
    TResult? Function(_TryAgain value)? tryAgain,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_RecoverPassword value)? recoverPassword,
    TResult Function(_TryAgain value)? tryAgain,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MfaStateCopyWith<$Res> {
  factory $MfaStateCopyWith(MfaState value, $Res Function(MfaState) then) =
      _$MfaStateCopyWithImpl<$Res, MfaState>;
}

/// @nodoc
class _$MfaStateCopyWithImpl<$Res, $Val extends MfaState>
    implements $MfaStateCopyWith<$Res> {
  _$MfaStateCopyWithImpl(this._value, this._then);

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
    extends _$MfaStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'MfaState.initial()';
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
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(String code) recoverPassword,
    required TResult Function(int tentative) tryAgain,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(String code)? recoverPassword,
    TResult? Function(int tentative)? tryAgain,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(String code)? recoverPassword,
    TResult Function(int tentative)? tryAgain,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_RecoverPassword value) recoverPassword,
    required TResult Function(_TryAgain value) tryAgain,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_RecoverPassword value)? recoverPassword,
    TResult? Function(_TryAgain value)? tryAgain,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_RecoverPassword value)? recoverPassword,
    TResult Function(_TryAgain value)? tryAgain,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MfaState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$MfaStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'MfaState.loading()';
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
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(String code) recoverPassword,
    required TResult Function(int tentative) tryAgain,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(String code)? recoverPassword,
    TResult? Function(int tentative)? tryAgain,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(String code)? recoverPassword,
    TResult Function(int tentative)? tryAgain,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_RecoverPassword value) recoverPassword,
    required TResult Function(_TryAgain value) tryAgain,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_RecoverPassword value)? recoverPassword,
    TResult? Function(_TryAgain value)? tryAgain,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_RecoverPassword value)? recoverPassword,
    TResult Function(_TryAgain value)? tryAgain,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MfaState {
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
    extends _$MfaStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'MfaState.error()';
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
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(String code) recoverPassword,
    required TResult Function(int tentative) tryAgain,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(String code)? recoverPassword,
    TResult? Function(int tentative)? tryAgain,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(String code)? recoverPassword,
    TResult Function(int tentative)? tryAgain,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_RecoverPassword value) recoverPassword,
    required TResult Function(_TryAgain value) tryAgain,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_RecoverPassword value)? recoverPassword,
    TResult? Function(_TryAgain value)? tryAgain,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_RecoverPassword value)? recoverPassword,
    TResult Function(_TryAgain value)? tryAgain,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements MfaState {
  const factory _Error() = _$ErrorImpl;
}

/// @nodoc
abstract class _$$ShowInitiativesImplCopyWith<$Res> {
  factory _$$ShowInitiativesImplCopyWith(_$ShowInitiativesImpl value,
          $Res Function(_$ShowInitiativesImpl) then) =
      __$$ShowInitiativesImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CognitoUserSession session, SelfModel selfModel, String sessionId});
}

/// @nodoc
class __$$ShowInitiativesImplCopyWithImpl<$Res>
    extends _$MfaStateCopyWithImpl<$Res, _$ShowInitiativesImpl>
    implements _$$ShowInitiativesImplCopyWith<$Res> {
  __$$ShowInitiativesImplCopyWithImpl(
      _$ShowInitiativesImpl _value, $Res Function(_$ShowInitiativesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
    Object? selfModel = null,
    Object? sessionId = null,
  }) {
    return _then(_$ShowInitiativesImpl(
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

class _$ShowInitiativesImpl implements _ShowInitiatives {
  const _$ShowInitiativesImpl(this.session, this.selfModel, this.sessionId);

  @override
  final CognitoUserSession session;
  @override
  final SelfModel selfModel;
  @override
  final String sessionId;

  @override
  String toString() {
    return 'MfaState.showInitiatives(session: $session, selfModel: $selfModel, sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowInitiativesImpl &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.selfModel, selfModel) ||
                other.selfModel == selfModel) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session, selfModel, sessionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowInitiativesImplCopyWith<_$ShowInitiativesImpl> get copyWith =>
      __$$ShowInitiativesImplCopyWithImpl<_$ShowInitiativesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(String code) recoverPassword,
    required TResult Function(int tentative) tryAgain,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
  }) {
    return showInitiatives(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(String code)? recoverPassword,
    TResult? Function(int tentative)? tryAgain,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
  }) {
    return showInitiatives?.call(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(String code)? recoverPassword,
    TResult Function(int tentative)? tryAgain,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    required TResult orElse(),
  }) {
    if (showInitiatives != null) {
      return showInitiatives(session, selfModel, sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_RecoverPassword value) recoverPassword,
    required TResult Function(_TryAgain value) tryAgain,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
  }) {
    return showInitiatives(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_RecoverPassword value)? recoverPassword,
    TResult? Function(_TryAgain value)? tryAgain,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
  }) {
    return showInitiatives?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_RecoverPassword value)? recoverPassword,
    TResult Function(_TryAgain value)? tryAgain,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    required TResult orElse(),
  }) {
    if (showInitiatives != null) {
      return showInitiatives(this);
    }
    return orElse();
  }
}

abstract class _ShowInitiatives implements MfaState {
  const factory _ShowInitiatives(
      final CognitoUserSession session,
      final SelfModel selfModel,
      final String sessionId) = _$ShowInitiativesImpl;

  CognitoUserSession get session;
  SelfModel get selfModel;
  String get sessionId;
  @JsonKey(ignore: true)
  _$$ShowInitiativesImplCopyWith<_$ShowInitiativesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecoverPasswordImplCopyWith<$Res> {
  factory _$$RecoverPasswordImplCopyWith(_$RecoverPasswordImpl value,
          $Res Function(_$RecoverPasswordImpl) then) =
      __$$RecoverPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$RecoverPasswordImplCopyWithImpl<$Res>
    extends _$MfaStateCopyWithImpl<$Res, _$RecoverPasswordImpl>
    implements _$$RecoverPasswordImplCopyWith<$Res> {
  __$$RecoverPasswordImplCopyWithImpl(
      _$RecoverPasswordImpl _value, $Res Function(_$RecoverPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$RecoverPasswordImpl(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RecoverPasswordImpl implements _RecoverPassword {
  const _$RecoverPasswordImpl(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'MfaState.recoverPassword(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecoverPasswordImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecoverPasswordImplCopyWith<_$RecoverPasswordImpl> get copyWith =>
      __$$RecoverPasswordImplCopyWithImpl<_$RecoverPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(String code) recoverPassword,
    required TResult Function(int tentative) tryAgain,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
  }) {
    return recoverPassword(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(String code)? recoverPassword,
    TResult? Function(int tentative)? tryAgain,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
  }) {
    return recoverPassword?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(String code)? recoverPassword,
    TResult Function(int tentative)? tryAgain,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    required TResult orElse(),
  }) {
    if (recoverPassword != null) {
      return recoverPassword(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_RecoverPassword value) recoverPassword,
    required TResult Function(_TryAgain value) tryAgain,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
  }) {
    return recoverPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_RecoverPassword value)? recoverPassword,
    TResult? Function(_TryAgain value)? tryAgain,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
  }) {
    return recoverPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_RecoverPassword value)? recoverPassword,
    TResult Function(_TryAgain value)? tryAgain,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    required TResult orElse(),
  }) {
    if (recoverPassword != null) {
      return recoverPassword(this);
    }
    return orElse();
  }
}

abstract class _RecoverPassword implements MfaState {
  const factory _RecoverPassword(final String code) = _$RecoverPasswordImpl;

  String get code;
  @JsonKey(ignore: true)
  _$$RecoverPasswordImplCopyWith<_$RecoverPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TryAgainImplCopyWith<$Res> {
  factory _$$TryAgainImplCopyWith(
          _$TryAgainImpl value, $Res Function(_$TryAgainImpl) then) =
      __$$TryAgainImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int tentative});
}

/// @nodoc
class __$$TryAgainImplCopyWithImpl<$Res>
    extends _$MfaStateCopyWithImpl<$Res, _$TryAgainImpl>
    implements _$$TryAgainImplCopyWith<$Res> {
  __$$TryAgainImplCopyWithImpl(
      _$TryAgainImpl _value, $Res Function(_$TryAgainImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tentative = null,
  }) {
    return _then(_$TryAgainImpl(
      null == tentative
          ? _value.tentative
          : tentative // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TryAgainImpl implements _TryAgain {
  const _$TryAgainImpl(this.tentative);

  @override
  final int tentative;

  @override
  String toString() {
    return 'MfaState.tryAgain(tentative: $tentative)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TryAgainImpl &&
            (identical(other.tentative, tentative) ||
                other.tentative == tentative));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tentative);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TryAgainImplCopyWith<_$TryAgainImpl> get copyWith =>
      __$$TryAgainImplCopyWithImpl<_$TryAgainImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(String code) recoverPassword,
    required TResult Function(int tentative) tryAgain,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
  }) {
    return tryAgain(tentative);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(String code)? recoverPassword,
    TResult? Function(int tentative)? tryAgain,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
  }) {
    return tryAgain?.call(tentative);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(String code)? recoverPassword,
    TResult Function(int tentative)? tryAgain,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    required TResult orElse(),
  }) {
    if (tryAgain != null) {
      return tryAgain(tentative);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_RecoverPassword value) recoverPassword,
    required TResult Function(_TryAgain value) tryAgain,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
  }) {
    return tryAgain(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_RecoverPassword value)? recoverPassword,
    TResult? Function(_TryAgain value)? tryAgain,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
  }) {
    return tryAgain?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_RecoverPassword value)? recoverPassword,
    TResult Function(_TryAgain value)? tryAgain,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    required TResult orElse(),
  }) {
    if (tryAgain != null) {
      return tryAgain(this);
    }
    return orElse();
  }
}

abstract class _TryAgain implements MfaState {
  const factory _TryAgain(final int tentative) = _$TryAgainImpl;

  int get tentative;
  @JsonKey(ignore: true)
  _$$TryAgainImplCopyWith<_$TryAgainImpl> get copyWith =>
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
    extends _$MfaStateCopyWithImpl<$Res, _$ShowPolicyPageImpl>
    implements _$$ShowPolicyPageImplCopyWith<$Res> {
  __$$ShowPolicyPageImplCopyWithImpl(
      _$ShowPolicyPageImpl _value, $Res Function(_$ShowPolicyPageImpl) _then)
      : super(_value, _then);

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
    return 'MfaState.showPolicyPage(session: $session, selfModel: $selfModel, sessionId: $sessionId)';
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowPolicyPageImplCopyWith<_$ShowPolicyPageImpl> get copyWith =>
      __$$ShowPolicyPageImplCopyWithImpl<_$ShowPolicyPageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(String code) recoverPassword,
    required TResult Function(int tentative) tryAgain,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
  }) {
    return showPolicyPage(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(String code)? recoverPassword,
    TResult? Function(int tentative)? tryAgain,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
  }) {
    return showPolicyPage?.call(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(String code)? recoverPassword,
    TResult Function(int tentative)? tryAgain,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_RecoverPassword value) recoverPassword,
    required TResult Function(_TryAgain value) tryAgain,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
  }) {
    return showPolicyPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_RecoverPassword value)? recoverPassword,
    TResult? Function(_TryAgain value)? tryAgain,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
  }) {
    return showPolicyPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_RecoverPassword value)? recoverPassword,
    TResult Function(_TryAgain value)? tryAgain,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    required TResult orElse(),
  }) {
    if (showPolicyPage != null) {
      return showPolicyPage(this);
    }
    return orElse();
  }
}

abstract class _ShowPolicyPage implements MfaState {
  const factory _ShowPolicyPage(final CognitoUserSession session,
      final SelfModel selfModel, final String sessionId) = _$ShowPolicyPageImpl;

  CognitoUserSession get session;
  SelfModel get selfModel;
  String get sessionId;
  @JsonKey(ignore: true)
  _$$ShowPolicyPageImplCopyWith<_$ShowPolicyPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
