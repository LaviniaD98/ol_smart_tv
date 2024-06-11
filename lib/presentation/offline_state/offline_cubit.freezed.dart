// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OfflineState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function(FormGroup formGroup, bool showTutorial)
        shownOnboarding,
    required TResult Function(FormGroup formGroup) showTutorial,
    required TResult Function(bool isOnline, DateTime now) networkChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function(FormGroup formGroup, bool showTutorial)? shownOnboarding,
    TResult? Function(FormGroup formGroup)? showTutorial,
    TResult? Function(bool isOnline, DateTime now)? networkChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function(FormGroup formGroup, bool showTutorial)? shownOnboarding,
    TResult Function(FormGroup formGroup)? showTutorial,
    TResult Function(bool isOnline, DateTime now)? networkChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(_ShownOnboarding value) shownOnboarding,
    required TResult Function(_ShowTutorial value) showTutorial,
    required TResult Function(_NetworkChanged value) networkChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(_ShownOnboarding value)? shownOnboarding,
    TResult? Function(_ShowTutorial value)? showTutorial,
    TResult? Function(_NetworkChanged value)? networkChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(_ShownOnboarding value)? shownOnboarding,
    TResult Function(_ShowTutorial value)? showTutorial,
    TResult Function(_NetworkChanged value)? networkChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflineStateCopyWith<$Res> {
  factory $OfflineStateCopyWith(
          OfflineState value, $Res Function(OfflineState) then) =
      _$OfflineStateCopyWithImpl<$Res, OfflineState>;
}

/// @nodoc
class _$OfflineStateCopyWithImpl<$Res, $Val extends OfflineState>
    implements $OfflineStateCopyWith<$Res> {
  _$OfflineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdleImpl with DiagnosticableTreeMixin implements _Idle {
  const _$IdleImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfflineState.idle()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'OfflineState.idle'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function(FormGroup formGroup, bool showTutorial)
        shownOnboarding,
    required TResult Function(FormGroup formGroup) showTutorial,
    required TResult Function(bool isOnline, DateTime now) networkChanged,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function(FormGroup formGroup, bool showTutorial)? shownOnboarding,
    TResult? Function(FormGroup formGroup)? showTutorial,
    TResult? Function(bool isOnline, DateTime now)? networkChanged,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function(FormGroup formGroup, bool showTutorial)? shownOnboarding,
    TResult Function(FormGroup formGroup)? showTutorial,
    TResult Function(bool isOnline, DateTime now)? networkChanged,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(_ShownOnboarding value) shownOnboarding,
    required TResult Function(_ShowTutorial value) showTutorial,
    required TResult Function(_NetworkChanged value) networkChanged,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(_ShownOnboarding value)? shownOnboarding,
    TResult? Function(_ShowTutorial value)? showTutorial,
    TResult? Function(_NetworkChanged value)? networkChanged,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(_ShownOnboarding value)? shownOnboarding,
    TResult Function(_ShowTutorial value)? showTutorial,
    TResult Function(_NetworkChanged value)? networkChanged,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements OfflineState {
  const factory _Idle() = _$IdleImpl;
}

/// @nodoc
abstract class _$$SyncingImplCopyWith<$Res> {
  factory _$$SyncingImplCopyWith(
          _$SyncingImpl value, $Res Function(_$SyncingImpl) then) =
      __$$SyncingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncingImplCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res, _$SyncingImpl>
    implements _$$SyncingImplCopyWith<$Res> {
  __$$SyncingImplCopyWithImpl(
      _$SyncingImpl _value, $Res Function(_$SyncingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncingImpl with DiagnosticableTreeMixin implements _Syncing {
  const _$SyncingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfflineState.syncing()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'OfflineState.syncing'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function(FormGroup formGroup, bool showTutorial)
        shownOnboarding,
    required TResult Function(FormGroup formGroup) showTutorial,
    required TResult Function(bool isOnline, DateTime now) networkChanged,
  }) {
    return syncing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function(FormGroup formGroup, bool showTutorial)? shownOnboarding,
    TResult? Function(FormGroup formGroup)? showTutorial,
    TResult? Function(bool isOnline, DateTime now)? networkChanged,
  }) {
    return syncing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function(FormGroup formGroup, bool showTutorial)? shownOnboarding,
    TResult Function(FormGroup formGroup)? showTutorial,
    TResult Function(bool isOnline, DateTime now)? networkChanged,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(_ShownOnboarding value) shownOnboarding,
    required TResult Function(_ShowTutorial value) showTutorial,
    required TResult Function(_NetworkChanged value) networkChanged,
  }) {
    return syncing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(_ShownOnboarding value)? shownOnboarding,
    TResult? Function(_ShowTutorial value)? showTutorial,
    TResult? Function(_NetworkChanged value)? networkChanged,
  }) {
    return syncing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(_ShownOnboarding value)? shownOnboarding,
    TResult Function(_ShowTutorial value)? showTutorial,
    TResult Function(_NetworkChanged value)? networkChanged,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing(this);
    }
    return orElse();
  }
}

