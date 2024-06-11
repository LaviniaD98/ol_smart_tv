import 'package:open_learning_smart_tv/data/data_sources/statements/statements_data_source.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/data/models/requests/statements_body_dto.dart';
import 'package:open_learning_smart_tv/data/models/requests/xapi_body_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/statements/xapi_state_model.dart';
import '../../../domain/repositories/statements/statements_repository.dart';

@LazySingleton(as: StatementsRepository)
class StatementsRepositoryImpl implements StatementsRepository {
  final StatementsDataSource _sDataSource;

  StatementsRepositoryImpl(this._sDataSource);

  @override
  Future<Either<Failure, List<String>>> statements(
      String path, StatementsDto stat) {
    return catchFailure(() async {
      final res = await _sDataSource.statements(
        '1.0.0',
        path,
        stat,
      );
      return res;
    });
  }

  @override
  Future<Either<Failure, XapiStateModel>> getState(String path) {
    return catchFailure(() async {
      final res = await _sDataSource.getState(
        '1.0.0',
        path,
      );
      return XapiStateModel.fromResponse(res);
    });
  }

  @override
  Future<Either<Failure, void>> setState(String path, XapiBodyDto params) {
    return catchFailure(() async {
      final res = await _sDataSource.setState('1.0.0', path, params);
      return res;
    });
  }
}
