import 'package:dartz/dartz.dart';

import '../../../data/models/failure.dart';
import '../../entities/page/page_model.dart';

abstract class PageRepository {
  Future<Either<Failure, PageModel>> getPage(String path);
}
