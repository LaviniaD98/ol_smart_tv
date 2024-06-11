part of 'community_card_cubit.dart';

@freezed
class CommunityCardState with _$CommunityCardState {
  const factory CommunityCardState.loading() = _Loading;
  const factory CommunityCardState.success() = _Success;
  const factory CommunityCardState.error() = _Error;
}