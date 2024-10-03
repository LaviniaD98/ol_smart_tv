// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_logo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppLogoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String fullImageName) logoRetrieved,
    required TResult Function() useAssetLogo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String fullImageName)? logoRetrieved,
    TResult? Function()? useAssetLogo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String fullImageName)? logoRetrieved,
    TResult Function()? useAssetLogo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LogoRetrieved value) logoRetrieved,
    required TResult Function(_UseAssetLogo value) useAssetLogo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LogoRetrieved value)? logoRetrieved,
    TResult? Function(_UseAssetLogo value)? useAssetLogo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LogoRetrieved value)? logoRetrieved,
    TResult Function(_UseAssetLogo value)? useAssetLogo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLogoStateCopyWith<$Res> {
  factory $AppLogoStateCopyWith(
          AppLogoState value, $Res Function(AppLogoState) then) =
      _$AppLogoStateCopyWithImpl<$Res, AppLogoState>;
}

/// @nodoc
class _$AppLogoStateCopyWithImpl<$Res, $Val extends AppLogoState>
    implements $AppLogoStateCopyWith<$Res> {
  _$AppLogoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppLogoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AppLogoStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppLogoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AppLogoState.loading()';
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
    required TResult Function(String fullImageName) logoRetrieved,
    required TResult Function() useAssetLogo,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String fullImageName)? logoRetrieved,
    TResult? Function()? useAssetLogo,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String fullImageName)? logoRetrieved,
    TResult Function()? useAssetLogo,
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
    required TResult Function(_LogoRetrieved value) logoRetrieved,
    required TResult Function(_UseAssetLogo value) useAssetLogo,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LogoRetrieved value)? logoRetrieved,
    TResult? Function(_UseAssetLogo value)? useAssetLogo,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LogoRetrieved value)? logoRetrieved,
    TResult Function(_UseAssetLogo value)? useAssetLogo,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AppLogoState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LogoRetrievedImplCopyWith<$Res> {
  factory _$$LogoRetrievedImplCopyWith(
          _$LogoRetrievedImpl value, $Res Function(_$LogoRetrievedImpl) then) =
      __$$LogoRetrievedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String fullImageName});
}

/// @nodoc
class __$$LogoRetrievedImplCopyWithImpl<$Res>
    extends _$AppLogoStateCopyWithImpl<$Res, _$LogoRetrievedImpl>
    implements _$$LogoRetrievedImplCopyWith<$Res> {
  __$$LogoRetrievedImplCopyWithImpl(
      _$LogoRetrievedImpl _value, $Res Function(_$LogoRetrievedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppLogoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullImageName = null,
  }) {
    return _then(_$LogoRetrievedImpl(
      fullImageName: null == fullImageName
          ? _value.fullImageName
          : fullImageName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LogoRetrievedImpl implements _LogoRetrieved {
  const _$LogoRetrievedImpl({required this.fullImageName});

  @override
  final String fullImageName;

  @override
  String toString() {
    return 'AppLogoState.logoRetrieved(fullImageName: $fullImageName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogoRetrievedImpl &&
            (identical(other.fullImageName, fullImageName) ||
                other.fullImageName == fullImageName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fullImageName);

  /// Create a copy of AppLogoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogoRetrievedImplCopyWith<_$LogoRetrievedImpl> get copyWith =>
      __$$LogoRetrievedImplCopyWithImpl<_$LogoRetrievedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String fullImageName) logoRetrieved,
    required TResult Function() useAssetLogo,
  }) {
    return logoRetrieved(fullImageName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String fullImageName)? logoRetrieved,
    TResult? Function()? useAssetLogo,
  }) {
    return logoRetrieved?.call(fullImageName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String fullImageName)? logoRetrieved,
    TResult Function()? useAssetLogo,
    required TResult orElse(),
  }) {
    if (logoRetrieved != null) {
      return logoRetrieved(fullImageName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LogoRetrieved value) logoRetrieved,
    required TResult Function(_UseAssetLogo value) useAssetLogo,
  }) {
    return logoRetrieved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LogoRetrieved value)? logoRetrieved,
    TResult? Function(_UseAssetLogo value)? useAssetLogo,
  }) {
    return logoRetrieved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LogoRetrieved value)? logoRetrieved,
    TResult Function(_UseAssetLogo value)? useAssetLogo,
    required TResult orElse(),
  }) {
    if (logoRetrieved != null) {
      return logoRetrieved(this);
    }
    return orElse();
  }
}

abstract class _LogoRetrieved implements AppLogoState {
  const factory _LogoRetrieved({required final String fullImageName}) =
      _$LogoRetrievedImpl;

  String get fullImageName;

  /// Create a copy of AppLogoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogoRetrievedImplCopyWith<_$LogoRetrievedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UseAssetLogoImplCopyWith<$Res> {
  factory _$$UseAssetLogoImplCopyWith(
          _$UseAssetLogoImpl value, $Res Function(_$UseAssetLogoImpl) then) =
      __$$UseAssetLogoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UseAssetLogoImplCopyWithImpl<$Res>
    extends _$AppLogoStateCopyWithImpl<$Res, _$UseAssetLogoImpl>
    implements _$$UseAssetLogoImplCopyWith<$Res> {
  __$$UseAssetLogoImplCopyWithImpl(
      _$UseAssetLogoImpl _value, $Res Function(_$UseAssetLogoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppLogoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UseAssetLogoImpl implements _UseAssetLogo {
  const _$UseAssetLogoImpl();

  @override
  String toString() {
    return 'AppLogoState.useAssetLogo()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UseAssetLogoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String fullImageName) logoRetrieved,
    required TResult Function() useAssetLogo,
  }) {
    return useAssetLogo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String fullImageName)? logoRetrieved,
    TResult? Function()? useAssetLogo,
  }) {
    return useAssetLogo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String fullImageName)? logoRetrieved,
    TResult Function()? useAssetLogo,
    required TResult orElse(),
  }) {
    if (useAssetLogo != null) {
      return useAssetLogo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LogoRetrieved value) logoRetrieved,
    required TResult Function(_UseAssetLogo value) useAssetLogo,
  }) {
    return useAssetLogo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LogoRetrieved value)? logoRetrieved,
    TResult? Function(_UseAssetLogo value)? useAssetLogo,
  }) {
    return useAssetLogo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LogoRetrieved value)? logoRetrieved,
    TResult Function(_UseAssetLogo value)? useAssetLogo,
    required TResult orElse(),
  }) {
    if (useAssetLogo != null) {
      return useAssetLogo(this);
    }
    return orElse();
  }
}

abstract class _UseAssetLogo implements AppLogoState {
  const factory _UseAssetLogo() = _$UseAssetLogoImpl;
}
