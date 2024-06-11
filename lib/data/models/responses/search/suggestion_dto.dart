import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/enums/types.dart';

part 'suggestion_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class SuggestionDto {
  SuggestionDto(
    this.id,
    this.type,
    this.title,
    this.learningObjectType,
    this.shortDescription,
    this.duration,
    this.expirationDate,
    this.availableEditions,
    this.enrollType,
  );

  factory SuggestionDto.fromJson(Map<String, dynamic> json) => _$SuggestionDtoFromJson(json);

  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(unknownEnumValue: LearningObjectType.unknown)
  final LearningObjectType learningObjectType;
  @JsonKey(name: "type", unknownEnumValue: LearningObjectTypology.unknown)
  final LearningObjectTypology type;
  @JsonKey(name: "shortDescription")
  final String? shortDescription;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "expirationDate")
  final int? expirationDate;
  @JsonKey(name: "availableEditions")
  final int? availableEditions;
  @JsonKey(name: "enrollType")
  final String? enrollType;
}
