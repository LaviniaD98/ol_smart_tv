import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:dartz/dartz.dart';

import '../../entities/download_ics/events_model.dart';

abstract class DownloadIcsRepository {
  Future<Either<Failure, String>> downloadEvents(
      {String? date, List<EventsModel>? events});

  Future<Either<Failure, String>> getEvents({
    required String date,
    required List<EventsModel> events,
  });
}
