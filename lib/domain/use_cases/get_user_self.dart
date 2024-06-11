import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/self/self_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/user/user_repository.dart';

@lazySingleton
class GetUserSelfUseCase {
  final UserRepository _userRepository;
  GetUserSelfUseCase(this._userRepository);
  Future<Either<Failure, SelfModel>> call(
      String? authorization, String? sessionId) {
    return _userRepository.self(authorization, sessionId);
  }
}
