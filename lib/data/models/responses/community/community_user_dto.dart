import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_user_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class CommunityUserDto {
  CommunityUserDto({
    this.corporateName,
    this.surname,
    this.ownerId,
    this.name,
    this.profileImageUrl,
    this.corporateId,
  });

  factory CommunityUserDto.fromJson(Map<String, dynamic> json) => _$CommunityUserDtoFromJson(json);

  @JsonKey(name: 'corporateName')
  final String? corporateName;
  @JsonKey(name: 'surname')
  final String? surname;
  @JsonKey(name: 'owner_id')
  final String? ownerId;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'profileImageUrl')
  final String? profileImageUrl;
  @JsonKey(name: 'corporateId')
  final String? corporateId;
}