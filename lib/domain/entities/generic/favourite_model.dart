import 'package:open_learning_smart_tv/data/models/responses/generic/favourite_dto.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';

class FavouriteModel {
  FavouriteModel({
    this.corporateId,
    this.domainId,
    this.learnerId,
    this.learningObjectId,
    this.parentId,
    this.grandParentId,
    this.learningObjectType,
    this.dateOfAdditionToFavourites,
  });

  factory FavouriteModel.fromDto(FavouriteDto dto) {
    return FavouriteModel(
      corporateId: dto.corporateId,
      domainId: dto.domainId,
      learnerId: dto.learnerId,
      learningObjectId: dto.learningObjectId,
      parentId: dto.parentId,
      grandParentId: dto.grandParentId,
      learningObjectType: dto.learningObjectType,
    );
  }

  final int? corporateId;
  final int? domainId;
  final int? learnerId;
  final int? learningObjectId;
  final int? parentId;
  final int? grandParentId;
  final LearningObjectType? learningObjectType;
  final String? dateOfAdditionToFavourites;
}
