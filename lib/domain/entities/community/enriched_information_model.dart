import 'package:open_learning_smart_tv/data/models/responses/community/enriched_information_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/community/initiative_model.dart';

import 'community_user_model.dart';
import 'los_model.dart';

class EnrichedInformationModel {
  EnrichedInformationModel({
    this.los,
    this.initiatives,
    this.users,
  });

  factory EnrichedInformationModel.fromDto(EnrichedInformationDto? dto) {
    return EnrichedInformationModel(
      los: dto?.los?.map((e) => LosModel.fromDto(e)).toList(),
      initiatives:
          dto?.initiatives?.map((e) => InitiativeModel.fromDto(e)).toList(),
      users: dto?.users?.map((e) => CommunityUserModel.fromDto(e)).toList(),
    );
  }

  final List<LosModel>? los;
  final List<InitiativeModel>? initiatives;
  final List<CommunityUserModel>? users;
}
