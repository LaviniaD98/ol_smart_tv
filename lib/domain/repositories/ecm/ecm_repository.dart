import 'package:open_learning_smart_tv/data/models/requests/ecm/ecm_register_request.dart';
import 'package:open_learning_smart_tv/domain/entities/ecm/ecm_professions_model.dart';
import 'package:dartz/dartz.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../entities/ecm/ecm_disciplines_model.dart';

abstract class EcmRepository {
  Future<Either<Failure, EcmProfessionsModel>> getProfessions(
      {required int page, required int pageSize});

  Future<Either<Failure, EcmDisciplinesModel>> getDiscipline({
    required int page,
    required int pageSize,
    required String professionIds,
  });

  Future<Either<Failure, void>> register(EcmRegisterRequest request);
}
