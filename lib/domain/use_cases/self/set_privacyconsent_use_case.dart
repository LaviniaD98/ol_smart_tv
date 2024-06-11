import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/repositories/user/user_repository.dart';

@lazySingleton
class SetPrivacyConsentUseCase {
  final UserRepository _userRepository;
  SetPrivacyConsentUseCase(this._userRepository);
  Future<Either<Failure, void>> call(String? authorization, String? sessionId) {
    return _userRepository.setPrivacyConsent(authorization, sessionId);
  }
}
