// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'corporate_code_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CorporateCodeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FormGroup form) initial,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function() showSessionPopup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FormGroup form)? initial,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function()? showSessionPopup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FormGroup form)? initial,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function()? showSessionPopup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_ShowSessionPopup value) showSessionPopup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_ShowSessionPopup value)? showSessionPopup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_ShowSessionPopup value)? showSessionPopup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CorporateCodeStateCopyWith<$Res> {
  factory $CorporateCodeStateCopyWith(
          CorporateCodeState value, $Res Function(CorporateCodeState) then) =
      _$CorporateCodeStateCopyWithImpl<$Res, CorporateCodeState>;
}

/// @nodoc
class _$CorporateCodeStateCopyWithImpl<$Res, $Val extends CorporateCodeState>
    implements $CorporateCodeStateCopyWith<$Res> {
  _$CorporateCodeStateCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call({FormGroup form});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CorporateCodeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
  }) {
    return _then(_$InitialImpl(
      null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as FormGroup,
    ));
  }
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl(this.form);

  @override
  final FormGroup form;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CorporateCodeState.initial(form: $form)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CorporateCodeState.initial'))
      ..add(DiagnosticsProperty('form', form));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.form, form) || other.form == form));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FormGroup form) initial,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function() showSessionPopup,
  }) {
    return initial(form);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FormGroup form)? initial,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function()? showSessionPopup,
  }) {
    return initial?.call(form);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FormGroup form)? initial,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function()? showSessionPopup,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(form);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_ShowSessionPopup value) showSessionPopup,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_ShowSessionPopup value)? showSessionPopup,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_ShowSessionPopup value)? showSessionPopup,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CorporateCodeState {
  const factory _Initial(final FormGroup form) = _$InitialImpl;

  FormGroup get form;
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$CorporateCodeStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl with DiagnosticableTreeMixin implements _Success {
  const _$SuccessImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CorporateCodeState.success()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'CorporateCodeState.success'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FormGroup form) initial,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function() showSessionPopup,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FormGroup form)? initial,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function()? showSessionPopup,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FormGroup form)? initial,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function()? showSessionPopup,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_ShowSessionPopup value) showSessionPopup,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_ShowSessionPopup value)? showSessionPopup,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_ShowSessionPopup value)? showSessionPopup,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CorporateCodeState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CorporateCodeStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CorporateCodeState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'CorporateCodeState.loading'));
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
    required TResult Function(FormGroup form) initial,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function() showSessionPopup,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FormGroup form)? initial,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function()? showSessionPopup,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FormGroup form)? initial,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function()? showSessionPopup,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_ShowSessionPopup value) showSessionPopup,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_ShowSessionPopup value)? showSessionPopup,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_ShowSessionPopup value)? showSessionPopup,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CorporateCodeState {
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
    extends _$CorporateCodeStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CorporateCodeState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'CorporateCodeState.error'));
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
    required TResult Function(FormGroup form) initial,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function() showSessionPopup,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FormGroup form)? initial,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function()? showSessionPopup,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FormGroup form)? initial,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function()? showSessionPopup,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_ShowSessionPopup value) showSessionPopup,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_ShowSessionPopup value)? showSessionPopup,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_ShowSessionPopup value)? showSessionPopup,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CorporateCodeState {
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
    extends _$CorporateCodeStateCopyWithImpl<$Res, _$ShowInitiativesImpl>
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

class _$ShowInitiativesImpl
    with DiagnosticableTreeMixin
    implements _ShowInitiatives {
  const _$ShowInitiativesImpl(this.session, this.selfModel, this.sessionId);

  @override
  final CognitoUserSession session;
  @override
  final SelfModel selfModel;
  @override
  final String sessionId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CorporateCodeState.showInitiatives(session: $session, selfModel: $selfModel, sessionId: $sessionId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CorporateCodeState.showInitiatives'))
      ..add(DiagnosticsProperty('session', session))
      ..add(DiagnosticsProperty('selfModel', selfModel))
      ..add(DiagnosticsProperty('sessionId', sessionId));
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
    required TResult Function(FormGroup form) initial,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function() showSessionPopup,
  }) {
    return showInitiatives(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FormGroup form)? initial,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function()? showSessionPopup,
  }) {
    return showInitiatives?.call(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FormGroup form)? initial,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function()? showSessionPopup,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_ShowSessionPopup value) showSessionPopup,
  }) {
    return showInitiatives(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_ShowSessionPopup value)? showSessionPopup,
  }) {
    return showInitiatives?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_ShowSessionPopup value)? showSessionPopup,
    required TResult orElse(),
  }) {
    if (showInitiatives != null) {
      return showInitiatives(this);
    }
    return orElse();
  }
}

