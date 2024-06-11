import 'package:open_learning_smart_tv/domain/entities/corporate_code/corporate_code_model.dart';
import 'package:dartz/dartz.dart';

import '../../../data/models/failure.dart';

abstract class CorporateCodeRepository {
  Future<Either<Failure, CorporateCodeModel>> getCorporateCode(
      String? disambiguationCode);
}
