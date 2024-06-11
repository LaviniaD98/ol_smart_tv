import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edition_patch_body_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class EditionPatchBodyDto extends Equatable {
  const EditionPatchBodyDto(this.corporateId, this.domainId, this.editionId, this.mandatory, this.objectId, this.userId);

  Map<String, dynamic> toJson() => _$EditionPatchBodyDtoToJson(this);

  @JsonKey(name: 'corporateId')
  final int corporateId;

  @JsonKey(name: 'domainId')
  final int domainId;

  @JsonKey(name: 'editionId')
  final int editionId;

  @JsonKey(name: 'mandatory')
  final bool mandatory;

  @JsonKey(name: 'objectId')
  final int objectId;

  @JsonKey(name: 'userId')
  final int userId;

  factory EditionPatchBodyDto.fromPredefinedConfig({
    required int corporateId, required int domainId, required int editionId, required bool mandatory, required int objectId, required int userId}) {
    return EditionPatchBodyDto(corporateId, domainId, editionId, mandatory, objectId, userId);
  }

  @override
  List<Object?> get props => [
    corporateId,
    domainId,
    editionId,
    mandatory,
    objectId,
    userId
  ];
}
