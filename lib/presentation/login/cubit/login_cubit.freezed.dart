// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(FormGroup form, LoginType loginType) initial,
    required TResult Function() error,
    required TResult Function(bool remember, String userId) mfaValidation,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)
        firstLoginPasswordChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(FormGroup form, LoginType loginType)? initial,
    TResult? Function()? error,
    TResult? Function(bool remember, String userId)? mfaValidation,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FormGroup form, LoginType loginType)? initial,
    TResult Function()? error,
    TResult Function(bool remember, String userId)? mfaValidation,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_MfaValidation value) mfaValidation,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_FirstLoginPasswordChange value)
        firstLoginPasswordChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_MfaValidation value)? mfaValidation,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_FirstLoginPasswordChange value)?
        firstLoginPasswordChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_MfaValidation value)? mfaValidation,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_FirstLoginPasswordChange value)? firstLoginPasswordChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

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
    extends _$LoginStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'LoginState.loading()';
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
    required TResult Function(FormGroup form, LoginType loginType) initial,
    required TResult Function() error,
    required TResult Function(bool remember, String userId) mfaValidation,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)
        firstLoginPasswordChange,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(FormGroup form, LoginType loginType)? initial,
    TResult? Function()? error,
    TResult? Function(bool remember, String userId)? mfaValidation,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FormGroup form, LoginType loginType)? initial,
    TResult Function()? error,
    TResult Function(bool remember, String userId)? mfaValidation,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
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
    required TResult Function(_Error value) error,
    required TResult Function(_MfaValidation value) mfaValidation,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_FirstLoginPasswordChange value)
        firstLoginPasswordChange,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_MfaValidation value)? mfaValidation,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_FirstLoginPasswordChange value)?
        firstLoginPasswordChange,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_MfaValidation value)? mfaValidation,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_FirstLoginPasswordChange value)? firstLoginPasswordChange,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements LoginState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FormGroup form, LoginType loginType});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? loginType = null,
  }) {
    return _then(_$InitialImpl(
      null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormGroup,
      null == loginType
          ? _value.loginType
          : loginType // ignore: cast_nullable_to_non_nullable
              as LoginType,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(this.form, this.loginType);

  @override
  final FormGroup form;
  @override
  final LoginType loginType;

  @override
  String toString() {
    return 'LoginState.initial(form: $form, loginType: $loginType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.loginType, loginType) ||
                other.loginType == loginType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form, loginType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(FormGroup form, LoginType loginType) initial,
    required TResult Function() error,
    required TResult Function(bool remember, String userId) mfaValidation,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)
        firstLoginPasswordChange,
  }) {
    return initial(form, loginType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(FormGroup form, LoginType loginType)? initial,
    TResult? Function()? error,
    TResult? Function(bool remember, String userId)? mfaValidation,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
  }) {
    return initial?.call(form, loginType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FormGroup form, LoginType loginType)? initial,
    TResult Function()? error,
    TResult Function(bool remember, String userId)? mfaValidation,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(form, loginType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_MfaValidation value) mfaValidation,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_FirstLoginPasswordChange value)
        firstLoginPasswordChange,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_MfaValidation value)? mfaValidation,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_FirstLoginPasswordChange value)?
        firstLoginPasswordChange,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_MfaValidation value)? mfaValidation,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_FirstLoginPasswordChange value)? firstLoginPasswordChange,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LoginState {
  const factory _Initial(final FormGroup form, final LoginType loginType) =
      _$InitialImpl;

  FormGroup get form;
  LoginType get loginType;
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
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
    extends _$LoginStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'LoginState.error()';
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
    required TResult Function(FormGroup form, LoginType loginType) initial,
    required TResult Function() error,
    required TResult Function(bool remember, String userId) mfaValidation,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)
        firstLoginPasswordChange,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(FormGroup form, LoginType loginType)? initial,
    TResult? Function()? error,
    TResult? Function(bool remember, String userId)? mfaValidation,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FormGroup form, LoginType loginType)? initial,
    TResult Function()? error,
    TResult Function(bool remember, String userId)? mfaValidation,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
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
    required TResult Function(_Error value) error,
    required TResult Function(_MfaValidation value) mfaValidation,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_FirstLoginPasswordChange value)
        firstLoginPasswordChange,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_MfaValidation value)? mfaValidation,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_FirstLoginPasswordChange value)?
        firstLoginPasswordChange,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_MfaValidation value)? mfaValidation,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_FirstLoginPasswordChange value)? firstLoginPasswordChange,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements LoginState {
  const factory _Error() = _$ErrorImpl;
}

/// @nodoc
abstract class _$$MfaValidationImplCopyWith<$Res> {
  factory _$$MfaValidationImplCopyWith(
          _$MfaValidationImpl value, $Res Function(_$MfaValidationImpl) then) =
      __$$MfaValidationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool remember, String userId});
}

