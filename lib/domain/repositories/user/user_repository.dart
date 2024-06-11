import 'package:dartz/dartz.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/self/self_model.dart';

abstract class UserRepository {
  Future<Either<Failure, SelfModel>> self(
      String? authorization, String? sessionId);
  Future<Either<Failure, void>> setPrivacyConsent(
      String? authorization, String? sessionId);
}
