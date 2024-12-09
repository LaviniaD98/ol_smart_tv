import 'package:open_learning_smart_tv/domain/entities/color_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/language/languages_info_model.dart';
import '../../../domain/entities/smart_configurator/smart_configurator_model.dart';
import '../../../domain/repositories/smart_configurator/smart_configurator_repository.dart';
import '../../data_sources/language/language_data_source.dart';
import '../../data_sources/smart_configurator/smart_configurator_data_source.dart';
import '../../models/failure.dart';

@LazySingleton(as: SmartConfiguratorRepository)
class SmartConfiguratorRepositoryImpl implements SmartConfiguratorRepository {
  final SmartConfiguratorDataSource _smartConfiguratorDataSource;
  final LanguageDataSource _languageDataSource;

  SmartConfiguratorRepositoryImpl(
      this._smartConfiguratorDataSource, this._languageDataSource);

  @override
  Future<Either<Failure, SmartConfiguratorModel>> getConfigurations(
      String? corporateId, String? initiativeId) {
    return catchFailure(() async {
      final res = await _smartConfiguratorDataSource.getConfigurations(
        corporateId: corporateId,
        initiativeId: initiativeId,
      );
      return SmartConfiguratorModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, List<ColorResponse>>> getColours(
      String? initiativeId) {
    return catchFailure(() async {
      final res = await _smartConfiguratorDataSource.getColours(
        initiativeId: initiativeId,
      );
      return res;
    });
  }

  @override
  Future<Either<Failure, Map<String, String>>> getLabels({
    required String langCode,
    int? corporateId,
    int? initiativeId,
  }) {
    return catchFailure(() async {
      final res = await _languageDataSource.getLabels(
        langCode: langCode,
        corporateId: corporateId?.toString() ?? '',
        initiativeId: initiativeId?.toString() ?? '',
      );

      //print('LANGUAGE res: ${res.translation}');

      if (res.translation?.containsKey(langCode) != true) {
        return throw Exception();
      }
      return (res.translation?[langCode] as Map<String, dynamic>).map(
          (key, value) =>
              MapEntry(key, value?.toString().replaceAll(r'\n', '\n') ?? ''));
    });
  }

  @override
  Future<Either<Failure, LanguagesInfoModel>> getLanguages(int corporateId) {
    return catchFailure(() async {
      final res = await _languageDataSource.getLanguages(corporateId);
      return LanguagesInfoModel.fromDto(res);
    });
  }
}
