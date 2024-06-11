// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CommunityDataModel post, UserModel storedUser,
            PostDetailPageArgs args, bool canEdit, String? imageUrl)
        done,
    required TResult Function() error,
    required TResult Function(PostDetailAction action) action,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CommunityDataModel post, UserModel storedUser,
            PostDetailPageArgs args, bool canEdit, String? imageUrl)?
        done,
    TResult? Function()? error,
    TResult? Function(PostDetailAction action)? action,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CommunityDataModel post, UserModel storedUser,
            PostDetailPageArgs args, bool canEdit, String? imageUrl)?
        done,
    TResult Function()? error,
    TResult Function(PostDetailAction action)? action,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Done value) done,
    required TResult Function(_Error value) error,
    required TResult Function(_Action value) action,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Done value)? done,
    TResult? Function(_Error value)? error,
    TResult? Function(_Action value)? action,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Done value)? done,
    TResult Function(_Error value)? error,
    TResult Function(_Action value)? action,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDetailStateCopyWith<$Res> {
  factory $PostDetailStateCopyWith(
          PostDetailState value, $Res Function(PostDetailState) then) =
      _$PostDetailStateCopyWithImpl<$Res, PostDetailState>;
}

/// @nodoc
class _$PostDetailStateCopyWithImpl<$Res, $Val extends PostDetailState>
    implements $PostDetailStateCopyWith<$Res> {
  _$PostDetailStateCopyWithImpl(this._value, this._then);

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
    extends _$PostDetailStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PostDetailState.loading()';
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
    required TResult Function(CommunityDataModel post, UserModel storedUser,
            PostDetailPageArgs args, bool canEdit, String? imageUrl)
        done,
    required TResult Function() error,
    required TResult Function(PostDetailAction action) action,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CommunityDataModel post, UserModel storedUser,
            PostDetailPageArgs args, bool canEdit, String? imageUrl)?
        done,
    TResult? Function()? error,
    TResult? Function(PostDetailAction action)? action,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CommunityDataModel post, UserModel storedUser,
            PostDetailPageArgs args, bool canEdit, String? imageUrl)?
        done,
    TResult Function()? error,
    TResult Function(PostDetailAction action)? action,
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
    required TResult Function(_Done value) done,
    required TResult Function(_Error value) error,
    required TResult Function(_Action value) action,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Done value)? done,
    TResult? Function(_Error value)? error,
    TResult? Function(_Action value)? action,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Done value)? done,
    TResult Function(_Error value)? error,
    TResult Function(_Action value)? action,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PostDetailState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$DoneImplCopyWith<$Res> {
  factory _$$DoneImplCopyWith(
          _$DoneImpl value, $Res Function(_$DoneImpl) then) =
      __$$DoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CommunityDataModel post,
      UserModel storedUser,
      PostDetailPageArgs args,
      bool canEdit,
      String? imageUrl});
}

