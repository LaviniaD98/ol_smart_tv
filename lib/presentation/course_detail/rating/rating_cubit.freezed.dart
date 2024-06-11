// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RatingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() Initial,
    required TResult Function(
            ObjectStatisticsDto? rating, int? maxStars, int? userRating)
        Success,
    required TResult Function() Error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? Initial,
    TResult? Function(
            ObjectStatisticsDto? rating, int? maxStars, int? userRating)?
        Success,
    TResult? Function()? Error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? Initial,
    TResult Function(
            ObjectStatisticsDto? rating, int? maxStars, int? userRating)?
        Success,
    TResult Function()? Error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) Initial,
    required TResult Function(Success value) Success,
    required TResult Function(Error value) Error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? Initial,
    TResult? Function(Success value)? Success,
    TResult? Function(Error value)? Error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? Initial,
    TResult Function(Success value)? Success,
    TResult Function(Error value)? Error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingStateCopyWith<$Res> {
  factory $RatingStateCopyWith(
          RatingState value, $Res Function(RatingState) then) =
      _$RatingStateCopyWithImpl<$Res, RatingState>;
}

/// @nodoc
class _$RatingStateCopyWithImpl<$Res, $Val extends RatingState>
    implements $RatingStateCopyWith<$Res> {
  _$RatingStateCopyWithImpl(this._value, this._then);

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
    extends _$RatingStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RatingState.Initial()';
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
    required TResult Function() Initial,
    required TResult Function(
            ObjectStatisticsDto? rating, int? maxStars, int? userRating)
        Success,
    required TResult Function() Error,
  }) {
    return Initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? Initial,
    TResult? Function(
            ObjectStatisticsDto? rating, int? maxStars, int? userRating)?
        Success,
    TResult? Function()? Error,
  }) {
    return Initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? Initial,
    TResult Function(
            ObjectStatisticsDto? rating, int? maxStars, int? userRating)?
        Success,
    TResult Function()? Error,
    required TResult orElse(),
  }) {
    if (Initial != null) {
      return Initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) Initial,
    required TResult Function(Success value) Success,
    required TResult Function(Error value) Error,
  }) {
    return Initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? Initial,
    TResult? Function(Success value)? Success,
    TResult? Function(Error value)? Error,
  }) {
    return Initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? Initial,
    TResult Function(Success value)? Success,
    TResult Function(Error value)? Error,
    required TResult orElse(),
  }) {
    if (Initial != null) {
      return Initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements RatingState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ObjectStatisticsDto? rating, int? maxStars, int? userRating});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$RatingStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? maxStars = freezed,
    Object? userRating = freezed,
  }) {
    return _then(_$SuccessImpl(
      freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as ObjectStatisticsDto?,
      freezed == maxStars
          ? _value.maxStars
          : maxStars // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == userRating
          ? _value.userRating
          : userRating // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl(this.rating, this.maxStars, this.userRating);

  @override
  final ObjectStatisticsDto? rating;
  @override
  final int? maxStars;
  @override
  final int? userRating;

  @override
  String toString() {
    return 'RatingState.Success(rating: $rating, maxStars: $maxStars, userRating: $userRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.maxStars, maxStars) ||
                other.maxStars == maxStars) &&
            (identical(other.userRating, userRating) ||
                other.userRating == userRating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rating, maxStars, userRating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() Initial,
    required TResult Function(
            ObjectStatisticsDto? rating, int? maxStars, int? userRating)
        Success,
    required TResult Function() Error,
  }) {
    return Success(rating, maxStars, userRating);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? Initial,
    TResult? Function(
            ObjectStatisticsDto? rating, int? maxStars, int? userRating)?
        Success,
    TResult? Function()? Error,
  }) {
    return Success?.call(rating, maxStars, userRating);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? Initial,
    TResult Function(
            ObjectStatisticsDto? rating, int? maxStars, int? userRating)?
        Success,
    TResult Function()? Error,
    required TResult orElse(),
  }) {
    if (Success != null) {
      return Success(rating, maxStars, userRating);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) Initial,
    required TResult Function(Success value) Success,
    required TResult Function(Error value) Error,
  }) {
    return Success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? Initial,
    TResult? Function(Success value)? Success,
    TResult? Function(Error value)? Error,
  }) {
    return Success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? Initial,
    TResult Function(Success value)? Success,
    TResult Function(Error value)? Error,
    required TResult orElse(),
  }) {
    if (Success != null) {
      return Success(this);
    }
    return orElse();
  }
}

abstract class Success implements RatingState {
  const factory Success(final ObjectStatisticsDto? rating, final int? maxStars,
      final int? userRating) = _$SuccessImpl;

  ObjectStatisticsDto? get rating;
  int? get maxStars;
  int? get userRating;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
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
    extends _$RatingStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'RatingState.Error()';
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
    required TResult Function() Initial,
    required TResult Function(
            ObjectStatisticsDto? rating, int? maxStars, int? userRating)
        Success,
    required TResult Function() Error,
  }) {
    return Error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? Initial,
    TResult? Function(
            ObjectStatisticsDto? rating, int? maxStars, int? userRating)?
        Success,
    TResult? Function()? Error,
  }) {
    return Error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? Initial,
    TResult Function(
            ObjectStatisticsDto? rating, int? maxStars, int? userRating)?
        Success,
    TResult Function()? Error,
    required TResult orElse(),
  }) {
    if (Error != null) {
      return Error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) Initial,
    required TResult Function(Success value) Success,
    required TResult Function(Error value) Error,
  }) {
    return Error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? Initial,
    TResult? Function(Success value)? Success,
    TResult? Function(Error value)? Error,
  }) {
    return Error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? Initial,
    TResult Function(Success value)? Success,
    TResult Function(Error value)? Error,
    required TResult orElse(),
  }) {
    if (Error != null) {
      return Error(this);
    }
    return orElse();
  }
}

abstract class Error implements RatingState {
  const factory Error() = _$ErrorImpl;
}