abstract class _Syncing implements OfflineState {
  const factory _Syncing() = _$SyncingImpl;
}

/// @nodoc
abstract class _$$DoneImplCopyWith<$Res> {
  factory _$$DoneImplCopyWith(
          _$DoneImpl value, $Res Function(_$DoneImpl) then) =
      __$$DoneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DoneImplCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res, _$DoneImpl>
    implements _$$DoneImplCopyWith<$Res> {
  __$$DoneImplCopyWithImpl(_$DoneImpl _value, $Res Function(_$DoneImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DoneImpl with DiagnosticableTreeMixin implements _Done {
  const _$DoneImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfflineState.done()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'OfflineState.done'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DoneImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function(FormGroup formGroup, bool showTutorial)
        shownOnboarding,
    required TResult Function(FormGroup formGroup) showTutorial,
    required TResult Function(bool isOnline, DateTime now) networkChanged,
  }) {
    return done();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function(FormGroup formGroup, bool showTutorial)? shownOnboarding,
    TResult? Function(FormGroup formGroup)? showTutorial,
    TResult? Function(bool isOnline, DateTime now)? networkChanged,
  }) {
    return done?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function(FormGroup formGroup, bool showTutorial)? shownOnboarding,
    TResult Function(FormGroup formGroup)? showTutorial,
    TResult Function(bool isOnline, DateTime now)? networkChanged,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(_ShownOnboarding value) shownOnboarding,
    required TResult Function(_ShowTutorial value) showTutorial,
    required TResult Function(_NetworkChanged value) networkChanged,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(_ShownOnboarding value)? shownOnboarding,
    TResult? Function(_ShowTutorial value)? showTutorial,
    TResult? Function(_NetworkChanged value)? networkChanged,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(_ShownOnboarding value)? shownOnboarding,
    TResult Function(_ShowTutorial value)? showTutorial,
    TResult Function(_NetworkChanged value)? networkChanged,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class _Done implements OfflineState {
  const factory _Done() = _$DoneImpl;
}

/// @nodoc
abstract class _$$ShownOnboardingImplCopyWith<$Res> {
  factory _$$ShownOnboardingImplCopyWith(_$ShownOnboardingImpl value,
          $Res Function(_$ShownOnboardingImpl) then) =
      __$$ShownOnboardingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FormGroup formGroup, bool showTutorial});
}

/// @nodoc
class __$$ShownOnboardingImplCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res, _$ShownOnboardingImpl>
    implements _$$ShownOnboardingImplCopyWith<$Res> {
  __$$ShownOnboardingImplCopyWithImpl(
      _$ShownOnboardingImpl _value, $Res Function(_$ShownOnboardingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formGroup = null,
    Object? showTutorial = null,
  }) {
    return _then(_$ShownOnboardingImpl(
      null == formGroup
          ? _value.formGroup
          : formGroup // ignore: cast_nullable_to_non_nullable
              as FormGroup,
      null == showTutorial
          ? _value.showTutorial
          : showTutorial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ShownOnboardingImpl
    with DiagnosticableTreeMixin
    implements _ShownOnboarding {
  const _$ShownOnboardingImpl(this.formGroup, this.showTutorial);

  @override
  final FormGroup formGroup;
  @override
  final bool showTutorial;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfflineState.shownOnboarding(formGroup: $formGroup, showTutorial: $showTutorial)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OfflineState.shownOnboarding'))
      ..add(DiagnosticsProperty('formGroup', formGroup))
      ..add(DiagnosticsProperty('showTutorial', showTutorial));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShownOnboardingImpl &&
            (identical(other.formGroup, formGroup) ||
                other.formGroup == formGroup) &&
            (identical(other.showTutorial, showTutorial) ||
                other.showTutorial == showTutorial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formGroup, showTutorial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShownOnboardingImplCopyWith<_$ShownOnboardingImpl> get copyWith =>
      __$$ShownOnboardingImplCopyWithImpl<_$ShownOnboardingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function(FormGroup formGroup, bool showTutorial)
        shownOnboarding,
    required TResult Function(FormGroup formGroup) showTutorial,
    required TResult Function(bool isOnline, DateTime now) networkChanged,
  }) {
    return shownOnboarding(formGroup, this.showTutorial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function(FormGroup formGroup, bool showTutorial)? shownOnboarding,
    TResult? Function(FormGroup formGroup)? showTutorial,
    TResult? Function(bool isOnline, DateTime now)? networkChanged,
  }) {
    return shownOnboarding?.call(formGroup, this.showTutorial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function(FormGroup formGroup, bool showTutorial)? shownOnboarding,
    TResult Function(FormGroup formGroup)? showTutorial,
    TResult Function(bool isOnline, DateTime now)? networkChanged,
    required TResult orElse(),
  }) {
    if (shownOnboarding != null) {
      return shownOnboarding(formGroup, this.showTutorial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(_ShownOnboarding value) shownOnboarding,
    required TResult Function(_ShowTutorial value) showTutorial,
    required TResult Function(_NetworkChanged value) networkChanged,
  }) {
    return shownOnboarding(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(_ShownOnboarding value)? shownOnboarding,
    TResult? Function(_ShowTutorial value)? showTutorial,
    TResult? Function(_NetworkChanged value)? networkChanged,
  }) {
    return shownOnboarding?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(_ShownOnboarding value)? shownOnboarding,
    TResult Function(_ShowTutorial value)? showTutorial,
    TResult Function(_NetworkChanged value)? networkChanged,
    required TResult orElse(),
  }) {
    if (shownOnboarding != null) {
      return shownOnboarding(this);
    }
    return orElse();
  }
}

abstract class _ShownOnboarding implements OfflineState {
  const factory _ShownOnboarding(
          final FormGroup formGroup, final bool showTutorial) =
      _$ShownOnboardingImpl;

  FormGroup get formGroup;
  bool get showTutorial;
  @JsonKey(ignore: true)
  _$$ShownOnboardingImplCopyWith<_$ShownOnboardingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowTutorialImplCopyWith<$Res> {
  factory _$$ShowTutorialImplCopyWith(
          _$ShowTutorialImpl value, $Res Function(_$ShowTutorialImpl) then) =
      __$$ShowTutorialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FormGroup formGroup});
}

/// @nodoc
class __$$ShowTutorialImplCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res, _$ShowTutorialImpl>
    implements _$$ShowTutorialImplCopyWith<$Res> {
  __$$ShowTutorialImplCopyWithImpl(
      _$ShowTutorialImpl _value, $Res Function(_$ShowTutorialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formGroup = null,
  }) {
    return _then(_$ShowTutorialImpl(
      null == formGroup
          ? _value.formGroup
          : formGroup // ignore: cast_nullable_to_non_nullable
              as FormGroup,
    ));
  }
}

/// @nodoc

class _$ShowTutorialImpl with DiagnosticableTreeMixin implements _ShowTutorial {
  const _$ShowTutorialImpl(this.formGroup);

  @override
  final FormGroup formGroup;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfflineState.showTutorial(formGroup: $formGroup)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OfflineState.showTutorial'))
      ..add(DiagnosticsProperty('formGroup', formGroup));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowTutorialImpl &&
            (identical(other.formGroup, formGroup) ||
                other.formGroup == formGroup));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formGroup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowTutorialImplCopyWith<_$ShowTutorialImpl> get copyWith =>
      __$$ShowTutorialImplCopyWithImpl<_$ShowTutorialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function(FormGroup formGroup, bool showTutorial)
        shownOnboarding,
    required TResult Function(FormGroup formGroup) showTutorial,
    required TResult Function(bool isOnline, DateTime now) networkChanged,
  }) {
    return showTutorial(formGroup);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function(FormGroup formGroup, bool showTutorial)? shownOnboarding,
    TResult? Function(FormGroup formGroup)? showTutorial,
    TResult? Function(bool isOnline, DateTime now)? networkChanged,
  }) {
    return showTutorial?.call(formGroup);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function(FormGroup formGroup, bool showTutorial)? shownOnboarding,
    TResult Function(FormGroup formGroup)? showTutorial,
    TResult Function(bool isOnline, DateTime now)? networkChanged,
    required TResult orElse(),
  }) {
    if (showTutorial != null) {
      return showTutorial(formGroup);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(_ShownOnboarding value) shownOnboarding,
    required TResult Function(_ShowTutorial value) showTutorial,
    required TResult Function(_NetworkChanged value) networkChanged,
  }) {
    return showTutorial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(_ShownOnboarding value)? shownOnboarding,
    TResult? Function(_ShowTutorial value)? showTutorial,
    TResult? Function(_NetworkChanged value)? networkChanged,
  }) {
    return showTutorial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(_ShownOnboarding value)? shownOnboarding,
    TResult Function(_ShowTutorial value)? showTutorial,
    TResult Function(_NetworkChanged value)? networkChanged,
    required TResult orElse(),
  }) {
    if (showTutorial != null) {
      return showTutorial(this);
    }
    return orElse();
  }
}

