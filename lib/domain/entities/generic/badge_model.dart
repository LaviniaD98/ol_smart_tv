import '../../../data/models/responses/generic/badge_dto.dart';

class BadgeModel {
  BadgeModel({
    this.id,
    this.name,
    this.description,
    this.learningObjectTitle,
    this.learningObjectId,
    this.path,
    this.expiresInMonths,
    this.templatePath,
    this.issuedOn,
    this.isEnable,
    this.type,
    this.iconURL,
  });

  factory BadgeModel.fromDto(BadgeDto? dto) {
    return BadgeModel(
      id: dto?.id,
      name: dto?.name,
      description: dto?.description,
      learningObjectTitle: dto?.learningObjectTitle,
      learningObjectId: dto?.learningObjectId,
      path: dto?.path,
      expiresInMonths: dto?.expiresInMonths,
      templatePath: dto?.templatePath,
      issuedOn: dto?.issuedOn,
      isEnable: dto?.isEnable,
      type: dto?.type,
      iconURL: dto?.iconURL,
    );
  }

  final int? id;
  final String? name;
  final String? description;
  final String? learningObjectTitle;
  final int? learningObjectId;
  final String? path;
  final int? expiresInMonths;
  final String? templatePath;
  final String? issuedOn;
  final bool? isEnable;
  final String? type;
  final String? iconURL;
}
