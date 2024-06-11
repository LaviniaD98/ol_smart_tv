import 'package:open_learning_smart_tv/domain/entities/color_response.dart';
import 'package:dartz/dartz.dart';

import '../../../data/models/failure.dart';
import '../../entities/language/languages_info_model.dart';
import '../../entities/smart_configurator/smart_configurator_model.dart';

abstract class SmartConfiguratorRepository {
  Future<Either<Failure, SmartConfiguratorModel>> getConfigurations(
      String? corporateId, String? initiativeId);

  Future<Either<Failure, List<ColorResponse>>> getColours(String? initiativeId);

  Future<Either<Failure, LanguagesInfoModel>> getLanguages(int corporateId);

  Future<Either<Failure, Map<String, String>>> getLabels({
    required String langCode,
    int? corporateId,
    int? initiativeId,
  });
}
