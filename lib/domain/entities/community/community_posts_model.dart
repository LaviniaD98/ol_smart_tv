import 'package:open_learning_smart_tv/data/models/responses/community/community_posts_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/community/los_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/community/community_user_model.dart';
import 'package:open_learning_smart_tv/domain/entities/community/los_model.dart';

import '../../../data/models/responses/community/community_user_dto.dart';
import 'community_data_model.dart';
import 'community_pager_model.dart';
import 'community_topic_model.dart';
import 'enriched_information_model.dart';
import 'extended_information_model.dart';

class CommunityPostsModel {
  CommunityPostsModel({
    this.enrichedInformation,
    this.extendedInformation,
    required this.data,
    this.pager,
    this.topic,
    this.countDataObj,
  });

  factory CommunityPostsModel.fromDto(CommunityPostsDto dto) {
    return CommunityPostsModel(
      enrichedInformation:
          EnrichedInformationModel.fromDto(dto.enrichedInformation),
      extendedInformation:
          ExtendedInformationModel.fromDto(dto.extendedInformation),
      data: dto.data
              ?.map((e) => CommunityDataModel.fromDto(
                    e,
                    LosModel.fromDto(dto.enrichedInformation?.los?.firstWhere(
                            (lo) => (e.loId == lo.loId),
                            orElse: () => LosDto()) ??
                        LosDto()),
                    CommunityUserModel.fromDto(dto.enrichedInformation?.users
                            ?.firstWhere((user) => (e.ownerId == user.ownerId),
                                orElse: () => CommunityUserDto()) ??
                        CommunityUserDto()),
                  ))
              .toList() ??
          [],
      pager: CommunityPagerModel.fromDto(dto.pager),
      topic: dto.topic?.map((e) => CommunityTopicModel.fromDto(e)).toList(),
      countDataObj: dto.countDataObj,
    );
  }

  final EnrichedInformationModel? enrichedInformation;
  final ExtendedInformationModel? extendedInformation;
  final List<CommunityDataModel> data;
  final CommunityPagerModel? pager;
  final List<CommunityTopicModel>? topic;
  final double? countDataObj;
}
