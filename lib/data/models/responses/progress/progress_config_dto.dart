import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_config_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ProgressConfigDto {

  ProgressConfigDto(
      this.enabled,
      this.monitoringStartDate,
      );

  factory ProgressConfigDto.fromJson(Map<String, dynamic> json) =>
      _$ProgressConfigDtoFromJson(json);

  @JsonKey()
  final bool? enabled;
  @JsonKey()
  final String? monitoringStartDate;
}