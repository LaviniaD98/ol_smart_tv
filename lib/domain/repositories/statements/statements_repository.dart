import 'package:open_learning_smart_tv/data/models/requests/statements_body_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/statements/xapi_state_model.dart';
import 'package:dartz/dartz.dart';
import '../../../data/models/failure.dart';
import '../../../data/models/requests/xapi_body_dto.dart';

abstract class StatementsRepository {
  Future<Either<Failure, List<String>>> statements(
      String path, StatementsDto stat);
  Future<Either<Failure, XapiStateModel>> getState(String path);
  Future<Either<Failure, void>> setState(String path, XapiBodyDto params);
}
