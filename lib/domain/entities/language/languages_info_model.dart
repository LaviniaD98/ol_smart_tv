import 'package:open_learning_smart_tv/data/models/responses/language/languages_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/language/language_model.dart';

class LanguagesInfoModel {
  LanguagesInfoModel({
    this.id,
    required this.enableMultilanguage,
    required this.primaryLanguage,
    required this.secondaryLanguage,
  });

  final String? id;
  final bool enableMultilanguage;
  final LanguageModel primaryLanguage;
  final List<LanguageModel> secondaryLanguage;

  factory LanguagesInfoModel.fromDto(LanguagesDto dto) {
    return LanguagesInfoModel(
      id: dto.id,
      enableMultilanguage: dto.enableMultilanguage,
      primaryLanguage: LanguageModel.fromDto(dto.primaryLanguage, true),
      secondaryLanguage:
          dto.secondaryLanguages.map((e) => LanguageModel.fromDto(e)).toList(),
    );
  }
}
