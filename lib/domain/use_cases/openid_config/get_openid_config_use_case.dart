import 'package:open_learning_smart_tv/domain/entities/openid_config/openid_config_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../repositories/openid_config/openid_config_repository.dart';

@lazySingleton
class GetOpenidConfigUseCase {
  final OpenidConfigRepository _repository;

  GetOpenidConfigUseCase(this._repository);
  Future<Either<Failure, OpenidConfigModel>> call(
      String baseUrl, String? userpoolId) async {
    final userpoolRegion = userpoolId?.substring(0, userpoolId.indexOf('_'));
    String path = baseUrl
        .replaceFirst('{userpool}', '$userpoolId')
        .replaceFirst('{userpool_region}', '$userpoolRegion');
    return await _repository.getOpenidConfig(path);
  }
}
