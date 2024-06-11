import 'package:open_learning_smart_tv/data/data_sources/smart_learning/smart_learning_data_source.dart';
import 'package:open_learning_smart_tv/data/models/requests/create_slot_request.dart';
import 'package:open_learning_smart_tv/domain/entities/smart_learning/slot_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../../domain/entities/smart_learning/smart_learning_slots_model.dart';
import '../../../domain/repositories/smart_learning/smart_learning_repository.dart';

@LazySingleton(as: SmartLearningRepository)
class SmartLearningRepositoryImpl implements SmartLearningRepository {
  final SmartLearningDataSource _smartLearningDataSource;

  SmartLearningRepositoryImpl(this._smartLearningDataSource);

  @override
  Future<Either<Failure, SmartLearningSlotsModel>> getSlots({
    required String startDate,
    required String endDate,
    required int month,
    required int year,
  }) {
    return catchFailure(() async {
      final res = await _smartLearningDataSource.getSlots(
        startDate: startDate,
        endDate: endDate,
        month: month,
        year: year,
      );
      return SmartLearningSlotsModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, SlotModel>> create(CreateSlotRequest request) {
    return catchFailure(() async {
      final res = await _smartLearningDataSource.create(request);
      return SlotModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, SlotModel>> update({
    required int slotId,
    required CreateSlotRequest request,
  }) {
    return catchFailure(() async {
      final res = await _smartLearningDataSource.update(
        slotId: slotId,
        request: request,
      );
      return SlotModel.fromDto(res);
    });
  }

  @override
  Future<Either<Failure, void>> delete(int slotId) {
    return catchFailure(() async {
      await _smartLearningDataSource.delete(slotId);
    });
  }
}
