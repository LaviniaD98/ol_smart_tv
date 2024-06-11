
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/corporate_code/corporate_code_model.dart';
import '../../../domain/repositories/corporate_code/corporate_code_repository.dart';
import '../../data_sources/corporate_code/corporate_code_data_source.dart';
import '../../models/failure.dart';

@LazySingleton(as: CorporateCodeRepository)
class CorporateCodeRepositoryImpl implements CorporateCodeRepository {
  final CorporateCodeDataSource _corporateCodeDataSource;
  CorporateCodeRepositoryImpl(this._corporateCodeDataSource);

  @override
  Future<Either<Failure, CorporateCodeModel>> getCorporateCode(String? disambiguationCode) {
    return catchFailure(() async {
      final res = await _corporateCodeDataSource.getCorporateCode(disambiguationCode);
      return CorporateCodeModel.fromResponse(res);
    });
  }
}