import '../../../../data/models/responses/strip/calendar/days_to_show_dto.dart';
import '../../../../core/utils/extension.dart';

class DaysToShowModel {
  DaysToShowModel({
    this.dayIndex,
    this.dayToShow,
  });

  factory DaysToShowModel.fromDto(DaysToShowDto dto) {
    return DaysToShowModel(
      dayIndex: dto.dayIndex,
      dayToShow: dto.dayToShow?.convertToDateTime,
    );
  }

  final int? dayIndex;
  final DateTime? dayToShow;
}
