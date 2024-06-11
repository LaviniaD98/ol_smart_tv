import 'package:open_learning_smart_tv/data/models/requests/edition_patch_body_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/edition/edition_response_model.dart';
import 'package:dartz/dartz.dart';
import '../../../data/models/failure.dart';

abstract class EditionRepository {
  Future<Either<Failure, EditionsResponseModel>> register(
      String path, List<EditionPatchBodyDto> elist);
}
