// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_wall_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DownloadWallState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<DownloadedItemExtended>? items) success,
    required TResult Function() loading,
    required TResult Function() fetch,
    required TResult Function() error,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function() showOfflineDialog,
    required TResult Function(DateTime date) showOnlineDialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DownloadedItemExtended>? items)? success,
    TResult? Function()? loading,
    TResult? Function()? fetch,
    TResult? Function()? error,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function()? showOfflineDialog,
    TResult? Function(DateTime date)? showOnlineDialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DownloadedItemExtended>? items)? success,
    TResult Function()? loading,
    TResult Function()? fetch,
    TResult Function()? error,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function()? showOfflineDialog,
    TResult Function(DateTime date)? showOnlineDialog,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Loading value) loading,
    required TResult Function(Fetch value) fetch,
    required TResult Function(Error value) error,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(ShowOfflineDialog value) showOfflineDialog,
    required TResult Function(ShowOnlineDialog value) showOnlineDialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Loading value)? loading,
    TResult? Function(Fetch value)? fetch,
    TResult? Function(Error value)? error,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult? Function(ShowOnlineDialog value)? showOnlineDialog,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Loading value)? loading,
    TResult Function(Fetch value)? fetch,
    TResult Function(Error value)? error,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult Function(ShowOnlineDialog value)? showOnlineDialog,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadWallStateCopyWith<$Res> {
  factory $DownloadWallStateCopyWith(
          DownloadWallState value, $Res Function(DownloadWallState) then) =
      _$DownloadWallStateCopyWithImpl<$Res, DownloadWallState>;
}

