// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState {
  String? get initialRoute => throw _privateConstructorUsedError;
  List<MenuRoute>? get dynamicRoutes => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  bool? get showPopup => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? initialRoute,
            List<MenuRoute>? dynamicRoutes, DateTime? date, bool? showPopup)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? initialRoute, List<MenuRoute>? dynamicRoutes,
            DateTime? date, bool? showPopup)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? initialRoute, List<MenuRoute>? dynamicRoutes,
            DateTime? date, bool? showPopup)?
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
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {String? initialRoute,
      List<MenuRoute>? dynamicRoutes,
      DateTime? date,
      bool? showPopup});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialRoute = freezed,
    Object? dynamicRoutes = freezed,
    Object? date = freezed,
    Object? showPopup = freezed,
  }) {
    return _then(_value.copyWith(
      initialRoute: freezed == initialRoute
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      dynamicRoutes: freezed == dynamicRoutes
          ? _value.dynamicRoutes
          : dynamicRoutes // ignore: cast_nullable_to_non_nullable
              as List<MenuRoute>?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      showPopup: freezed == showPopup
          ? _value.showPopup
          : showPopup // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? initialRoute,
      List<MenuRoute>? dynamicRoutes,
      DateTime? date,
      bool? showPopup});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialRoute = freezed,
    Object? dynamicRoutes = freezed,
    Object? date = freezed,
    Object? showPopup = freezed,
  }) {
    return _then(_$InitialImpl(
      initialRoute: freezed == initialRoute
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      dynamicRoutes: freezed == dynamicRoutes
          ? _value._dynamicRoutes
          : dynamicRoutes // ignore: cast_nullable_to_non_nullable
              as List<MenuRoute>?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      showPopup: freezed == showPopup
          ? _value.showPopup
          : showPopup // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.initialRoute,
      final List<MenuRoute>? dynamicRoutes,
      this.date,
      this.showPopup})
      : _dynamicRoutes = dynamicRoutes;

  @override
  final String? initialRoute;
  final List<MenuRoute>? _dynamicRoutes;
  @override
  List<MenuRoute>? get dynamicRoutes {
    final value = _dynamicRoutes;
    if (value == null) return null;
    if (_dynamicRoutes is EqualUnmodifiableListView) return _dynamicRoutes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? date;
  @override
  final bool? showPopup;

  @override
  String toString() {
    return 'AppState.initial(initialRoute: $initialRoute, dynamicRoutes: $dynamicRoutes, date: $date, showPopup: $showPopup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.initialRoute, initialRoute) ||
                other.initialRoute == initialRoute) &&
            const DeepCollectionEquality()
                .equals(other._dynamicRoutes, _dynamicRoutes) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.showPopup, showPopup) ||
                other.showPopup == showPopup));
  }

  @override
  int get hashCode => Object.hash(runtimeType, initialRoute,
      const DeepCollectionEquality().hash(_dynamicRoutes), date, showPopup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? initialRoute,
            List<MenuRoute>? dynamicRoutes, DateTime? date, bool? showPopup)
        initial,
  }) {
    return initial(initialRoute, dynamicRoutes, date, showPopup);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? initialRoute, List<MenuRoute>? dynamicRoutes,
            DateTime? date, bool? showPopup)?
        initial,
  }) {
    return initial?.call(initialRoute, dynamicRoutes, date, showPopup);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? initialRoute, List<MenuRoute>? dynamicRoutes,
            DateTime? date, bool? showPopup)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(initialRoute, dynamicRoutes, date, showPopup);
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

abstract class _Initial implements AppState {
  const factory _Initial(
      {final String? initialRoute,
      final List<MenuRoute>? dynamicRoutes,
      final DateTime? date,
      final bool? showPopup}) = _$InitialImpl;

  @override
  String? get initialRoute;
  @override
  List<MenuRoute>? get dynamicRoutes;
  @override
  DateTime? get date;
  @override
  bool? get showPopup;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
