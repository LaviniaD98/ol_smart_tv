// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalendarActivity {
  DateTime? get date => throw _privateConstructorUsedError;
  Object get model => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime? date, DateTime? endDate, LearningObjectModel model)
        learningObject,
    required TResult Function(DateTime? date, SmartLearningSlotsModel model)
        smartLearningObject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DateTime? date, DateTime? endDate, LearningObjectModel model)?
        learningObject,
    TResult? Function(DateTime? date, SmartLearningSlotsModel model)?
        smartLearningObject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DateTime? date, DateTime? endDate, LearningObjectModel model)?
        learningObject,
    TResult Function(DateTime? date, SmartLearningSlotsModel model)?
        smartLearningObject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ActivityLearningObject value) learningObject,
    required TResult Function(ActivitySmartLearningObject value)
        smartLearningObject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActivityLearningObject value)? learningObject,
    TResult? Function(ActivitySmartLearningObject value)? smartLearningObject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActivityLearningObject value)? learningObject,
    TResult Function(ActivitySmartLearningObject value)? smartLearningObject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarActivityCopyWith<CalendarActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarActivityCopyWith<$Res> {
  factory $CalendarActivityCopyWith(
          CalendarActivity value, $Res Function(CalendarActivity) then) =
      _$CalendarActivityCopyWithImpl<$Res, CalendarActivity>;
  @useResult
  $Res call({DateTime? date});
}

/// @nodoc
class _$CalendarActivityCopyWithImpl<$Res, $Val extends CalendarActivity>
    implements $CalendarActivityCopyWith<$Res> {
  _$CalendarActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityLearningObjectImplCopyWith<$Res>
    implements $CalendarActivityCopyWith<$Res> {
  factory _$$ActivityLearningObjectImplCopyWith(
          _$ActivityLearningObjectImpl value,
          $Res Function(_$ActivityLearningObjectImpl) then) =
      __$$ActivityLearningObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? date, DateTime? endDate, LearningObjectModel model});
}

/// @nodoc
class __$$ActivityLearningObjectImplCopyWithImpl<$Res>
    extends _$CalendarActivityCopyWithImpl<$Res, _$ActivityLearningObjectImpl>
    implements _$$ActivityLearningObjectImplCopyWith<$Res> {
  __$$ActivityLearningObjectImplCopyWithImpl(
      _$ActivityLearningObjectImpl _value,
      $Res Function(_$ActivityLearningObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? endDate = freezed,
    Object? model = null,
  }) {
    return _then(_$ActivityLearningObjectImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as LearningObjectModel,
    ));
  }
}

/// @nodoc

class _$ActivityLearningObjectImpl implements ActivityLearningObject {
  const _$ActivityLearningObjectImpl(
      {this.date, this.endDate, required this.model});

  @override
  final DateTime? date;
  @override
  final DateTime? endDate;
  @override
  final LearningObjectModel model;

  @override
  String toString() {
    return 'CalendarActivity.learningObject(date: $date, endDate: $endDate, model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityLearningObjectImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, endDate, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityLearningObjectImplCopyWith<_$ActivityLearningObjectImpl>
      get copyWith => __$$ActivityLearningObjectImplCopyWithImpl<
          _$ActivityLearningObjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime? date, DateTime? endDate, LearningObjectModel model)
        learningObject,
    required TResult Function(DateTime? date, SmartLearningSlotsModel model)
        smartLearningObject,
  }) {
    return learningObject(date, endDate, model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DateTime? date, DateTime? endDate, LearningObjectModel model)?
        learningObject,
    TResult? Function(DateTime? date, SmartLearningSlotsModel model)?
        smartLearningObject,
  }) {
    return learningObject?.call(date, endDate, model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DateTime? date, DateTime? endDate, LearningObjectModel model)?
        learningObject,
    TResult Function(DateTime? date, SmartLearningSlotsModel model)?
        smartLearningObject,
    required TResult orElse(),
  }) {
    if (learningObject != null) {
      return learningObject(date, endDate, model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ActivityLearningObject value) learningObject,
    required TResult Function(ActivitySmartLearningObject value)
        smartLearningObject,
  }) {
    return learningObject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActivityLearningObject value)? learningObject,
    TResult? Function(ActivitySmartLearningObject value)? smartLearningObject,
  }) {
    return learningObject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActivityLearningObject value)? learningObject,
    TResult Function(ActivitySmartLearningObject value)? smartLearningObject,
    required TResult orElse(),
  }) {
    if (learningObject != null) {
      return learningObject(this);
    }
    return orElse();
  }
}

