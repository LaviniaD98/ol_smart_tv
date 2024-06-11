import '../../../../data/models/responses/strip/calendar/days_to_highlight_dto.dart';

class DaysToHighlightModel {
  DaysToHighlightModel({
    this.day,
    this.areThereMandatoryLO,
    this.areThereLiveLO,
    this.areThereSmartSlots,
  });

  factory DaysToHighlightModel.fromDto(DaysToHighlightDto dto) {
    return DaysToHighlightModel(
      day: dto.day,
      areThereMandatoryLO: dto.areThereMandatoryLO,
      areThereLiveLO: dto.areThereLiveLO,
      areThereSmartSlots: dto.areThereSmartSlots,
    );
  }

  final int? day;
  final bool? areThereMandatoryLO;
  final bool? areThereLiveLO;
  final bool? areThereSmartSlots;
}
