import 'package:open_learning_smart_tv/data/models/requests/create_slot_request.dart';
import 'package:open_learning_smart_tv/domain/entities/smart_learning/slot_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/smart_learning/smart_learning_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

@lazySingleton
class CreateSmartLearningSlotUseCase {
  final SmartLearningRepository _smartLearningRepository;

  CreateSmartLearningSlotUseCase(this._smartLearningRepository);

  Future<Either<Failure, SlotModel>> call({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    final req = CreateSlotRequest(
      startDate: startDate.toUtc().toIso8601String(),
      endDate: endDate.toUtc().toIso8601String(),
    );
    return _smartLearningRepository.create(req);
  }
}
