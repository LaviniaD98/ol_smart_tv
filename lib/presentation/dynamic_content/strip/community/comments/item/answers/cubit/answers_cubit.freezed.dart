// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answers_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnswersState {
  List<CommentModel> get answers => throw _privateConstructorUsedError;
  bool get showMore => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CommentModel> answers, bool showMore, bool error, bool loading)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CommentModel> answers, bool showMore, bool error,
            bool loading)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CommentModel> answers, bool showMore, bool error,
            bool loading)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnswersStateCopyWith<AnswersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswersStateCopyWith<$Res> {
  factory $AnswersStateCopyWith(
          AnswersState value, $Res Function(AnswersState) then) =
      _$AnswersStateCopyWithImpl<$Res, AnswersState>;
  @useResult
  $Res call(
      {List<CommentModel> answers, bool showMore, bool error, bool loading});
}

/// @nodoc
class _$AnswersStateCopyWithImpl<$Res, $Val extends AnswersState>
    implements $AnswersStateCopyWith<$Res> {
  _$AnswersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answers = null,
    Object? showMore = null,
    Object? error = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
      showMore: null == showMore
          ? _value.showMore
          : showMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AnswersStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CommentModel> answers, bool showMore, bool error, bool loading});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AnswersStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answers = null,
    Object? showMore = null,
    Object? error = null,
    Object? loading = null,
  }) {
    return _then(_$InitialImpl(
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
      showMore: null == showMore
          ? _value.showMore
          : showMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<CommentModel> answers = const [],
      this.showMore = false,
      this.error = false,
      this.loading = false})
      : _answers = answers;

  final List<CommentModel> _answers;
  @override
  @JsonKey()
  List<CommentModel> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  @JsonKey()
  final bool showMore;
  @override
  @JsonKey()
  final bool error;
  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'AnswersState.initial(answers: $answers, showMore: $showMore, error: $error, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.showMore, showMore) ||
                other.showMore == showMore) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_answers), showMore, error, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CommentModel> answers, bool showMore, bool error, bool loading)
        initial,
  }) {
    return initial(answers, showMore, error, loading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CommentModel> answers, bool showMore, bool error,
            bool loading)?
        initial,
  }) {
    return initial?.call(answers, showMore, error, loading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CommentModel> answers, bool showMore, bool error,
            bool loading)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(answers, showMore, error, loading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AnswersState {
  const factory _Initial(
      {final List<CommentModel> answers,
      final bool showMore,
      final bool error,
      final bool loading}) = _$InitialImpl;

  @override
  List<CommentModel> get answers;
  @override
  bool get showMore;
  @override
  bool get error;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
