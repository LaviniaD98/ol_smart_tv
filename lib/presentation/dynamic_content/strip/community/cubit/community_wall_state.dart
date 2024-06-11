part of 'community_wall_cubit.dart';

@freezed
class CommunityWallState with _$CommunityWallState {
  const factory CommunityWallState.loading() = _Loading;
  const factory CommunityWallState.initialized(int userId, [EnrichedInformationModel? enrichedInformation, List<CommunityTopicModel>? topics]) = _Initialized;
  const factory CommunityWallState.error(Failure failure) = _Error;
}