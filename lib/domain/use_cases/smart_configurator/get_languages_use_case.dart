import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../entities/language/languages_info_model.dart';
import '../../repositories/smart_configurator/smart_configurator_repository.dart';

@lazySingleton
class GetLanguagesUseCase {
  final SmartConfiguratorRepository _smartConfiguratorRepository;
  GetLanguagesUseCase(this._smartConfiguratorRepository);

  Future<Either<Failure, LanguagesInfoModel>> call(int? corporateId) async {
    // return Future.value(
    //   Right(
    //     LanguagesInfoModel(
    //       enableMultilanguage: true,
    //       primaryLanguage: const LanguageModel(id: 'it', label: 'Italian', isPrimary: true),
    //       secondaryLanguage: [
    //         const LanguageModel(id: 'en', label: 'English', isPrimary: false),
    //         const LanguageModel(id: 'es', label: 'Spagnolo', isPrimary: false),
    //         const LanguageModel(id: 'fr', label: 'Francese', isPrimary: false),
    //         const LanguageModel(id: 'de', label: 'Tedesco', isPrimary: false)
    //       ],
    //     ),
    //   ),
    // );

    if (corporateId != null) {
      return await _smartConfiguratorRepository.getLanguages(corporateId);
    }
    return Future.value(const Left(Failure(error: 'Unknown Corporate')));
  }
}
