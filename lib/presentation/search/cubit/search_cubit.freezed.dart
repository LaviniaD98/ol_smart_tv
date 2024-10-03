// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> latestResearch) initial,
    required TResult Function(List<SuggestionModel> suggestions, String search)
        suggestions,
    required TResult Function() searchPaginated,
    required TResult Function(Failure failure) error,
    required TResult Function(String? search) empty,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> latestResearch)? initial,
    TResult? Function(List<SuggestionModel> suggestions, String search)?
        suggestions,
    TResult? Function()? searchPaginated,
    TResult? Function(Failure failure)? error,
    TResult? Function(String? search)? empty,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> latestResearch)? initial,
    TResult Function(List<SuggestionModel> suggestions, String search)?
        suggestions,
    TResult Function()? searchPaginated,
    TResult Function(Failure failure)? error,
    TResult Function(String? search)? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Suggestions value) suggestions,
    required TResult Function(_SearchPaginated value) searchPaginated,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Suggestions value)? suggestions,
    TResult? Function(_SearchPaginated value)? searchPaginated,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Suggestions value)? suggestions,
    TResult Function(_SearchPaginated value)? searchPaginated,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> latestResearch});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestResearch = null,
  }) {
    return _then(_$InitialImpl(
      null == latestResearch
          ? _value._latestResearch
          : latestResearch // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(final List<String> latestResearch)
      : _latestResearch = latestResearch;

  final List<String> _latestResearch;
  @override
  List<String> get latestResearch {
    if (_latestResearch is EqualUnmodifiableListView) return _latestResearch;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latestResearch);
  }

  @override
  String toString() {
    return 'SearchState.initial(latestResearch: $latestResearch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._latestResearch, _latestResearch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_latestResearch));

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> latestResearch) initial,
    required TResult Function(List<SuggestionModel> suggestions, String search)
        suggestions,
    required TResult Function() searchPaginated,
    required TResult Function(Failure failure) error,
    required TResult Function(String? search) empty,
    required TResult Function() loading,
  }) {
    return initial(latestResearch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> latestResearch)? initial,
    TResult? Function(List<SuggestionModel> suggestions, String search)?
        suggestions,
    TResult? Function()? searchPaginated,
    TResult? Function(Failure failure)? error,
    TResult? Function(String? search)? empty,
    TResult? Function()? loading,
  }) {
    return initial?.call(latestResearch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> latestResearch)? initial,
    TResult Function(List<SuggestionModel> suggestions, String search)?
        suggestions,
    TResult Function()? searchPaginated,
    TResult Function(Failure failure)? error,
    TResult Function(String? search)? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(latestResearch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Suggestions value) suggestions,
    required TResult Function(_SearchPaginated value) searchPaginated,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Suggestions value)? suggestions,
    TResult? Function(_SearchPaginated value)? searchPaginated,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Suggestions value)? suggestions,
    TResult Function(_SearchPaginated value)? searchPaginated,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SearchState {
  const factory _Initial(final List<String> latestResearch) = _$InitialImpl;

  List<String> get latestResearch;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuggestionsImplCopyWith<$Res> {
  factory _$$SuggestionsImplCopyWith(
          _$SuggestionsImpl value, $Res Function(_$SuggestionsImpl) then) =
      __$$SuggestionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SuggestionModel> suggestions, String search});
}

