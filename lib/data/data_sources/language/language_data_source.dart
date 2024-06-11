import '../../models/responses/language/labels_dto.dart';
import '../../models/responses/language/languages_dto.dart';

abstract class LanguageDataSource {
  Future<LanguagesDto> getLanguages(int corporateId);

  Future<LabelsDto> getLabels({
    required String langCode,
    required String corporateId,
    required String initiativeId,
  });
}