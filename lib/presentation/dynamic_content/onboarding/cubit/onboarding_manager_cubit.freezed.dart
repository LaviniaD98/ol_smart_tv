// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_manager_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingManagerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FormGroup formGroup) shown,
    required TResult Function() hidden,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FormGroup formGroup)? shown,
    TResult? Function()? hidden,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FormGroup formGroup)? shown,
    TResult Function()? hidden,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Shown value) shown,
    required TResult Function(_Hidden value) hidden,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Shown value)? shown,
    TResult? Function(_Hidden value)? hidden,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Shown value)? shown,
    TResult Function(_Hidden value)? hidden,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingManagerStateCopyWith<$Res> {
  factory $OnboardingManagerStateCopyWith(OnboardingManagerState value,
          $Res Function(OnboardingManagerState) then) =
      _$OnboardingManagerStateCopyWithImpl<$Res, OnboardingManagerState>;
}

/// @nodoc
class _$OnboardingManagerStateCopyWithImpl<$Res,
        $Val extends OnboardingManagerState>
    implements $OnboardingManagerStateCopyWith<$Res> {
  _$OnboardingManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingManagerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ShownImplCopyWith<$Res> {
  factory _$$ShownImplCopyWith(
          _$ShownImpl value, $Res Function(_$ShownImpl) then) =
      __$$ShownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FormGroup formGroup});
}

/// @nodoc
class __$$ShownImplCopyWithImpl<$Res>
    extends _$OnboardingManagerStateCopyWithImpl<$Res, _$ShownImpl>
    implements _$$ShownImplCopyWith<$Res> {
  __$$ShownImplCopyWithImpl(
      _$ShownImpl _value, $Res Function(_$ShownImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingManagerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formGroup = null,
  }) {
    return _then(_$ShownImpl(
      null == formGroup
          ? _value.formGroup
          : formGroup // ignore: cast_nullable_to_non_nullable
              as FormGroup,
    ));
  }
}

/// @nodoc

class _$ShownImpl implements _Shown {
  const _$ShownImpl(this.formGroup);

  @override
  final FormGroup formGroup;

  @override
  String toString() {
    return 'OnboardingManagerState.shown(formGroup: $formGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShownImpl &&
            (identical(other.formGroup, formGroup) ||
                other.formGroup == formGroup));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formGroup);

  /// Create a copy of OnboardingManagerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShownImplCopyWith<_$ShownImpl> get copyWith =>
      __$$ShownImplCopyWithImpl<_$ShownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FormGroup formGroup) shown,
    required TResult Function() hidden,
  }) {
    return shown(formGroup);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FormGroup formGroup)? shown,
    TResult? Function()? hidden,
  }) {
    return shown?.call(formGroup);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FormGroup formGroup)? shown,
    TResult Function()? hidden,
    required TResult orElse(),
  }) {
    if (shown != null) {
      return shown(formGroup);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Shown value) shown,
    required TResult Function(_Hidden value) hidden,
  }) {
    return shown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Shown value)? shown,
    TResult? Function(_Hidden value)? hidden,
  }) {
    return shown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Shown value)? shown,
    TResult Function(_Hidden value)? hidden,
    required TResult orElse(),
  }) {
    if (shown != null) {
      return shown(this);
    }
    return orElse();
  }
}

abstract class _Shown implements OnboardingManagerState {
  const factory _Shown(final FormGroup formGroup) = _$ShownImpl;

  FormGroup get formGroup;

  /// Create a copy of OnboardingManagerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShownImplCopyWith<_$ShownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HiddenImplCopyWith<$Res> {
  factory _$$HiddenImplCopyWith(
          _$HiddenImpl value, $Res Function(_$HiddenImpl) then) =
      __$$HiddenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HiddenImplCopyWithImpl<$Res>
    extends _$OnboardingManagerStateCopyWithImpl<$Res, _$HiddenImpl>
    implements _$$HiddenImplCopyWith<$Res> {
  __$$HiddenImplCopyWithImpl(
      _$HiddenImpl _value, $Res Function(_$HiddenImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingManagerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HiddenImpl implements _Hidden {
  const _$HiddenImpl();

  @override
  String toString() {
    return 'OnboardingManagerState.hidden()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HiddenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FormGroup formGroup) shown,
    required TResult Function() hidden,
  }) {
    return hidden();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FormGroup formGroup)? shown,
    TResult? Function()? hidden,
  }) {
    return hidden?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FormGroup formGroup)? shown,
    TResult Function()? hidden,
    required TResult orElse(),
  }) {
    if (hidden != null) {
      return hidden();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Shown value) shown,
    required TResult Function(_Hidden value) hidden,
  }) {
    return hidden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Shown value)? shown,
    TResult? Function(_Hidden value)? hidden,
  }) {
    return hidden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Shown value)? shown,
    TResult Function(_Hidden value)? hidden,
    required TResult orElse(),
  }) {
    if (hidden != null) {
      return hidden(this);
    }
    return orElse();
  }
}

abstract class _Hidden implements OnboardingManagerState {
  const factory _Hidden() = _$HiddenImpl;
}
