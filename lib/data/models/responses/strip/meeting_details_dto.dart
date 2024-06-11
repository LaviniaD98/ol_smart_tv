import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_details_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class MeetingDetailsDto {
  const MeetingDetailsDto(
    this.meetingNumber,
    this.startDate,
    this.endDate,
  );

  factory MeetingDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$MeetingDetailsDtoFromJson(json);

  @JsonKey()
  final int? meetingNumber;
  @JsonKey()
  final String? startDate;
  @JsonKey()
  final String? endDate;
}