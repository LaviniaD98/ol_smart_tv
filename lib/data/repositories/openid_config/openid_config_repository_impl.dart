import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/openid_config/openid_config_model.dart';
import '../../../domain/repositories/openid_config/openid_config_repository.dart';
import '../../data_sources/openid_config/openid_config_data_source.dart';

@LazySingleton(as: OpenidConfigRepository)
class OpenidConfigRepositoryImpl implements OpenidConfigRepository {
  final OpenidConfigDataSource _openidConfigDataSource;
  OpenidConfigRepositoryImpl(this._openidConfigDataSource);

  @override
  Future<Either<Failure, OpenidConfigModel>> getOpenidConfig(String path) {
    return catchFailure(() async {
      final res = await _openidConfigDataSource.getOpenidConfig(path);
      return OpenidConfigModel.fromResponse(res);
    });
  }
}
