// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_content_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExploreContentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String path,
            PageModel page,
            SmartConfiguratorModel? smartConfig,
            StripRow? exploreCarousel,
            List<StripRow>? strips,
            List<String>? filters)
        success,
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String path,
            PageModel page,
            SmartConfiguratorModel? smartConfig,
            StripRow? exploreCarousel,
            List<StripRow>? strips,
            List<String>? filters)?
        success,
    TResult? Function()? loading,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String path,
            PageModel page,
            SmartConfiguratorModel? smartConfig,
            StripRow? exploreCarousel,
            List<StripRow>? strips,
            List<String>? filters)?
        success,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExploreContentStateCopyWith<$Res> {
  factory $ExploreContentStateCopyWith(
          ExploreContentState value, $Res Function(ExploreContentState) then) =
      _$ExploreContentStateCopyWithImpl<$Res, ExploreContentState>;
}

/// @nodoc
class _$ExploreContentStateCopyWithImpl<$Res, $Val extends ExploreContentState>
    implements $ExploreContentStateCopyWith<$Res> {
  _$ExploreContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExploreContentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String path,
      PageModel page,
      SmartConfiguratorModel? smartConfig,
      StripRow? exploreCarousel,
      List<StripRow>? strips,
      List<String>? filters});

  $StripRowCopyWith<$Res>? get exploreCarousel;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ExploreContentStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExploreContentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? page = null,
    Object? smartConfig = freezed,
    Object? exploreCarousel = freezed,
    Object? strips = freezed,
    Object? filters = freezed,
  }) {
    return _then(_$SuccessImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as PageModel,
      smartConfig: freezed == smartConfig
          ? _value.smartConfig
          : smartConfig // ignore: cast_nullable_to_non_nullable
              as SmartConfiguratorModel?,
      exploreCarousel: freezed == exploreCarousel
          ? _value.exploreCarousel
          : exploreCarousel // ignore: cast_nullable_to_non_nullable
              as StripRow?,
      strips: freezed == strips
          ? _value._strips
          : strips // ignore: cast_nullable_to_non_nullable
              as List<StripRow>?,
      filters: freezed == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }

  /// Create a copy of ExploreContentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StripRowCopyWith<$Res>? get exploreCarousel {
    if (_value.exploreCarousel == null) {
      return null;
    }

    return $StripRowCopyWith<$Res>(_value.exploreCarousel!, (value) {
      return _then(_value.copyWith(exploreCarousel: value));
    });
  }
}

/// @nodoc

class _$SuccessImpl with DiagnosticableTreeMixin implements Success {
  const _$SuccessImpl(
      {required this.path,
      required this.page,
      required this.smartConfig,
      this.exploreCarousel,
      final List<StripRow>? strips,
      final List<String>? filters})
      : _strips = strips,
        _filters = filters;

  @override
  final String path;
  @override
  final PageModel page;
  @override
  final SmartConfiguratorModel? smartConfig;
  @override
  final StripRow? exploreCarousel;
  final List<StripRow>? _strips;
  @override
  List<StripRow>? get strips {
    final value = _strips;
    if (value == null) return null;
    if (_strips is EqualUnmodifiableListView) return _strips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _filters;
  @override
  List<String>? get filters {
    final value = _filters;
    if (value == null) return null;
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExploreContentState.success(path: $path, page: $page, smartConfig: $smartConfig, exploreCarousel: $exploreCarousel, strips: $strips, filters: $filters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExploreContentState.success'))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('smartConfig', smartConfig))
      ..add(DiagnosticsProperty('exploreCarousel', exploreCarousel))
      ..add(DiagnosticsProperty('strips', strips))
      ..add(DiagnosticsProperty('filters', filters));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.smartConfig, smartConfig) ||
                other.smartConfig == smartConfig) &&
            (identical(other.exploreCarousel, exploreCarousel) ||
                other.exploreCarousel == exploreCarousel) &&
            const DeepCollectionEquality().equals(other._strips, _strips) &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      path,
      page,
      smartConfig,
      exploreCarousel,
      const DeepCollectionEquality().hash(_strips),
      const DeepCollectionEquality().hash(_filters));

  /// Create a copy of ExploreContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String path,
            PageModel page,
            SmartConfiguratorModel? smartConfig,
            StripRow? exploreCarousel,
            List<StripRow>? strips,
            List<String>? filters)
        success,
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
  }) {
    return success(path, page, smartConfig, exploreCarousel, strips, filters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String path,
            PageModel page,
            SmartConfiguratorModel? smartConfig,
            StripRow? exploreCarousel,
            List<StripRow>? strips,
            List<String>? filters)?
        success,
    TResult? Function()? loading,
    TResult? Function(Failure failure)? error,
  }) {
    return success?.call(
        path, page, smartConfig, exploreCarousel, strips, filters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String path,
            PageModel page,
            SmartConfiguratorModel? smartConfig,
            StripRow? exploreCarousel,
            List<StripRow>? strips,
            List<String>? filters)?
        success,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(path, page, smartConfig, exploreCarousel, strips, filters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements ExploreContentState {
  const factory Success(
      {required final String path,
      required final PageModel page,
      required final SmartConfiguratorModel? smartConfig,
      final StripRow? exploreCarousel,
      final List<StripRow>? strips,
      final List<String>? filters}) = _$SuccessImpl;

  String get path;
  PageModel get page;
  SmartConfiguratorModel? get smartConfig;
  StripRow? get exploreCarousel;
  List<StripRow>? get strips;
  List<String>? get filters;

  /// Create a copy of ExploreContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
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
    extends _$ExploreContentStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExploreContentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExploreContentState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ExploreContentState.loading'));
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
    required TResult Function(
            String path,
            PageModel page,
            SmartConfiguratorModel? smartConfig,
            StripRow? exploreCarousel,
            List<StripRow>? strips,
            List<String>? filters)
        success,
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String path,
            PageModel page,
            SmartConfiguratorModel? smartConfig,
            StripRow? exploreCarousel,
            List<StripRow>? strips,
            List<String>? filters)?
        success,
    TResult? Function()? loading,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String path,
            PageModel page,
            SmartConfiguratorModel? smartConfig,
            StripRow? exploreCarousel,
            List<StripRow>? strips,
            List<String>? filters)?
        success,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
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
    required TResult Function(Success value) success,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ExploreContentState {
  const factory Loading() = _$LoadingImpl;
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
    extends _$ExploreContentStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExploreContentState
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

class _$ErrorImpl with DiagnosticableTreeMixin implements Error {
  const _$ErrorImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExploreContentState.error(failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExploreContentState.error'))
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

  /// Create a copy of ExploreContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String path,
            PageModel page,
            SmartConfiguratorModel? smartConfig,
            StripRow? exploreCarousel,
            List<StripRow>? strips,
            List<String>? filters)
        success,
    required TResult Function() loading,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String path,
            PageModel page,
            SmartConfiguratorModel? smartConfig,
            StripRow? exploreCarousel,
            List<StripRow>? strips,
            List<String>? filters)?
        success,
    TResult? Function()? loading,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String path,
            PageModel page,
            SmartConfiguratorModel? smartConfig,
            StripRow? exploreCarousel,
            List<StripRow>? strips,
            List<String>? filters)?
        success,
    TResult Function()? loading,
    TResult Function(Failure failure)? error,
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
    required TResult Function(Success value) success,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Loading value)? loading,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ExploreContentState {
  const factory Error(final Failure failure) = _$ErrorImpl;

  Failure get failure;

  /// Create a copy of ExploreContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
