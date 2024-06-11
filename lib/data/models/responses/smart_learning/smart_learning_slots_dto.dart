import 'package:open_learning_smart_tv/data/models/responses/smart_learning/slot/slot_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'smart_learning_slots_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class SmartLearningSlotsDto {
  SmartLearningSlotsDto(this.slots, this.hoursAvailable);

  factory SmartLearningSlotsDto.fromJson(Map<String, dynamic> json) =>
      _$SmartLearningSlotsDtoFromJson(json);

  @JsonKey(name: "slots")
  final List<SlotDto> slots;
  @JsonKey(name: "hours_available")
  final int? hoursAvailable;
}
