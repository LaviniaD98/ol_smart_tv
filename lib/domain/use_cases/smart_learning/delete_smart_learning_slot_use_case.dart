import 'package:open_learning_smart_tv/domain/repositories/smart_learning/smart_learning_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

@lazySingleton
class DeleteSmartLearningSlotUseCase {
  final SmartLearningRepository _smartLearningRepository;

  DeleteSmartLearningSlotUseCase(this._smartLearningRepository);

  Future<Either<Failure, void>> call(int slotId) {
    return _smartLearningRepository.delete(slotId);
  }
}