/// @nodoc
class __$$SuggestionsImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SuggestionsImpl>
    implements _$$SuggestionsImplCopyWith<$Res> {
  __$$SuggestionsImplCopyWithImpl(
      _$SuggestionsImpl _value, $Res Function(_$SuggestionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestions = null,
    Object? search = null,
  }) {
    return _then(_$SuggestionsImpl(
      null == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<SuggestionModel>,
      null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuggestionsImpl implements _Suggestions {
  const _$SuggestionsImpl(final List<SuggestionModel> suggestions, this.search)
      : _suggestions = suggestions;

  final List<SuggestionModel> _suggestions;
  @override
  List<SuggestionModel> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  final String search;

  @override
  String toString() {
    return 'SearchState.suggestions(suggestions: $suggestions, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionsImpl &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_suggestions), search);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionsImplCopyWith<_$SuggestionsImpl> get copyWith =>
      __$$SuggestionsImplCopyWithImpl<_$SuggestionsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> latestResearch) initial,
    required TResult Function(List<SuggestionModel> suggestions, String search)
        suggestions,
    required TResult Function() searchPaginated,
    required TResult Function(Failure failure) error,
    required TResult Function(String? search) empty,
    required TResult Function() loading,
  }) {
    return suggestions(this.suggestions, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> latestResearch)? initial,
    TResult? Function(List<SuggestionModel> suggestions, String search)?
        suggestions,
    TResult? Function()? searchPaginated,
    TResult? Function(Failure failure)? error,
    TResult? Function(String? search)? empty,
    TResult? Function()? loading,
  }) {
    return suggestions?.call(this.suggestions, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> latestResearch)? initial,
    TResult Function(List<SuggestionModel> suggestions, String search)?
        suggestions,
    TResult Function()? searchPaginated,
    TResult Function(Failure failure)? error,
    TResult Function(String? search)? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (suggestions != null) {
      return suggestions(this.suggestions, search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Suggestions value) suggestions,
    required TResult Function(_SearchPaginated value) searchPaginated,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loading value) loading,
  }) {
    return suggestions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Suggestions value)? suggestions,
    TResult? Function(_SearchPaginated value)? searchPaginated,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loading value)? loading,
  }) {
    return suggestions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Suggestions value)? suggestions,
    TResult Function(_SearchPaginated value)? searchPaginated,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (suggestions != null) {
      return suggestions(this);
    }
    return orElse();
  }
}

abstract class _Suggestions implements SearchState {
  const factory _Suggestions(
          final List<SuggestionModel> suggestions, final String search) =
      _$SuggestionsImpl;

  List<SuggestionModel> get suggestions;
  String get search;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestionsImplCopyWith<_$SuggestionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchPaginatedImplCopyWith<$Res> {
  factory _$$SearchPaginatedImplCopyWith(_$SearchPaginatedImpl value,
          $Res Function(_$SearchPaginatedImpl) then) =
      __$$SearchPaginatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchPaginatedImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchPaginatedImpl>
    implements _$$SearchPaginatedImplCopyWith<$Res> {
  __$$SearchPaginatedImplCopyWithImpl(
      _$SearchPaginatedImpl _value, $Res Function(_$SearchPaginatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SearchPaginatedImpl implements _SearchPaginated {
  const _$SearchPaginatedImpl();

  @override
  String toString() {
    return 'SearchState.searchPaginated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchPaginatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> latestResearch) initial,
    required TResult Function(List<SuggestionModel> suggestions, String search)
        suggestions,
    required TResult Function() searchPaginated,
    required TResult Function(Failure failure) error,
    required TResult Function(String? search) empty,
    required TResult Function() loading,
  }) {
    return searchPaginated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> latestResearch)? initial,
    TResult? Function(List<SuggestionModel> suggestions, String search)?
        suggestions,
    TResult? Function()? searchPaginated,
    TResult? Function(Failure failure)? error,
    TResult? Function(String? search)? empty,
    TResult? Function()? loading,
  }) {
    return searchPaginated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> latestResearch)? initial,
    TResult Function(List<SuggestionModel> suggestions, String search)?
        suggestions,
    TResult Function()? searchPaginated,
    TResult Function(Failure failure)? error,
    TResult Function(String? search)? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (searchPaginated != null) {
      return searchPaginated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Suggestions value) suggestions,
    required TResult Function(_SearchPaginated value) searchPaginated,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loading value) loading,
  }) {
    return searchPaginated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Suggestions value)? suggestions,
    TResult? Function(_SearchPaginated value)? searchPaginated,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loading value)? loading,
  }) {
    return searchPaginated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Suggestions value)? suggestions,
    TResult Function(_SearchPaginated value)? searchPaginated,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (searchPaginated != null) {
      return searchPaginated(this);
    }
    return orElse();
  }
}