abstract class _ShowInitiatives implements CorporateCodeState {
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
    extends _$CorporateCodeStateCopyWithImpl<$Res, _$ShowPolicyPageImpl>
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

class _$ShowPolicyPageImpl
    with DiagnosticableTreeMixin
    implements _ShowPolicyPage {
  const _$ShowPolicyPageImpl(this.session, this.selfModel, this.sessionId);

  @override
  final CognitoUserSession session;
  @override
  final SelfModel selfModel;
  @override
  final String sessionId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CorporateCodeState.showPolicyPage(session: $session, selfModel: $selfModel, sessionId: $sessionId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CorporateCodeState.showPolicyPage'))
      ..add(DiagnosticsProperty('session', session))
      ..add(DiagnosticsProperty('selfModel', selfModel))
      ..add(DiagnosticsProperty('sessionId', sessionId));
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
    required TResult Function(FormGroup form) initial,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function() showSessionPopup,
  }) {
    return showPolicyPage(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FormGroup form)? initial,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function()? showSessionPopup,
  }) {
    return showPolicyPage?.call(session, selfModel, sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FormGroup form)? initial,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function()? showSessionPopup,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_ShowSessionPopup value) showSessionPopup,
  }) {
    return showPolicyPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_ShowSessionPopup value)? showSessionPopup,
  }) {
    return showPolicyPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_ShowSessionPopup value)? showSessionPopup,
    required TResult orElse(),
  }) {
    if (showPolicyPage != null) {
      return showPolicyPage(this);
    }
    return orElse();
  }
}

abstract class _ShowPolicyPage implements CorporateCodeState {
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
abstract class _$$ShowSessionPopupImplCopyWith<$Res> {
  factory _$$ShowSessionPopupImplCopyWith(_$ShowSessionPopupImpl value,
          $Res Function(_$ShowSessionPopupImpl) then) =
      __$$ShowSessionPopupImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowSessionPopupImplCopyWithImpl<$Res>
    extends _$CorporateCodeStateCopyWithImpl<$Res, _$ShowSessionPopupImpl>
    implements _$$ShowSessionPopupImplCopyWith<$Res> {
  __$$ShowSessionPopupImplCopyWithImpl(_$ShowSessionPopupImpl _value,
      $Res Function(_$ShowSessionPopupImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShowSessionPopupImpl
    with DiagnosticableTreeMixin
    implements _ShowSessionPopup {
  const _$ShowSessionPopupImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CorporateCodeState.showSessionPopup()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'CorporateCodeState.showSessionPopup'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowSessionPopupImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FormGroup form) initial,
    required TResult Function() success,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showInitiatives,
    required TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)
        showPolicyPage,
    required TResult Function() showSessionPopup,
  }) {
    return showSessionPopup();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FormGroup form)? initial,
    TResult? Function()? success,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult? Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult? Function()? showSessionPopup,
  }) {
    return showSessionPopup?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FormGroup form)? initial,
    TResult Function()? success,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showInitiatives,
    TResult Function(
            CognitoUserSession session, SelfModel selfModel, String sessionId)?
        showPolicyPage,
    TResult Function()? showSessionPopup,
    required TResult orElse(),
  }) {
    if (showSessionPopup != null) {
      return showSessionPopup();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_ShowInitiatives value) showInitiatives,
    required TResult Function(_ShowPolicyPage value) showPolicyPage,
    required TResult Function(_ShowSessionPopup value) showSessionPopup,
  }) {
    return showSessionPopup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_ShowInitiatives value)? showInitiatives,
    TResult? Function(_ShowPolicyPage value)? showPolicyPage,
    TResult? Function(_ShowSessionPopup value)? showSessionPopup,
  }) {
    return showSessionPopup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_ShowInitiatives value)? showInitiatives,
    TResult Function(_ShowPolicyPage value)? showPolicyPage,
    TResult Function(_ShowSessionPopup value)? showSessionPopup,
    required TResult orElse(),
  }) {
    if (showSessionPopup != null) {
      return showSessionPopup(this);
    }
    return orElse();
  }
}

abstract class _ShowSessionPopup implements CorporateCodeState {
  const factory _ShowSessionPopup() = _$ShowSessionPopupImpl;
}