/// @nodoc
class __$$DoneImplCopyWithImpl<$Res>
    extends _$PostDetailStateCopyWithImpl<$Res, _$DoneImpl>
    implements _$$DoneImplCopyWith<$Res> {
  __$$DoneImplCopyWithImpl(_$DoneImpl _value, $Res Function(_$DoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
    Object? storedUser = null,
    Object? args = null,
    Object? canEdit = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$DoneImpl(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as CommunityDataModel,
      storedUser: null == storedUser
          ? _value.storedUser
          : storedUser // ignore: cast_nullable_to_non_nullable
              as UserModel,
      args: null == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as PostDetailPageArgs,
      canEdit: null == canEdit
          ? _value.canEdit
          : canEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DoneImpl implements _Done {
  const _$DoneImpl(
      {required this.post,
      required this.storedUser,
      required this.args,
      this.canEdit = false,
      this.imageUrl});

  @override
  final CommunityDataModel post;
  @override
  final UserModel storedUser;
  @override
  final PostDetailPageArgs args;
  @override
  @JsonKey()
  final bool canEdit;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'PostDetailState.done(post: $post, storedUser: $storedUser, args: $args, canEdit: $canEdit, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoneImpl &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.storedUser, storedUser) ||
                other.storedUser == storedUser) &&
            (identical(other.args, args) || other.args == args) &&
            (identical(other.canEdit, canEdit) || other.canEdit == canEdit) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, post, storedUser, args, canEdit, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoneImplCopyWith<_$DoneImpl> get copyWith =>
      __$$DoneImplCopyWithImpl<_$DoneImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CommunityDataModel post, UserModel storedUser,
            PostDetailPageArgs args, bool canEdit, String? imageUrl)
        done,
    required TResult Function() error,
    required TResult Function(PostDetailAction action) action,
  }) {
    return done(post, storedUser, args, canEdit, imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CommunityDataModel post, UserModel storedUser,
            PostDetailPageArgs args, bool canEdit, String? imageUrl)?
        done,
    TResult? Function()? error,
    TResult? Function(PostDetailAction action)? action,
  }) {
    return done?.call(post, storedUser, args, canEdit, imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CommunityDataModel post, UserModel storedUser,
            PostDetailPageArgs args, bool canEdit, String? imageUrl)?
        done,
    TResult Function()? error,
    TResult Function(PostDetailAction action)? action,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(post, storedUser, args, canEdit, imageUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Done value) done,
    required TResult Function(_Error value) error,
    required TResult Function(_Action value) action,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Done value)? done,
    TResult? Function(_Error value)? error,
    TResult? Function(_Action value)? action,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Done value)? done,
    TResult Function(_Error value)? error,
    TResult Function(_Action value)? action,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class _Done implements PostDetailState {
  const factory _Done(
      {required final CommunityDataModel post,
      required final UserModel storedUser,
      required final PostDetailPageArgs args,
      final bool canEdit,
      final String? imageUrl}) = _$DoneImpl;

  CommunityDataModel get post;
  UserModel get storedUser;
  PostDetailPageArgs get args;
  bool get canEdit;
  String? get imageUrl;
  @JsonKey(ignore: true)
  _$$DoneImplCopyWith<_$DoneImpl> get copyWith =>
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
    extends _$PostDetailStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'PostDetailState.error()';
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
    required TResult Function() loading,
    required TResult Function(CommunityDataModel post, UserModel storedUser,
            PostDetailPageArgs args, bool canEdit, String? imageUrl)
        done,
    required TResult Function() error,
    required TResult Function(PostDetailAction action) action,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CommunityDataModel post, UserModel storedUser,
            PostDetailPageArgs args, bool canEdit, String? imageUrl)?
        done,
    TResult? Function()? error,
    TResult? Function(PostDetailAction action)? action,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CommunityDataModel post, UserModel storedUser,
            PostDetailPageArgs args, bool canEdit, String? imageUrl)?
        done,
    TResult Function()? error,
    TResult Function(PostDetailAction action)? action,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Done value) done,
    required TResult Function(_Error value) error,
    required TResult Function(_Action value) action,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Done value)? done,
    TResult? Function(_Error value)? error,
    TResult? Function(_Action value)? action,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Done value)? done,
    TResult Function(_Error value)? error,
    TResult Function(_Action value)? action,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PostDetailState {
  const factory _Error() = _$ErrorImpl;
}

/// @nodoc
abstract class _$$ActionImplCopyWith<$Res> {
  factory _$$ActionImplCopyWith(
          _$ActionImpl value, $Res Function(_$ActionImpl) then) =
      __$$ActionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PostDetailAction action});
}

/// @nodoc
class __$$ActionImplCopyWithImpl<$Res>
    extends _$PostDetailStateCopyWithImpl<$Res, _$ActionImpl>
    implements _$$ActionImplCopyWith<$Res> {
  __$$ActionImplCopyWithImpl(
      _$ActionImpl _value, $Res Function(_$ActionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_$ActionImpl(
      null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as PostDetailAction,
    ));
  }
}

/// @nodoc

class _$ActionImpl implements _Action {
  const _$ActionImpl(this.action);

  @override
  final PostDetailAction action;

  @override
  String toString() {
    return 'PostDetailState.action(action: $action)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionImpl &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionImplCopyWith<_$ActionImpl> get copyWith =>
      __$$ActionImplCopyWithImpl<_$ActionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CommunityDataModel post, UserModel storedUser,
            PostDetailPageArgs args, bool canEdit, String? imageUrl)
        done,
    required TResult Function() error,
    required TResult Function(PostDetailAction action) action,
  }) {
    return action(this.action);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CommunityDataModel post, UserModel storedUser,
            PostDetailPageArgs args, bool canEdit, String? imageUrl)?
        done,
    TResult? Function()? error,
    TResult? Function(PostDetailAction action)? action,
  }) {
    return action?.call(this.action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CommunityDataModel post, UserModel storedUser,
            PostDetailPageArgs args, bool canEdit, String? imageUrl)?
        done,
    TResult Function()? error,
    TResult Function(PostDetailAction action)? action,
    required TResult orElse(),
  }) {
    if (action != null) {
      return action(this.action);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Done value) done,
    required TResult Function(_Error value) error,
    required TResult Function(_Action value) action,
  }) {
    return action(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Done value)? done,
    TResult? Function(_Error value)? error,
    TResult? Function(_Action value)? action,
  }) {
    return action?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Done value)? done,
    TResult Function(_Error value)? error,
    TResult Function(_Action value)? action,
    required TResult orElse(),
  }) {
    if (action != null) {
      return action(this);
    }
    return orElse();
  }
}

abstract class _Action implements PostDetailState {
  const factory _Action(final PostDetailAction action) = _$ActionImpl;

  PostDetailAction get action;
  @JsonKey(ignore: true)
  _$$ActionImplCopyWith<_$ActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
