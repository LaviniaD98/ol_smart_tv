import 'package:open_learning_smart_tv/domain/entities/strip/calendar/not_available_slots_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:dartz/dartz.dart';

import '../../../data/models/failure.dart';
import '../../entities/strip/calendar/calendar_strip_model.dart';
import '../../entities/strip/row/strip_row.dart';

abstract class StripRepository {
  Future<Either<Failure, List<LearningObjectModel>>> getLearningObjectsStrip(
      StripRow strip, String path);
  Future<Either<Failure, CalendarStripModel>> getCalendarStrip(String path);
  Future<Either<Failure, NotAvailableSlotsModel>> getNotAvailableSlots(
      String path);
}
