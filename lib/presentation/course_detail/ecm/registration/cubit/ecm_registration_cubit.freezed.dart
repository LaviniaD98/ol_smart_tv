// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ecm_registration_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EcmRegistrationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EcmFirstStepArgs? args) firstStep,
    required TResult Function(EcmFirstStepArgs firstStep) secondStep,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EcmFirstStepArgs? args)? firstStep,
    TResult? Function(EcmFirstStepArgs firstStep)? secondStep,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EcmFirstStepArgs? args)? firstStep,
    TResult Function(EcmFirstStepArgs firstStep)? secondStep,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EcmFirstStep value) firstStep,
    required TResult Function(_EcmSecondStep value) secondStep,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EcmFirstStep value)? firstStep,
    TResult? Function(_EcmSecondStep value)? secondStep,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EcmFirstStep value)? firstStep,
    TResult Function(_EcmSecondStep value)? secondStep,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EcmRegistrationStateCopyWith<$Res> {
  factory $EcmRegistrationStateCopyWith(EcmRegistrationState value,
          $Res Function(EcmRegistrationState) then) =
      _$EcmRegistrationStateCopyWithImpl<$Res, EcmRegistrationState>;
}

/// @nodoc
class _$EcmRegistrationStateCopyWithImpl<$Res,
        $Val extends EcmRegistrationState>
    implements $EcmRegistrationStateCopyWith<$Res> {
  _$EcmRegistrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EcmRegistrationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EcmFirstStepImplCopyWith<$Res> {
  factory _$$EcmFirstStepImplCopyWith(
          _$EcmFirstStepImpl value, $Res Function(_$EcmFirstStepImpl) then) =
      __$$EcmFirstStepImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EcmFirstStepArgs? args});
}

/// @nodoc
class __$$EcmFirstStepImplCopyWithImpl<$Res>
    extends _$EcmRegistrationStateCopyWithImpl<$Res, _$EcmFirstStepImpl>
    implements _$$EcmFirstStepImplCopyWith<$Res> {
  __$$EcmFirstStepImplCopyWithImpl(
      _$EcmFirstStepImpl _value, $Res Function(_$EcmFirstStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of EcmRegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? args = freezed,
  }) {
    return _then(_$EcmFirstStepImpl(
      args: freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as EcmFirstStepArgs?,
    ));
  }
}

/// @nodoc

class _$EcmFirstStepImpl implements _EcmFirstStep {
  const _$EcmFirstStepImpl({this.args});

  @override
  final EcmFirstStepArgs? args;

  @override
  String toString() {
    return 'EcmRegistrationState.firstStep(args: $args)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EcmFirstStepImpl &&
            (identical(other.args, args) || other.args == args));
  }

  @override
  int get hashCode => Object.hash(runtimeType, args);

  /// Create a copy of EcmRegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EcmFirstStepImplCopyWith<_$EcmFirstStepImpl> get copyWith =>
      __$$EcmFirstStepImplCopyWithImpl<_$EcmFirstStepImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EcmFirstStepArgs? args) firstStep,
    required TResult Function(EcmFirstStepArgs firstStep) secondStep,
  }) {
    return firstStep(args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EcmFirstStepArgs? args)? firstStep,
    TResult? Function(EcmFirstStepArgs firstStep)? secondStep,
  }) {
    return firstStep?.call(args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EcmFirstStepArgs? args)? firstStep,
    TResult Function(EcmFirstStepArgs firstStep)? secondStep,
    required TResult orElse(),
  }) {
    if (firstStep != null) {
      return firstStep(args);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EcmFirstStep value) firstStep,
    required TResult Function(_EcmSecondStep value) secondStep,
  }) {
    return firstStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EcmFirstStep value)? firstStep,
    TResult? Function(_EcmSecondStep value)? secondStep,
  }) {
    return firstStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EcmFirstStep value)? firstStep,
    TResult Function(_EcmSecondStep value)? secondStep,
    required TResult orElse(),
  }) {
    if (firstStep != null) {
      return firstStep(this);
    }
    return orElse();
  }
}

abstract class _EcmFirstStep implements EcmRegistrationState {
  const factory _EcmFirstStep({final EcmFirstStepArgs? args}) =
      _$EcmFirstStepImpl;

  EcmFirstStepArgs? get args;

  /// Create a copy of EcmRegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EcmFirstStepImplCopyWith<_$EcmFirstStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EcmSecondStepImplCopyWith<$Res> {
  factory _$$EcmSecondStepImplCopyWith(
          _$EcmSecondStepImpl value, $Res Function(_$EcmSecondStepImpl) then) =
      __$$EcmSecondStepImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EcmFirstStepArgs firstStep});
}

/// @nodoc
class __$$EcmSecondStepImplCopyWithImpl<$Res>
    extends _$EcmRegistrationStateCopyWithImpl<$Res, _$EcmSecondStepImpl>
    implements _$$EcmSecondStepImplCopyWith<$Res> {
  __$$EcmSecondStepImplCopyWithImpl(
      _$EcmSecondStepImpl _value, $Res Function(_$EcmSecondStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of EcmRegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstStep = null,
  }) {
    return _then(_$EcmSecondStepImpl(
      null == firstStep
          ? _value.firstStep
          : firstStep // ignore: cast_nullable_to_non_nullable
              as EcmFirstStepArgs,
    ));
  }
}

/// @nodoc

class _$EcmSecondStepImpl implements _EcmSecondStep {
  const _$EcmSecondStepImpl(this.firstStep);

  @override
  final EcmFirstStepArgs firstStep;

  @override
  String toString() {
    return 'EcmRegistrationState.secondStep(firstStep: $firstStep)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EcmSecondStepImpl &&
            (identical(other.firstStep, firstStep) ||
                other.firstStep == firstStep));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstStep);

  /// Create a copy of EcmRegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EcmSecondStepImplCopyWith<_$EcmSecondStepImpl> get copyWith =>
      __$$EcmSecondStepImplCopyWithImpl<_$EcmSecondStepImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EcmFirstStepArgs? args) firstStep,
    required TResult Function(EcmFirstStepArgs firstStep) secondStep,
  }) {
    return secondStep(this.firstStep);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EcmFirstStepArgs? args)? firstStep,
    TResult? Function(EcmFirstStepArgs firstStep)? secondStep,
  }) {
    return secondStep?.call(this.firstStep);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EcmFirstStepArgs? args)? firstStep,
    TResult Function(EcmFirstStepArgs firstStep)? secondStep,
    required TResult orElse(),
  }) {
    if (secondStep != null) {
      return secondStep(this.firstStep);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EcmFirstStep value) firstStep,
    required TResult Function(_EcmSecondStep value) secondStep,
  }) {
    return secondStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EcmFirstStep value)? firstStep,
    TResult? Function(_EcmSecondStep value)? secondStep,
  }) {
    return secondStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EcmFirstStep value)? firstStep,
    TResult Function(_EcmSecondStep value)? secondStep,
    required TResult orElse(),
  }) {
    if (secondStep != null) {
      return secondStep(this);
    }
    return orElse();
  }
}

abstract class _EcmSecondStep implements EcmRegistrationState {
  const factory _EcmSecondStep(final EcmFirstStepArgs firstStep) =
      _$EcmSecondStepImpl;

  EcmFirstStepArgs get firstStep;

  /// Create a copy of EcmRegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EcmSecondStepImplCopyWith<_$EcmSecondStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
