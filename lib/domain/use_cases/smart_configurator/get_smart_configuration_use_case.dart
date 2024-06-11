import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../entities/smart_configurator/smart_configurator_model.dart';
import '../../repositories/smart_configurator/smart_configurator_repository.dart';

@lazySingleton
class GetSmartConfigurationUseCase {
  final SmartConfiguratorRepository _smartConfiguratorRepository;
  GetSmartConfigurationUseCase(this._smartConfiguratorRepository);

  Future<Either<Failure, SmartConfiguratorModel>> call(String? corporateId, String initiativeId){
    return _smartConfiguratorRepository.getConfigurations(corporateId, initiativeId);
  }
}