/// @nodoc
class _$DownloadWallStateCopyWithImpl<$Res, $Val extends DownloadWallState>
    implements $DownloadWallStateCopyWith<$Res> {
  _$DownloadWallStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DownloadedItemExtended>? items});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$DownloadWallStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_$SuccessImpl(
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DownloadedItemExtended>?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl with DiagnosticableTreeMixin implements Success {
  const _$SuccessImpl({required final List<DownloadedItemExtended>? items})
      : _items = items;

  final List<DownloadedItemExtended>? _items;
  @override
  List<DownloadedItemExtended>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadWallState.success(items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DownloadWallState.success'))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<DownloadedItemExtended>? items) success,
    required TResult Function() loading,
    required TResult Function() fetch,
    required TResult Function() error,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function() showOfflineDialog,
    required TResult Function(DateTime date) showOnlineDialog,
  }) {
    return success(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DownloadedItemExtended>? items)? success,
    TResult? Function()? loading,
    TResult? Function()? fetch,
    TResult? Function()? error,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function()? showOfflineDialog,
    TResult? Function(DateTime date)? showOnlineDialog,
  }) {
    return success?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DownloadedItemExtended>? items)? success,
    TResult Function()? loading,
    TResult Function()? fetch,
    TResult Function()? error,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function()? showOfflineDialog,
    TResult Function(DateTime date)? showOnlineDialog,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Loading value) loading,
    required TResult Function(Fetch value) fetch,
    required TResult Function(Error value) error,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(ShowOfflineDialog value) showOfflineDialog,
    required TResult Function(ShowOnlineDialog value) showOnlineDialog,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Loading value)? loading,
    TResult? Function(Fetch value)? fetch,
    TResult? Function(Error value)? error,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult? Function(ShowOnlineDialog value)? showOnlineDialog,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Loading value)? loading,
    TResult Function(Fetch value)? fetch,
    TResult Function(Error value)? error,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult Function(ShowOnlineDialog value)? showOnlineDialog,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements DownloadWallState {
  const factory Success({required final List<DownloadedItemExtended>? items}) =
      _$SuccessImpl;

  List<DownloadedItemExtended>? get items;
  @JsonKey(ignore: true)
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
    extends _$DownloadWallStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadWallState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'DownloadWallState.loading'));
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
    required TResult Function(List<DownloadedItemExtended>? items) success,
    required TResult Function() loading,
    required TResult Function() fetch,
    required TResult Function() error,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function() showOfflineDialog,
    required TResult Function(DateTime date) showOnlineDialog,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DownloadedItemExtended>? items)? success,
    TResult? Function()? loading,
    TResult? Function()? fetch,
    TResult? Function()? error,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function()? showOfflineDialog,
    TResult? Function(DateTime date)? showOnlineDialog,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DownloadedItemExtended>? items)? success,
    TResult Function()? loading,
    TResult Function()? fetch,
    TResult Function()? error,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function()? showOfflineDialog,
    TResult Function(DateTime date)? showOnlineDialog,
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
    required TResult Function(Fetch value) fetch,
    required TResult Function(Error value) error,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(ShowOfflineDialog value) showOfflineDialog,
    required TResult Function(ShowOnlineDialog value) showOnlineDialog,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Loading value)? loading,
    TResult? Function(Fetch value)? fetch,
    TResult? Function(Error value)? error,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult? Function(ShowOnlineDialog value)? showOnlineDialog,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Loading value)? loading,
    TResult Function(Fetch value)? fetch,
    TResult Function(Error value)? error,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult Function(ShowOnlineDialog value)? showOnlineDialog,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements DownloadWallState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$DownloadWallStateCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchImpl with DiagnosticableTreeMixin implements Fetch {
  const _$FetchImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadWallState.fetch()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'DownloadWallState.fetch'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<DownloadedItemExtended>? items) success,
    required TResult Function() loading,
    required TResult Function() fetch,
    required TResult Function() error,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function() showOfflineDialog,
    required TResult Function(DateTime date) showOnlineDialog,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DownloadedItemExtended>? items)? success,
    TResult? Function()? loading,
    TResult? Function()? fetch,
    TResult? Function()? error,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function()? showOfflineDialog,
    TResult? Function(DateTime date)? showOnlineDialog,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DownloadedItemExtended>? items)? success,
    TResult Function()? loading,
    TResult Function()? fetch,
    TResult Function()? error,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function()? showOfflineDialog,
    TResult Function(DateTime date)? showOnlineDialog,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Loading value) loading,
    required TResult Function(Fetch value) fetch,
    required TResult Function(Error value) error,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(ShowOfflineDialog value) showOfflineDialog,
    required TResult Function(ShowOnlineDialog value) showOnlineDialog,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Loading value)? loading,
    TResult? Function(Fetch value)? fetch,
    TResult? Function(Error value)? error,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult? Function(ShowOnlineDialog value)? showOnlineDialog,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Loading value)? loading,
    TResult Function(Fetch value)? fetch,
    TResult Function(Error value)? error,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult Function(ShowOnlineDialog value)? showOnlineDialog,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class Fetch implements DownloadWallState {
  const factory Fetch() = _$FetchImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$DownloadWallStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements Error {
  const _$ErrorImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadWallState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'DownloadWallState.error'));
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
    required TResult Function(List<DownloadedItemExtended>? items) success,
    required TResult Function() loading,
    required TResult Function() fetch,
    required TResult Function() error,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function() showOfflineDialog,
    required TResult Function(DateTime date) showOnlineDialog,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DownloadedItemExtended>? items)? success,
    TResult? Function()? loading,
    TResult? Function()? fetch,
    TResult? Function()? error,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function()? showOfflineDialog,
    TResult? Function(DateTime date)? showOnlineDialog,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DownloadedItemExtended>? items)? success,
    TResult Function()? loading,
    TResult Function()? fetch,
    TResult Function()? error,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function()? showOfflineDialog,
    TResult Function(DateTime date)? showOnlineDialog,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Loading value) loading,
    required TResult Function(Fetch value) fetch,
    required TResult Function(Error value) error,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(ShowOfflineDialog value) showOfflineDialog,
    required TResult Function(ShowOnlineDialog value) showOnlineDialog,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Loading value)? loading,
    TResult? Function(Fetch value)? fetch,
    TResult? Function(Error value)? error,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult? Function(ShowOnlineDialog value)? showOnlineDialog,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Loading value)? loading,
    TResult Function(Fetch value)? fetch,
    TResult Function(Error value)? error,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult Function(ShowOnlineDialog value)? showOnlineDialog,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements DownloadWallState {
  const factory Error() = _$ErrorImpl;
}

/// @nodoc
abstract class _$$SyncingImplCopyWith<$Res> {
  factory _$$SyncingImplCopyWith(
          _$SyncingImpl value, $Res Function(_$SyncingImpl) then) =
      __$$SyncingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncingImplCopyWithImpl<$Res>
    extends _$DownloadWallStateCopyWithImpl<$Res, _$SyncingImpl>
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
    return 'DownloadWallState.syncing()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'DownloadWallState.syncing'));
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
    required TResult Function(List<DownloadedItemExtended>? items) success,
    required TResult Function() loading,
    required TResult Function() fetch,
    required TResult Function() error,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function() showOfflineDialog,
    required TResult Function(DateTime date) showOnlineDialog,
  }) {
    return syncing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DownloadedItemExtended>? items)? success,
    TResult? Function()? loading,
    TResult? Function()? fetch,
    TResult? Function()? error,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function()? showOfflineDialog,
    TResult? Function(DateTime date)? showOnlineDialog,
  }) {
    return syncing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DownloadedItemExtended>? items)? success,
    TResult Function()? loading,
    TResult Function()? fetch,
    TResult Function()? error,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function()? showOfflineDialog,
    TResult Function(DateTime date)? showOnlineDialog,
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
    required TResult Function(Success value) success,
    required TResult Function(Loading value) loading,
    required TResult Function(Fetch value) fetch,
    required TResult Function(Error value) error,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(ShowOfflineDialog value) showOfflineDialog,
    required TResult Function(ShowOnlineDialog value) showOnlineDialog,
  }) {
    return syncing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Loading value)? loading,
    TResult? Function(Fetch value)? fetch,
    TResult? Function(Error value)? error,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult? Function(ShowOnlineDialog value)? showOnlineDialog,
  }) {
    return syncing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Loading value)? loading,
    TResult Function(Fetch value)? fetch,
    TResult Function(Error value)? error,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult Function(ShowOnlineDialog value)? showOnlineDialog,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing(this);
    }
    return orElse();
  }
}

