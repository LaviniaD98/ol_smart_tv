import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/download_ics/events_model.dart';

part 'events_dto.g.dart';

@JsonSerializable(createFactory: false, explicitToJson: true)
class EventsDto {
  EventsDto(
      this.loId,
      this.loType,
  );

  Map<String, dynamic> toJson() => _$EventsDtoToJson(this);
  factory EventsDto.fromModel(EventsModel model) {
    return EventsDto(model.loId, model.loType,);
  }

  @JsonKey(name: "loId")
  final int? loId;
  @JsonKey(name: "loType")
  final String? loType;
}