import 'package:open_learning_smart_tv/data/data_sources/edition/edition_data_source.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/data/models/requests/edition_patch_body_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/edition/edition_response_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/edition/edition_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: EditionRepository)
class EditionRepositoryImpl implements EditionRepository {
  final EditionDataSource _eDataSource;

  EditionRepositoryImpl(this._eDataSource);

  @override
  Future<Either<Failure, EditionsResponseModel>> register(
      String path, List<EditionPatchBodyDto> elist) {
    return catchFailure(() async {
      final res = await _eDataSource.register(path, elist);
      return EditionsResponseModel.fromDto(res);
    });
  }
}