abstract class _Syncing implements DownloadWallState {
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
    extends _$DownloadWallStateCopyWithImpl<$Res, _$DoneImpl>
    implements _$$DoneImplCopyWith<$Res> {
  __$$DoneImplCopyWithImpl(_$DoneImpl _value, $Res Function(_$DoneImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DoneImpl with DiagnosticableTreeMixin implements _Done {
  const _$DoneImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadWallState.done()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'DownloadWallState.done'));
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
    required TResult Function(List<DownloadedItemExtended>? items) success,
    required TResult Function() loading,
    required TResult Function() fetch,
    required TResult Function() error,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function() showOfflineDialog,
    required TResult Function(DateTime date) showOnlineDialog,
  }) {
    return done();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DownloadedItemExtended>? items)? success,
    TResult? Function()? loading,
    TResult? Function()? fetch,
    TResult? Function()? error,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function()? showOfflineDialog,
    TResult? Function(DateTime date)? showOnlineDialog,
  }) {
    return done?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DownloadedItemExtended>? items)? success,
    TResult Function()? loading,
    TResult Function()? fetch,
    TResult Function()? error,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function()? showOfflineDialog,
    TResult Function(DateTime date)? showOnlineDialog,
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
    required TResult Function(Success value) success,
    required TResult Function(Loading value) loading,
    required TResult Function(Fetch value) fetch,
    required TResult Function(Error value) error,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(ShowOfflineDialog value) showOfflineDialog,
    required TResult Function(ShowOnlineDialog value) showOnlineDialog,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Loading value)? loading,
    TResult? Function(Fetch value)? fetch,
    TResult? Function(Error value)? error,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult? Function(ShowOnlineDialog value)? showOnlineDialog,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Loading value)? loading,
    TResult Function(Fetch value)? fetch,
    TResult Function(Error value)? error,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult Function(ShowOnlineDialog value)? showOnlineDialog,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class _Done implements DownloadWallState {
  const factory _Done() = _$DoneImpl;
}

/// @nodoc
abstract class _$$ShowOfflineDialogImplCopyWith<$Res> {
  factory _$$ShowOfflineDialogImplCopyWith(_$ShowOfflineDialogImpl value,
          $Res Function(_$ShowOfflineDialogImpl) then) =
      __$$ShowOfflineDialogImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowOfflineDialogImplCopyWithImpl<$Res>
    extends _$DownloadWallStateCopyWithImpl<$Res, _$ShowOfflineDialogImpl>
    implements _$$ShowOfflineDialogImplCopyWith<$Res> {
  __$$ShowOfflineDialogImplCopyWithImpl(_$ShowOfflineDialogImpl _value,
      $Res Function(_$ShowOfflineDialogImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShowOfflineDialogImpl
    with DiagnosticableTreeMixin
    implements ShowOfflineDialog {
  const _$ShowOfflineDialogImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadWallState.showOfflineDialog()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'DownloadWallState.showOfflineDialog'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowOfflineDialogImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<DownloadedItemExtended>? items) success,
    required TResult Function() loading,
    required TResult Function() fetch,
    required TResult Function() error,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function() showOfflineDialog,
    required TResult Function(DateTime date) showOnlineDialog,
  }) {
    return showOfflineDialog();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DownloadedItemExtended>? items)? success,
    TResult? Function()? loading,
    TResult? Function()? fetch,
    TResult? Function()? error,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function()? showOfflineDialog,
    TResult? Function(DateTime date)? showOnlineDialog,
  }) {
    return showOfflineDialog?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DownloadedItemExtended>? items)? success,
    TResult Function()? loading,
    TResult Function()? fetch,
    TResult Function()? error,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function()? showOfflineDialog,
    TResult Function(DateTime date)? showOnlineDialog,
    required TResult orElse(),
  }) {
    if (showOfflineDialog != null) {
      return showOfflineDialog();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Loading value) loading,
    required TResult Function(Fetch value) fetch,
    required TResult Function(Error value) error,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(ShowOfflineDialog value) showOfflineDialog,
    required TResult Function(ShowOnlineDialog value) showOnlineDialog,
  }) {
    return showOfflineDialog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Loading value)? loading,
    TResult? Function(Fetch value)? fetch,
    TResult? Function(Error value)? error,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult? Function(ShowOnlineDialog value)? showOnlineDialog,
  }) {
    return showOfflineDialog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Loading value)? loading,
    TResult Function(Fetch value)? fetch,
    TResult Function(Error value)? error,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult Function(ShowOnlineDialog value)? showOnlineDialog,
    required TResult orElse(),
  }) {
    if (showOfflineDialog != null) {
      return showOfflineDialog(this);
    }
    return orElse();
  }
}

