import 'package:open_learning_smart_tv/data/models/responses/community/community_user_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/community/initiative_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/community/los_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'enriched_information_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class EnrichedInformationDto {
  EnrichedInformationDto({
    this.los,
    this.initiatives,
    this.users,
  });

  factory EnrichedInformationDto.fromJson(Map<String, dynamic> json) =>
      _$EnrichedInformationDtoFromJson(json);

  @JsonKey(name: 'los')
  final List<LosDto>? los;
  @JsonKey(name: 'initiatives')
  final List<InitiativeDto>? initiatives;
  @JsonKey(name: 'users')
  final List<CommunityUserDto>? users;
}
