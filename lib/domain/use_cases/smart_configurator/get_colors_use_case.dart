import 'package:open_learning_smart_tv/domain/entities/color_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../repositories/smart_configurator/smart_configurator_repository.dart';

@lazySingleton
class GetColorsUseCase {
  final SmartConfiguratorRepository _smartConfiguratorRepository;
  GetColorsUseCase(this._smartConfiguratorRepository);

  Future<Either<Failure, List<ColorResponse>>> call(String initiativeId) {
    return _smartConfiguratorRepository.getColours(initiativeId);
  }
}
