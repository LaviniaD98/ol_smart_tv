import 'package:open_learning_smart_tv/domain/entities/wall/wall_model.dart';
import 'package:dartz/dartz.dart';

import '../../../data/models/failure.dart';
import '../../entities/strip/row/strip_row.dart';

abstract class WallRepository {
  Future<Either<Failure, WallModel>> getStripWall(StripRow strip, String path);
}