/// @nodoc
class __$$MfaValidationImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$MfaValidationImpl>
    implements _$$MfaValidationImplCopyWith<$Res> {
  __$$MfaValidationImplCopyWithImpl(
      _$MfaValidationImpl _value, $Res Function(_$MfaValidationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remember = null,
    Object? userId = null,
  }) {
    return _then(_$MfaValidationImpl(
      null == remember
          ? _value.remember
          : remember // ignore: cast_nullable_to_non_nullable
              as bool,
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MfaValidationImpl implements _MfaValidation {
  const _$MfaValidationImpl(this.remember, this.userId);

  @override
  final bool remember;
  @override
  final String userId;

  @override
  String toString() {
    return 'LoginState.mfaValidation(remember: $remember, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MfaValidationImpl &&
            (identical(other.remember, remember) ||
                other.remember == remember) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, remember, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MfaValidationImplCopyWith<_$MfaValidationImpl> get copyWith =>
      __$$MfaValidationImplCopyWithImpl<_$MfaValidationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(FormGroup form, LoginType loginType) initial,
    required TResult Function() error,
    required TResult Function(bool remember, String userId) mfaValidation,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)
        firstLoginPasswordChange,
  }) {
    return mfaValidation(remember, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(FormGroup form, LoginType loginType)? initial,
    TResult? Function()? error,
    TResult? Function(bool remember, String userId)? mfaValidation,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
  }) {
    return mfaValidation?.call(remember, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FormGroup form, LoginType loginType)? initial,
    TResult Function()? error,
    TResult Function(bool remember, String userId)? mfaValidation,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
    required TResult orElse(),
  }) {
    if (mfaValidation != null) {
      return mfaValidation(remember, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_MfaValidation value) mfaValidation,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_FirstLoginPasswordChange value)
        firstLoginPasswordChange,
  }) {
    return mfaValidation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_MfaValidation value)? mfaValidation,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_FirstLoginPasswordChange value)?
        firstLoginPasswordChange,
  }) {
    return mfaValidation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_MfaValidation value)? mfaValidation,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_FirstLoginPasswordChange value)? firstLoginPasswordChange,
    required TResult orElse(),
  }) {
    if (mfaValidation != null) {
      return mfaValidation(this);
    }
    return orElse();
  }
}

abstract class _MfaValidation implements LoginState {
  const factory _MfaValidation(final bool remember, final String userId) =
      _$MfaValidationImpl;

  bool get remember;
  String get userId;
  @JsonKey(ignore: true)
  _$$MfaValidationImplCopyWith<_$MfaValidationImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$LoginStateCopyWithImpl<$Res, _$ShowInitiativesImpl>
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
    return 'LoginState.showInitiatives(session: $session, selfModel: $selfModel, sessionId: $sessionId)';
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
    required TResult Function() loading,
    required TResult Function(FormGroup form, LoginType loginType) initial,
    required TResult Function() error,
    required TResult Function(bool remember, String userId) mfaValidation,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)
        firstLoginPasswordChange,
  }) {
    return showInitiatives(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(FormGroup form, LoginType loginType)? initial,
    TResult? Function()? error,
    TResult? Function(bool remember, String userId)? mfaValidation,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
  }) {
    return showInitiatives?.call(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FormGroup form, LoginType loginType)? initial,
    TResult Function()? error,
    TResult Function(bool remember, String userId)? mfaValidation,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_MfaValidation value) mfaValidation,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_FirstLoginPasswordChange value)
        firstLoginPasswordChange,
  }) {
    return showInitiatives(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_MfaValidation value)? mfaValidation,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_FirstLoginPasswordChange value)?
        firstLoginPasswordChange,
  }) {
    return showInitiatives?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_MfaValidation value)? mfaValidation,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_FirstLoginPasswordChange value)? firstLoginPasswordChange,
    required TResult orElse(),
  }) {
    if (showInitiatives != null) {
      return showInitiatives(this);
    }
    return orElse();
  }
}

abstract class _ShowInitiatives implements LoginState {
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
    extends _$LoginStateCopyWithImpl<$Res, _$ShowPolicyPageImpl>
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
    return 'LoginState.showPolicyPage(session: $session, selfModel: $selfModel, sessionId: $sessionId)';
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
    required TResult Function() loading,
    required TResult Function(FormGroup form, LoginType loginType) initial,
    required TResult Function() error,
    required TResult Function(bool remember, String userId) mfaValidation,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)
        firstLoginPasswordChange,
  }) {
    return showPolicyPage(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(FormGroup form, LoginType loginType)? initial,
    TResult? Function()? error,
    TResult? Function(bool remember, String userId)? mfaValidation,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
  }) {
    return showPolicyPage?.call(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FormGroup form, LoginType loginType)? initial,
    TResult Function()? error,
    TResult Function(bool remember, String userId)? mfaValidation,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
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
    required TResult Function(_Error value) error,
    required TResult Function(_MfaValidation value) mfaValidation,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_FirstLoginPasswordChange value)
        firstLoginPasswordChange,
  }) {
    return showPolicyPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_MfaValidation value)? mfaValidation,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_FirstLoginPasswordChange value)?
        firstLoginPasswordChange,
  }) {
    return showPolicyPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_MfaValidation value)? mfaValidation,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_FirstLoginPasswordChange value)? firstLoginPasswordChange,
    required TResult orElse(),
  }) {
    if (showPolicyPage != null) {
      return showPolicyPage(this);
    }
    return orElse();
  }
}

