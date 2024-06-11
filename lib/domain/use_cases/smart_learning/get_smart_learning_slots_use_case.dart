import 'package:open_learning_smart_tv/domain/entities/smart_learning/smart_learning_slots_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/smart_learning/smart_learning_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:jiffy/jiffy.dart' as j;

@lazySingleton
class GetSmartLearningSlotsUseCase {
  final SmartLearningRepository _smartLearningRepository;
  GetSmartLearningSlotsUseCase(this._smartLearningRepository);
  Future<Either<Failure, SmartLearningSlotsModel>> call(DateTime date) {
    final base =
        j.Jiffy.parseFromDateTime(date.add(const Duration(hours: 1)).toUtc());
    return _smartLearningRepository.getSlots(
      startDate: base.startOf(j.Unit.day).dateTime.toIso8601String(),
      endDate: base
          .endOf(j.Unit.day)
          .dateTime
          .subtract(const Duration(microseconds: 59999999))
          .toIso8601String(),
      month: base.month,
      year: base.year,
    );
  }
}
