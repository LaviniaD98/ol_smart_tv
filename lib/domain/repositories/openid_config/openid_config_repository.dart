import 'package:open_learning_smart_tv/domain/entities/openid_config/openid_config_model.dart';
import 'package:dartz/dartz.dart';
import '../../../data/models/failure.dart';

abstract class OpenidConfigRepository {
  Future<Either<Failure, OpenidConfigModel>> getOpenidConfig(String path);
}
