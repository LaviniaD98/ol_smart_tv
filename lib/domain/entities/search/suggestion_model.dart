
import '../../../data/models/responses/search/suggestion_dto.dart';
import '../../enums/types.dart';

class SuggestionModel {
  final int? id;
  final LearningObjectTypology learningObjectTypology;
  final String? title;
  final LearningObjectType learningObjectType;
  final String? shortDescription;
  final int? duration;
  final int? expirationDate;
  final int? availableEditions;
  final String? enrollType;

  const SuggestionModel({
    required this.id,
    required this.learningObjectType,
    required this.learningObjectTypology,
    this.title,
    this.shortDescription,
    this.duration,
    this.expirationDate,
    this.availableEditions,
    this.enrollType,
  });

  factory SuggestionModel.fromDto(SuggestionDto dto) {
    return SuggestionModel(
      id: dto.id,
      learningObjectTypology: dto.type,
      title: dto.title,
      learningObjectType: dto.learningObjectType,
      shortDescription: dto.shortDescription,
      duration: dto.duration,
      expirationDate: dto.expirationDate,
      availableEditions: dto.availableEditions,
      enrollType: dto.enrollType,
    );
  }
}