abstract class _SearchPaginated implements SearchState {
  const factory _SearchPaginated() = _$SearchPaginatedImpl;
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
    extends _$SearchStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
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

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'SearchState.error(failure: $failure)';
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

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> latestResearch) initial,
    required TResult Function(List<SuggestionModel> suggestions, String search)
        suggestions,
    required TResult Function() searchPaginated,
    required TResult Function(Failure failure) error,
    required TResult Function(String? search) empty,
    required TResult Function() loading,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> latestResearch)? initial,
    TResult? Function(List<SuggestionModel> suggestions, String search)?
        suggestions,
    TResult? Function()? searchPaginated,
    TResult? Function(Failure failure)? error,
    TResult? Function(String? search)? empty,
    TResult? Function()? loading,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> latestResearch)? initial,
    TResult Function(List<SuggestionModel> suggestions, String search)?
        suggestions,
    TResult Function()? searchPaginated,
    TResult Function(Failure failure)? error,
    TResult Function(String? search)? empty,
    TResult Function()? loading,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Suggestions value) suggestions,
    required TResult Function(_SearchPaginated value) searchPaginated,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Suggestions value)? suggestions,
    TResult? Function(_SearchPaginated value)? searchPaginated,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Suggestions value)? suggestions,
    TResult Function(_SearchPaginated value)? searchPaginated,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SearchState {
  const factory _Error(final Failure failure) = _$ErrorImpl;

  Failure get failure;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<$Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl value, $Res Function(_$EmptyImpl) then) =
      __$$EmptyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? search});
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$EmptyImpl>
    implements _$$EmptyImplCopyWith<$Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl _value, $Res Function(_$EmptyImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_$EmptyImpl(
      freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EmptyImpl implements _Empty {
  const _$EmptyImpl([this.search]);

  @override
  final String? search;

  @override
  String toString() {
    return 'SearchState.empty(search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyImpl &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyImplCopyWith<_$EmptyImpl> get copyWith =>
      __$$EmptyImplCopyWithImpl<_$EmptyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> latestResearch) initial,
    required TResult Function(List<SuggestionModel> suggestions, String search)
        suggestions,
    required TResult Function() searchPaginated,
    required TResult Function(Failure failure) error,
    required TResult Function(String? search) empty,
    required TResult Function() loading,
  }) {
    return empty(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> latestResearch)? initial,
    TResult? Function(List<SuggestionModel> suggestions, String search)?
        suggestions,
    TResult? Function()? searchPaginated,
    TResult? Function(Failure failure)? error,
    TResult? Function(String? search)? empty,
    TResult? Function()? loading,
  }) {
    return empty?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> latestResearch)? initial,
    TResult Function(List<SuggestionModel> suggestions, String search)?
        suggestions,
    TResult Function()? searchPaginated,
    TResult Function(Failure failure)? error,
    TResult Function(String? search)? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Suggestions value) suggestions,
    required TResult Function(_SearchPaginated value) searchPaginated,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loading value) loading,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Suggestions value)? suggestions,
    TResult? Function(_SearchPaginated value)? searchPaginated,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loading value)? loading,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Suggestions value)? suggestions,
    TResult Function(_SearchPaginated value)? searchPaginated,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements SearchState {
  const factory _Empty([final String? search]) = _$EmptyImpl;

  String? get search;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmptyImplCopyWith<_$EmptyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SearchState.loading()';
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
    required TResult Function(List<String> latestResearch) initial,
    required TResult Function(List<SuggestionModel> suggestions, String search)
        suggestions,
    required TResult Function() searchPaginated,
    required TResult Function(Failure failure) error,
    required TResult Function(String? search) empty,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> latestResearch)? initial,
    TResult? Function(List<SuggestionModel> suggestions, String search)?
        suggestions,
    TResult? Function()? searchPaginated,
    TResult? Function(Failure failure)? error,
    TResult? Function(String? search)? empty,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> latestResearch)? initial,
    TResult Function(List<SuggestionModel> suggestions, String search)?
        suggestions,
    TResult Function()? searchPaginated,
    TResult Function(Failure failure)? error,
    TResult Function(String? search)? empty,
    TResult Function()? loading,
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
    required TResult Function(_Suggestions value) suggestions,
    required TResult Function(_SearchPaginated value) searchPaginated,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Suggestions value)? suggestions,
    TResult? Function(_SearchPaginated value)? searchPaginated,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Suggestions value)? suggestions,
    TResult Function(_SearchPaginated value)? searchPaginated,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SearchState {
  const factory _Loading() = _$LoadingImpl;
}
