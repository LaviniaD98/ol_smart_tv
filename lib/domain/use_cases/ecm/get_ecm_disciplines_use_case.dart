import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../entities/ecm/ecm_disciplines_model.dart';
import '../../repositories/ecm/ecm_repository.dart';

@injectable
class GetEcmDisciplinesUseCase {
  final EcmRepository _ecmRepository;

  GetEcmDisciplinesUseCase(
    this._ecmRepository,
  );

  Future<Either<Failure, EcmDisciplinesModel>> call({
    required int page,
    required int pageSize,
    List<int>? professionIds,
  }) async {
    return await _ecmRepository.getDiscipline(page: page, pageSize: pageSize, professionIds: professionIds?.join(',') ?? '');
  }
}