abstract class _ShowTutorial implements OfflineState {
  const factory _ShowTutorial(final FormGroup formGroup) = _$ShowTutorialImpl;

  FormGroup get formGroup;
  @JsonKey(ignore: true)
  _$$ShowTutorialImplCopyWith<_$ShowTutorialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkChangedImplCopyWith<$Res> {
  factory _$$NetworkChangedImplCopyWith(_$NetworkChangedImpl value,
          $Res Function(_$NetworkChangedImpl) then) =
      __$$NetworkChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isOnline, DateTime now});
}

/// @nodoc
class __$$NetworkChangedImplCopyWithImpl<$Res>
    extends _$OfflineStateCopyWithImpl<$Res, _$NetworkChangedImpl>
    implements _$$NetworkChangedImplCopyWith<$Res> {
  __$$NetworkChangedImplCopyWithImpl(
      _$NetworkChangedImpl _value, $Res Function(_$NetworkChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOnline = null,
    Object? now = null,
  }) {
    return _then(_$NetworkChangedImpl(
      null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      null == now
          ? _value.now
          : now // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$NetworkChangedImpl
    with DiagnosticableTreeMixin
    implements _NetworkChanged {
  const _$NetworkChangedImpl(this.isOnline, this.now);

  @override
  final bool isOnline;
  @override
  final DateTime now;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OfflineState.networkChanged(isOnline: $isOnline, now: $now)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OfflineState.networkChanged'))
      ..add(DiagnosticsProperty('isOnline', isOnline))
      ..add(DiagnosticsProperty('now', now));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkChangedImpl &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.now, now) || other.now == now));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOnline, now);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkChangedImplCopyWith<_$NetworkChangedImpl> get copyWith =>
      __$$NetworkChangedImplCopyWithImpl<_$NetworkChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function(FormGroup formGroup, bool showTutorial)
        shownOnboarding,
    required TResult Function(FormGroup formGroup) showTutorial,
    required TResult Function(bool isOnline, DateTime now) networkChanged,
  }) {
    return networkChanged(isOnline, now);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function(FormGroup formGroup, bool showTutorial)? shownOnboarding,
    TResult? Function(FormGroup formGroup)? showTutorial,
    TResult? Function(bool isOnline, DateTime now)? networkChanged,
  }) {
    return networkChanged?.call(isOnline, now);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function(FormGroup formGroup, bool showTutorial)? shownOnboarding,
    TResult Function(FormGroup formGroup)? showTutorial,
    TResult Function(bool isOnline, DateTime now)? networkChanged,
    required TResult orElse(),
  }) {
    if (networkChanged != null) {
      return networkChanged(isOnline, now);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(_ShownOnboarding value) shownOnboarding,
    required TResult Function(_ShowTutorial value) showTutorial,
    required TResult Function(_NetworkChanged value) networkChanged,
  }) {
    return networkChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(_ShownOnboarding value)? shownOnboarding,
    TResult? Function(_ShowTutorial value)? showTutorial,
    TResult? Function(_NetworkChanged value)? networkChanged,
  }) {
    return networkChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(_ShownOnboarding value)? shownOnboarding,
    TResult Function(_ShowTutorial value)? showTutorial,
    TResult Function(_NetworkChanged value)? networkChanged,
    required TResult orElse(),
  }) {
    if (networkChanged != null) {
      return networkChanged(this);
    }
    return orElse();
  }
}

abstract class _NetworkChanged implements OfflineState {
  const factory _NetworkChanged(final bool isOnline, final DateTime now) =
      _$NetworkChangedImpl;

  bool get isOnline;
  DateTime get now;
  @JsonKey(ignore: true)
  _$$NetworkChangedImplCopyWith<_$NetworkChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