abstract class ShowOfflineDialog implements DownloadWallState {
  const factory ShowOfflineDialog() = _$ShowOfflineDialogImpl;
}

/// @nodoc
abstract class _$$ShowOnlineDialogImplCopyWith<$Res> {
  factory _$$ShowOnlineDialogImplCopyWith(_$ShowOnlineDialogImpl value,
          $Res Function(_$ShowOnlineDialogImpl) then) =
      __$$ShowOnlineDialogImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$ShowOnlineDialogImplCopyWithImpl<$Res>
    extends _$DownloadWallStateCopyWithImpl<$Res, _$ShowOnlineDialogImpl>
    implements _$$ShowOnlineDialogImplCopyWith<$Res> {
  __$$ShowOnlineDialogImplCopyWithImpl(_$ShowOnlineDialogImpl _value,
      $Res Function(_$ShowOnlineDialogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$ShowOnlineDialogImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ShowOnlineDialogImpl
    with DiagnosticableTreeMixin
    implements ShowOnlineDialog {
  const _$ShowOnlineDialogImpl({required this.date});

  @override
  final DateTime date;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DownloadWallState.showOnlineDialog(date: $date)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DownloadWallState.showOnlineDialog'))
      ..add(DiagnosticsProperty('date', date));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowOnlineDialogImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowOnlineDialogImplCopyWith<_$ShowOnlineDialogImpl> get copyWith =>
      __$$ShowOnlineDialogImplCopyWithImpl<_$ShowOnlineDialogImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<DownloadedItemExtended>? items) success,
    required TResult Function() loading,
    required TResult Function() fetch,
    required TResult Function() error,
    required TResult Function() syncing,
    required TResult Function() done,
    required TResult Function() showOfflineDialog,
    required TResult Function(DateTime date) showOnlineDialog,
  }) {
    return showOnlineDialog(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DownloadedItemExtended>? items)? success,
    TResult? Function()? loading,
    TResult? Function()? fetch,
    TResult? Function()? error,
    TResult? Function()? syncing,
    TResult? Function()? done,
    TResult? Function()? showOfflineDialog,
    TResult? Function(DateTime date)? showOnlineDialog,
  }) {
    return showOnlineDialog?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DownloadedItemExtended>? items)? success,
    TResult Function()? loading,
    TResult Function()? fetch,
    TResult Function()? error,
    TResult Function()? syncing,
    TResult Function()? done,
    TResult Function()? showOfflineDialog,
    TResult Function(DateTime date)? showOnlineDialog,
    required TResult orElse(),
  }) {
    if (showOnlineDialog != null) {
      return showOnlineDialog(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Loading value) loading,
    required TResult Function(Fetch value) fetch,
    required TResult Function(Error value) error,
    required TResult Function(_Syncing value) syncing,
    required TResult Function(_Done value) done,
    required TResult Function(ShowOfflineDialog value) showOfflineDialog,
    required TResult Function(ShowOnlineDialog value) showOnlineDialog,
  }) {
    return showOnlineDialog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success value)? success,
    TResult? Function(Loading value)? loading,
    TResult? Function(Fetch value)? fetch,
    TResult? Function(Error value)? error,
    TResult? Function(_Syncing value)? syncing,
    TResult? Function(_Done value)? done,
    TResult? Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult? Function(ShowOnlineDialog value)? showOnlineDialog,
  }) {
    return showOnlineDialog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Loading value)? loading,
    TResult Function(Fetch value)? fetch,
    TResult Function(Error value)? error,
    TResult Function(_Syncing value)? syncing,
    TResult Function(_Done value)? done,
    TResult Function(ShowOfflineDialog value)? showOfflineDialog,
    TResult Function(ShowOnlineDialog value)? showOnlineDialog,
    required TResult orElse(),
  }) {
    if (showOnlineDialog != null) {
      return showOnlineDialog(this);
    }
    return orElse();
  }
}

abstract class ShowOnlineDialog implements DownloadWallState {
  const factory ShowOnlineDialog({required final DateTime date}) =
      _$ShowOnlineDialogImpl;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$ShowOnlineDialogImplCopyWith<_$ShowOnlineDialogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
