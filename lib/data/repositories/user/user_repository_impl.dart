import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/data_sources/user/user_data_source.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/self/self_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/user/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<Either<Failure, SelfModel>> self(
      String? authorization, String? sessionId) {
    return catchFailure(() async {
      final res = await _userDataSource.self(
        authorization: authorization,
        sessionId: sessionId,
      );
      return SelfModel.fromResponse(res);
    });
  }

  @override
  Future<Either<Failure, void>> setPrivacyConsent(
      String? authorization, String? sessionId) {
    return catchFailure(() async {
      await _userDataSource.setPrivacyConsent(
        authorization: authorization,
        sessionId: sessionId,
      );
      return;
    });
  }
}
