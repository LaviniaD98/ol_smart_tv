// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_link_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddLinkState {
  PostLinkModel? get model => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PostLinkModel? model) initial,
    required TResult Function(PostLinkModel model) confirm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PostLinkModel? model)? initial,
    TResult? Function(PostLinkModel model)? confirm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PostLinkModel? model)? initial,
    TResult Function(PostLinkModel model)? confirm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Confirm value) confirm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Confirm value)? confirm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Confirm value)? confirm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddLinkStateCopyWith<AddLinkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddLinkStateCopyWith<$Res> {
  factory $AddLinkStateCopyWith(
          AddLinkState value, $Res Function(AddLinkState) then) =
      _$AddLinkStateCopyWithImpl<$Res, AddLinkState>;
  @useResult
  $Res call({PostLinkModel model});
}

/// @nodoc
class _$AddLinkStateCopyWithImpl<$Res, $Val extends AddLinkState>
    implements $AddLinkStateCopyWith<$Res> {
  _$AddLinkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model!
          : model // ignore: cast_nullable_to_non_nullable
              as PostLinkModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $AddLinkStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PostLinkModel? model});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AddLinkStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$InitialImpl(
      freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as PostLinkModel?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl([this.model]);

  @override
  final PostLinkModel? model;

  @override
  String toString() {
    return 'AddLinkState.initial(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PostLinkModel? model) initial,
    required TResult Function(PostLinkModel model) confirm,
  }) {
    return initial(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PostLinkModel? model)? initial,
    TResult? Function(PostLinkModel model)? confirm,
  }) {
    return initial?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PostLinkModel? model)? initial,
    TResult Function(PostLinkModel model)? confirm,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Confirm value) confirm,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Confirm value)? confirm,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Confirm value)? confirm,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AddLinkState {
  const factory _Initial([final PostLinkModel? model]) = _$InitialImpl;

  @override
  PostLinkModel? get model;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmImplCopyWith<$Res>
    implements $AddLinkStateCopyWith<$Res> {
  factory _$$ConfirmImplCopyWith(
          _$ConfirmImpl value, $Res Function(_$ConfirmImpl) then) =
      __$$ConfirmImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PostLinkModel model});
}

/// @nodoc
class __$$ConfirmImplCopyWithImpl<$Res>
    extends _$AddLinkStateCopyWithImpl<$Res, _$ConfirmImpl>
    implements _$$ConfirmImplCopyWith<$Res> {
  __$$ConfirmImplCopyWithImpl(
      _$ConfirmImpl _value, $Res Function(_$ConfirmImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$ConfirmImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as PostLinkModel,
    ));
  }
}

/// @nodoc

class _$ConfirmImpl implements _Confirm {
  const _$ConfirmImpl(this.model);

  @override
  final PostLinkModel model;

  @override
  String toString() {
    return 'AddLinkState.confirm(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmImplCopyWith<_$ConfirmImpl> get copyWith =>
      __$$ConfirmImplCopyWithImpl<_$ConfirmImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PostLinkModel? model) initial,
    required TResult Function(PostLinkModel model) confirm,
  }) {
    return confirm(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PostLinkModel? model)? initial,
    TResult? Function(PostLinkModel model)? confirm,
  }) {
    return confirm?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PostLinkModel? model)? initial,
    TResult Function(PostLinkModel model)? confirm,
    required TResult orElse(),
  }) {
    if (confirm != null) {
      return confirm(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Confirm value) confirm,
  }) {
    return confirm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Confirm value)? confirm,
  }) {
    return confirm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Confirm value)? confirm,
    required TResult orElse(),
  }) {
    if (confirm != null) {
      return confirm(this);
    }
    return orElse();
  }
}

abstract class _Confirm implements AddLinkState {
  const factory _Confirm(final PostLinkModel model) = _$ConfirmImpl;

  @override
  PostLinkModel get model;
  @override
  @JsonKey(ignore: true)
  _$$ConfirmImplCopyWith<_$ConfirmImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
