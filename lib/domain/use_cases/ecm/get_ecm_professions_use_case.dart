import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../entities/ecm/ecm_professions_model.dart';
import '../../repositories/ecm/ecm_repository.dart';

@injectable
class GetEcmProfessionsUseCase {
  final EcmRepository _ecmRepository;

  GetEcmProfessionsUseCase(
    this._ecmRepository,
  );

  Future<Either<Failure, EcmProfessionsModel>> call({
    required int page,
    required int pageSize,
  }) async {
    return await _ecmRepository.getProfessions(page: page, pageSize: pageSize);
  }
}
