import 'package:open_learning_smart_tv/data/models/requests/create_slot_request.dart';
import 'package:open_learning_smart_tv/domain/entities/smart_learning/slot_model.dart';
import 'package:dartz/dartz.dart';

import '../../../data/models/failure.dart';
import '../../entities/smart_learning/smart_learning_slots_model.dart';

abstract class SmartLearningRepository {
  Future<Either<Failure, SmartLearningSlotsModel>> getSlots({
    required String startDate,
    required String endDate,
    required int month,
    required int year,
  });
  Future<Either<Failure, SlotModel>> create(CreateSlotRequest request);
  Future<Either<Failure, SlotModel>> update({
    required int slotId,
    required CreateSlotRequest request,
  });
  Future<Either<Failure, void>> delete(int slotId);
}