abstract class _ShowPolicyPage implements LoginState {
  const factory _ShowPolicyPage(final CognitoUserSession session,
      final SelfModel selfModel, final String sessionId) = _$ShowPolicyPageImpl;

  CognitoUserSession get session;
  SelfModel get selfModel;
  String get sessionId;
  @JsonKey(ignore: true)
  _$$ShowPolicyPageImplCopyWith<_$ShowPolicyPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirstLoginPasswordChangeImplCopyWith<$Res> {
  factory _$$FirstLoginPasswordChangeImplCopyWith(
          _$FirstLoginPasswordChangeImpl value,
          $Res Function(_$FirstLoginPasswordChangeImpl) then) =
      __$$FirstLoginPasswordChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String oldPwd, CognitoUserNewPasswordRequiredException exception});
}

/// @nodoc
class __$$FirstLoginPasswordChangeImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$FirstLoginPasswordChangeImpl>
    implements _$$FirstLoginPasswordChangeImplCopyWith<$Res> {
  __$$FirstLoginPasswordChangeImplCopyWithImpl(
      _$FirstLoginPasswordChangeImpl _value,
      $Res Function(_$FirstLoginPasswordChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldPwd = null,
    Object? exception = null,
  }) {
    return _then(_$FirstLoginPasswordChangeImpl(
      null == oldPwd
          ? _value.oldPwd
          : oldPwd // ignore: cast_nullable_to_non_nullable
              as String,
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as CognitoUserNewPasswordRequiredException,
    ));
  }
}

/// @nodoc

class _$FirstLoginPasswordChangeImpl implements _FirstLoginPasswordChange {
  const _$FirstLoginPasswordChangeImpl(this.oldPwd, this.exception);

  @override
  final String oldPwd;
  @override
  final CognitoUserNewPasswordRequiredException exception;

  @override
  String toString() {
    return 'LoginState.firstLoginPasswordChange(oldPwd: $oldPwd, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstLoginPasswordChangeImpl &&
            (identical(other.oldPwd, oldPwd) || other.oldPwd == oldPwd) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldPwd, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirstLoginPasswordChangeImplCopyWith<_$FirstLoginPasswordChangeImpl>
      get copyWith => __$$FirstLoginPasswordChangeImplCopyWithImpl<
          _$FirstLoginPasswordChangeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(FormGroup form, LoginType loginType) initial,
    required TResult Function() error,
    required TResult Function(bool remember, String userId) mfaValidation,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)
        firstLoginPasswordChange,
  }) {
    return firstLoginPasswordChange(oldPwd, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(FormGroup form, LoginType loginType)? initial,
    TResult? Function()? error,
    TResult? Function(bool remember, String userId)? mfaValidation,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
  }) {
    return firstLoginPasswordChange?.call(oldPwd, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(FormGroup form, LoginType loginType)? initial,
    TResult Function()? error,
    TResult Function(bool remember, String userId)? mfaValidation,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function(
            String oldPwd, CognitoUserNewPasswordRequiredException exception)?
        firstLoginPasswordChange,
    required TResult orElse(),
  }) {
    if (firstLoginPasswordChange != null) {
      return firstLoginPasswordChange(oldPwd, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_MfaValidation value) mfaValidation,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_FirstLoginPasswordChange value)
        firstLoginPasswordChange,
  }) {
    return firstLoginPasswordChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_MfaValidation value)? mfaValidation,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_FirstLoginPasswordChange value)?
        firstLoginPasswordChange,
  }) {
    return firstLoginPasswordChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_MfaValidation value)? mfaValidation,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_FirstLoginPasswordChange value)? firstLoginPasswordChange,
    required TResult orElse(),
  }) {
    if (firstLoginPasswordChange != null) {
      return firstLoginPasswordChange(this);
    }
    return orElse();
  }
}

abstract class _FirstLoginPasswordChange implements LoginState {
  const factory _FirstLoginPasswordChange(final String oldPwd,
          final CognitoUserNewPasswordRequiredException exception) =
      _$FirstLoginPasswordChangeImpl;

  String get oldPwd;
  CognitoUserNewPasswordRequiredException get exception;
  @JsonKey(ignore: true)
  _$$FirstLoginPasswordChangeImplCopyWith<_$FirstLoginPasswordChangeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
