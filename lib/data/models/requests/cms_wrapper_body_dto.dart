import 'package:freezed_annotation/freezed_annotation.dart';

part 'cms_wrapper_body_dto.g.dart';

@JsonSerializable(createFactory: false, explicitToJson: true)
class CmsWrapperBodyDto {
  const CmsWrapperBodyDto({
    this.entityId,
    this.type,
    this.userId,
  });

  Map<String, dynamic> toJson() => _$CmsWrapperBodyDtoToJson(this);

  @JsonKey(name: "entity_id")
  final String? entityId;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "user_id")
  final int? userId;
}

@JsonSerializable(createFactory: false, explicitToJson: true)
class CmsWrapperBodyAddDto {
  const CmsWrapperBodyAddDto({
    this.body,
    this.owner_id,
  });

  Map<String, dynamic> toJson() => _$CmsWrapperBodyAddDtoToJson(this);

  @JsonKey(name: "body")
  final String? body;
  @JsonKey(name: "owner_id")
  final int? owner_id;
}