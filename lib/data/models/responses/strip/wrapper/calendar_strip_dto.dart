import 'package:open_learning_smart_tv/data/models/responses/strip/calendar/smart_learning_slots_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../generic/metadata_dto.dart';
import '../calendar/days_to_highlight_dto.dart';
import '../learning_object_dto.dart';

part 'calendar_strip_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class CalendarStripDto {
  CalendarStripDto(
    this.learningObjects,
    this.smartLearningSlots,
    this.daysToHighlight,
    this.metadata,
  );

  factory CalendarStripDto.fromJson(Map<String, dynamic> json) =>
      _$CalendarStripDtoFromJson(json);

  @JsonKey(name: 'learningObjects')
  final List<LearningObjectDto>? learningObjects;
  @JsonKey(name: 'smartLearningSlots')
  final List<SmartLearningSlotsDto>? smartLearningSlots;
  @JsonKey(name: 'daysToHighlight')
  final List<DaysToHighlightDto>? daysToHighlight;
  @JsonKey(name: 'metadata')
  final MetadataDto? metadata;
}
