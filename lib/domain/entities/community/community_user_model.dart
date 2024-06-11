import 'package:open_learning_smart_tv/data/models/responses/community/community_user_dto.dart';

class CommunityUserModel {
  CommunityUserModel({
    this.corporateName,
    this.surname,
    this.ownerId,
    this.name,
    this.profileImageUrl,
    this.corporateId,
  });

  factory CommunityUserModel.fromDto(CommunityUserDto dto) {
    return CommunityUserModel(
      corporateName: dto.corporateName,
      surname: dto.surname,
      ownerId: dto.ownerId,
      name: dto.name,
      profileImageUrl: dto.profileImageUrl,
      corporateId: dto.corporateId,
    );
  }

  final String? corporateName;
  final String? surname;
  final String? ownerId;
  final String? name;
  final String? profileImageUrl;
  final String? corporateId;
}
