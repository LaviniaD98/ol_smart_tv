// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'smart_learning_bottom_sheet_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SmartLearningBottomSheetState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(Failure failure) error,
    required TResult Function(
            List<DateTime> availableStartingTimes,
            List<DateTime> endTimesAvailable,
            List<SlotModel> slots,
            bool active,
            int? hoursAvailable)
        initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(Failure failure)? error,
    TResult? Function(
            List<DateTime> availableStartingTimes,
            List<DateTime> endTimesAvailable,
            List<SlotModel> slots,
            bool active,
            int? hoursAvailable)?
        initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(Failure failure)? error,
    TResult Function(
            List<DateTime> availableStartingTimes,
            List<DateTime> endTimesAvailable,
            List<SlotModel> slots,
            bool active,
            int? hoursAvailable)?
        initialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(Initialized value) initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(Initialized value)? initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(Initialized value)? initialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartLearningBottomSheetStateCopyWith<$Res> {
  factory $SmartLearningBottomSheetStateCopyWith(
          SmartLearningBottomSheetState value,
          $Res Function(SmartLearningBottomSheetState) then) =
      _$SmartLearningBottomSheetStateCopyWithImpl<$Res,
          SmartLearningBottomSheetState>;
}

/// @nodoc
class _$SmartLearningBottomSheetStateCopyWithImpl<$Res,
        $Val extends SmartLearningBottomSheetState>
    implements $SmartLearningBottomSheetStateCopyWith<$Res> {
  _$SmartLearningBottomSheetStateCopyWithImpl(this._value, this._then);

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
    extends _$SmartLearningBottomSheetStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'SmartLearningBottomSheetState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'SmartLearningBottomSheetState.loading'));
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
    required TResult Function() success,
    required TResult Function(Failure failure) error,
    required TResult Function(
            List<DateTime> availableStartingTimes,
            List<DateTime> endTimesAvailable,
            List<SlotModel> slots,
            bool active,
            int? hoursAvailable)
        initialized,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(Failure failure)? error,
    TResult? Function(
            List<DateTime> availableStartingTimes,
            List<DateTime> endTimesAvailable,
            List<SlotModel> slots,
            bool active,
            int? hoursAvailable)?
        initialized,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(Failure failure)? error,
    TResult Function(
            List<DateTime> availableStartingTimes,
            List<DateTime> endTimesAvailable,
            List<SlotModel> slots,
            bool active,
            int? hoursAvailable)?
        initialized,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(Initialized value) initialized,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(Initialized value)? initialized,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(Initialized value)? initialized,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SmartLearningBottomSheetState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$SmartLearningBottomSheetStateCopyWithImpl<$Res, _$SuccessImpl>
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
    return 'SmartLearningBottomSheetState.success()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'SmartLearningBottomSheetState.success'));
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
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(Failure failure) error,
    required TResult Function(
            List<DateTime> availableStartingTimes,
            List<DateTime> endTimesAvailable,
            List<SlotModel> slots,
            bool active,
            int? hoursAvailable)
        initialized,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(Failure failure)? error,
    TResult? Function(
            List<DateTime> availableStartingTimes,
            List<DateTime> endTimesAvailable,
            List<SlotModel> slots,
            bool active,
            int? hoursAvailable)?
        initialized,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(Failure failure)? error,
    TResult Function(
            List<DateTime> availableStartingTimes,
            List<DateTime> endTimesAvailable,
            List<SlotModel> slots,
            bool active,
            int? hoursAvailable)?
        initialized,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(Initialized value) initialized,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(Initialized value)? initialized,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(Initialized value)? initialized,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements SmartLearningBottomSheetState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SmartLearningBottomSheetStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ErrorImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SmartLearningBottomSheetState.error(failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SmartLearningBottomSheetState.error'))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(Failure failure) error,
    required TResult Function(
            List<DateTime> availableStartingTimes,
            List<DateTime> endTimesAvailable,
            List<SlotModel> slots,
            bool active,
            int? hoursAvailable)
        initialized,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(Failure failure)? error,
    TResult? Function(
            List<DateTime> availableStartingTimes,
            List<DateTime> endTimesAvailable,
            List<SlotModel> slots,
            bool active,
            int? hoursAvailable)?
        initialized,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(Failure failure)? error,
    TResult Function(
            List<DateTime> availableStartingTimes,
            List<DateTime> endTimesAvailable,
            List<SlotModel> slots,
            bool active,
            int? hoursAvailable)?
        initialized,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(Initialized value) initialized,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(Initialized value)? initialized,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(Initialized value)? initialized,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SmartLearningBottomSheetState {
  const factory _Error(final Failure failure) = _$ErrorImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<DateTime> availableStartingTimes,
      List<DateTime> endTimesAvailable,
      List<SlotModel> slots,
      bool active,
      int? hoursAvailable});
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$SmartLearningBottomSheetStateCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableStartingTimes = null,
    Object? endTimesAvailable = null,
    Object? slots = null,
    Object? active = null,
    Object? hoursAvailable = freezed,
  }) {
    return _then(_$InitializedImpl(
      availableStartingTimes: null == availableStartingTimes
          ? _value._availableStartingTimes
          : availableStartingTimes // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      endTimesAvailable: null == endTimesAvailable
          ? _value._endTimesAvailable
          : endTimesAvailable // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      slots: null == slots
          ? _value._slots
          : slots // ignore: cast_nullable_to_non_nullable
              as List<SlotModel>,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      hoursAvailable: freezed == hoursAvailable
          ? _value.hoursAvailable
          : hoursAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$InitializedImpl with DiagnosticableTreeMixin implements Initialized {
  const _$InitializedImpl(
      {required final List<DateTime> availableStartingTimes,
      required final List<DateTime> endTimesAvailable,
      required final List<SlotModel> slots,
      this.active = false,
      this.hoursAvailable})
      : _availableStartingTimes = availableStartingTimes,
        _endTimesAvailable = endTimesAvailable,
        _slots = slots;

  final List<DateTime> _availableStartingTimes;
  @override
  List<DateTime> get availableStartingTimes {
    if (_availableStartingTimes is EqualUnmodifiableListView)
      return _availableStartingTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableStartingTimes);
  }

  final List<DateTime> _endTimesAvailable;
  @override
  List<DateTime> get endTimesAvailable {
    if (_endTimesAvailable is EqualUnmodifiableListView)
      return _endTimesAvailable;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_endTimesAvailable);
  }

  final List<SlotModel> _slots;
  @override
  List<SlotModel> get slots {
    if (_slots is EqualUnmodifiableListView) return _slots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slots);
  }

  @override
  @JsonKey()
  final bool active;
  @override
  final int? hoursAvailable;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SmartLearningBottomSheetState.initialized(availableStartingTimes: $availableStartingTimes, endTimesAvailable: $endTimesAvailable, slots: $slots, active: $active, hoursAvailable: $hoursAvailable)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'SmartLearningBottomSheetState.initialized'))
      ..add(
          DiagnosticsProperty('availableStartingTimes', availableStartingTimes))
      ..add(DiagnosticsProperty('endTimesAvailable', endTimesAvailable))
      ..add(DiagnosticsProperty('slots', slots))
      ..add(DiagnosticsProperty('active', active))
      ..add(DiagnosticsProperty('hoursAvailable', hoursAvailable));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            const DeepCollectionEquality().equals(
                other._availableStartingTimes, _availableStartingTimes) &&
            const DeepCollectionEquality()
                .equals(other._endTimesAvailable, _endTimesAvailable) &&
            const DeepCollectionEquality().equals(other._slots, _slots) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.hoursAvailable, hoursAvailable) ||
                other.hoursAvailable == hoursAvailable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_availableStartingTimes),
      const DeepCollectionEquality().hash(_endTimesAvailable),
      const DeepCollectionEquality().hash(_slots),
      active,
      hoursAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(Failure failure) error,
    required TResult Function(
            List<DateTime> availableStartingTimes,
            List<DateTime> endTimesAvailable,
            List<SlotModel> slots,
            bool active,
            int? hoursAvailable)
        initialized,
  }) {
    return initialized(availableStartingTimes, endTimesAvailable, slots, active,
        hoursAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(Failure failure)? error,
    TResult? Function(
            List<DateTime> availableStartingTimes,
            List<DateTime> endTimesAvailable,
            List<SlotModel> slots,
            bool active,
            int? hoursAvailable)?
        initialized,
  }) {
    return initialized?.call(availableStartingTimes, endTimesAvailable, slots,
        active, hoursAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(Failure failure)? error,
    TResult Function(
            List<DateTime> availableStartingTimes,
            List<DateTime> endTimesAvailable,
            List<SlotModel> slots,
            bool active,
            int? hoursAvailable)?
        initialized,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(availableStartingTimes, endTimesAvailable, slots,
          active, hoursAvailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(Initialized value) initialized,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(Initialized value)? initialized,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(Initialized value)? initialized,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class Initialized implements SmartLearningBottomSheetState {
  const factory Initialized(
      {required final List<DateTime> availableStartingTimes,
      required final List<DateTime> endTimesAvailable,
      required final List<SlotModel> slots,
      final bool active,
      final int? hoursAvailable}) = _$InitializedImpl;

  List<DateTime> get availableStartingTimes;
  List<DateTime> get endTimesAvailable;
  List<SlotModel> get slots;
  bool get active;
  int? get hoursAvailable;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
