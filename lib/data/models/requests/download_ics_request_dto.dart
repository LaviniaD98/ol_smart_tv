import 'package:json_annotation/json_annotation.dart';
import 'events_dto.dart';

part 'download_ics_request_dto.g.dart';

@JsonSerializable(createFactory: false, explicitToJson: true)
class DownloadIcsRequestDto {
  DownloadIcsRequestDto({
    this.date,
    this.events,
  });

  Map<String, dynamic> toJson() => _$DownloadIcsRequestDtoToJson(this);

  @JsonKey(name: "date")
  final String? date;
  @JsonKey(name: "events")
  final List<EventsDto>? events;
}