part of 'add_link_cubit.dart';

@freezed
class AddLinkState with _$AddLinkState {
  const factory AddLinkState.initial([PostLinkModel? model]) = _Initial;
  const factory AddLinkState.confirm(PostLinkModel model) = _Confirm;
}
