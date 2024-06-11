import 'package:open_learning_smart_tv/domain/entities/corporate_code/corporate_code_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/failure.dart';
import '../repositories/corporate_code/corporate_code_repository.dart';

@lazySingleton
class GetCorporateIdUseCase {
  final CorporateCodeRepository _repository;

  GetCorporateIdUseCase(this._repository);

  Future<Either<Failure, CorporateCodeModel>> call(
      String? disambiguationCode) async {
    return await _repository.getCorporateCode(disambiguationCode);
  }
}
