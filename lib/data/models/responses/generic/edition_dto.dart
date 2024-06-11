import 'package:json_annotation/json_annotation.dart';

part 'edition_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class EditionDto {

  EditionDto(
      this.id,
      this.startTime,
      this.endTime,
      this.status,
      this.location,
      this.rooms,
      this.totalPlaces,
      this.occupiedPlaces,
      this.remainingPlaces,
      this.link,
      this.date,
      this.gMapsUrl
      );

  factory EditionDto.fromJson(Map<String, dynamic> json) => _$EditionDtoFromJson(json);

  @JsonKey()
  final int? id;
  @JsonKey()
  final String? startTime;
  @JsonKey()
  final String? endTime;
  @JsonKey()
  final String? status;
  @JsonKey()
  final String? location;
  @JsonKey()
  final List<String>? rooms;
  @JsonKey()
  final int? totalPlaces;
  @JsonKey()
  final int? occupiedPlaces;
  @JsonKey()
  final int? remainingPlaces;
  @JsonKey()
  final String? link;
  @JsonKey()
  final List<int>? date;
  @JsonKey()
  final String? gMapsUrl;
}
