import 'package:open_learning_smart_tv/data/models/requests/ecm/ecm_register_request.dart';
import 'package:open_learning_smart_tv/domain/entities/ecm/ecm_disciplines_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../../domain/entities/ecm/ecm_professions_model.dart';
import '../../../domain/repositories/ecm/ecm_repository.dart';
import '../../data_sources/ecm/ecm_data_source.dart';

@LazySingleton(as: EcmRepository)
class EcmRepositoryImpl implements EcmRepository {
  final EcmDataSource _ecmDataSource;

  EcmRepositoryImpl(this._ecmDataSource);

  @override
  Future<Either<Failure, EcmProfessionsModel>> getProfessions(
      {required int page, required int pageSize}) {
    return catchFailure(() async {
      final res = await _ecmDataSource.getProfessions(page, pageSize);
      return EcmProfessionsModel.fromDto(res.output, res.metadata);
    });
  }

  @override
  Future<Either<Failure, EcmDisciplinesModel>> getDiscipline(
      {required int page,
      required int pageSize,
      required String professionIds}) {
    return catchFailure(() async {
      final res =
          await _ecmDataSource.getDiscipline(page, pageSize, professionIds);
      return EcmDisciplinesModel.fromDto(res.output, res.metadata);
    });
  }

  @override
  Future<Either<Failure, void>> register(EcmRegisterRequest request) {
    return catchFailure(() async {
      return await _ecmDataSource.register(request);
    });
  }
}
