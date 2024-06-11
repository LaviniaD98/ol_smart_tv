

import '../../../data/models/responses/progress/completed_time_dto.dart';

class CompletedTimeModel {
  CompletedTimeModel({
    this.hours,
    this.minutes,
  });

  factory CompletedTimeModel.fromResponse(CompletedTimeDto? response) {
    return CompletedTimeModel(
        hours: response?.hours,
        minutes: response?.minutes,
    );
  }

  final int? hours;
  final int? minutes;
}