abstract class ActivityLearningObject implements CalendarActivity {
  const factory ActivityLearningObject(
      {final DateTime? date,
      final DateTime? endDate,
      required final LearningObjectModel model}) = _$ActivityLearningObjectImpl;

  @override
  DateTime? get date;
  DateTime? get endDate;
  @override
  LearningObjectModel get model;
  @override
  @JsonKey(ignore: true)
  _$$ActivityLearningObjectImplCopyWith<_$ActivityLearningObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActivitySmartLearningObjectImplCopyWith<$Res>
    implements $CalendarActivityCopyWith<$Res> {
  factory _$$ActivitySmartLearningObjectImplCopyWith(
          _$ActivitySmartLearningObjectImpl value,
          $Res Function(_$ActivitySmartLearningObjectImpl) then) =
      __$$ActivitySmartLearningObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? date, SmartLearningSlotsModel model});
}

/// @nodoc
class __$$ActivitySmartLearningObjectImplCopyWithImpl<$Res>
    extends _$CalendarActivityCopyWithImpl<$Res,
        _$ActivitySmartLearningObjectImpl>
    implements _$$ActivitySmartLearningObjectImplCopyWith<$Res> {
  __$$ActivitySmartLearningObjectImplCopyWithImpl(
      _$ActivitySmartLearningObjectImpl _value,
      $Res Function(_$ActivitySmartLearningObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? model = null,
  }) {
    return _then(_$ActivitySmartLearningObjectImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as SmartLearningSlotsModel,
    ));
  }
}

/// @nodoc

class _$ActivitySmartLearningObjectImpl implements ActivitySmartLearningObject {
  const _$ActivitySmartLearningObjectImpl({this.date, required this.model});

  @override
  final DateTime? date;
  @override
  final SmartLearningSlotsModel model;

  @override
  String toString() {
    return 'CalendarActivity.smartLearningObject(date: $date, model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivitySmartLearningObjectImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivitySmartLearningObjectImplCopyWith<_$ActivitySmartLearningObjectImpl>
      get copyWith => __$$ActivitySmartLearningObjectImplCopyWithImpl<
          _$ActivitySmartLearningObjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime? date, DateTime? endDate, LearningObjectModel model)
        learningObject,
    required TResult Function(DateTime? date, SmartLearningSlotsModel model)
        smartLearningObject,
  }) {
    return smartLearningObject(date, model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DateTime? date, DateTime? endDate, LearningObjectModel model)?
        learningObject,
    TResult? Function(DateTime? date, SmartLearningSlotsModel model)?
        smartLearningObject,
  }) {
    return smartLearningObject?.call(date, model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DateTime? date, DateTime? endDate, LearningObjectModel model)?
        learningObject,
    TResult Function(DateTime? date, SmartLearningSlotsModel model)?
        smartLearningObject,
    required TResult orElse(),
  }) {
    if (smartLearningObject != null) {
      return smartLearningObject(date, model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ActivityLearningObject value) learningObject,
    required TResult Function(ActivitySmartLearningObject value)
        smartLearningObject,
  }) {
    return smartLearningObject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ActivityLearningObject value)? learningObject,
    TResult? Function(ActivitySmartLearningObject value)? smartLearningObject,
  }) {
    return smartLearningObject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ActivityLearningObject value)? learningObject,
    TResult Function(ActivitySmartLearningObject value)? smartLearningObject,
    required TResult orElse(),
  }) {
    if (smartLearningObject != null) {
      return smartLearningObject(this);
    }
    return orElse();
  }
}

abstract class ActivitySmartLearningObject implements CalendarActivity {
  const factory ActivitySmartLearningObject(
          {final DateTime? date,
          required final SmartLearningSlotsModel model}) =
      _$ActivitySmartLearningObjectImpl;

  @override
  DateTime? get date;
  @override
  SmartLearningSlotsModel get model;
  @override
  @JsonKey(ignore: true)
  _$$ActivitySmartLearningObjectImplCopyWith<_$ActivitySmartLearningObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}
