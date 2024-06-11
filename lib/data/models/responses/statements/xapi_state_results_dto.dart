import 'package:freezed_annotation/freezed_annotation.dart';

part 'xapi_state_results_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class XapiStateResultsDto {
  XapiStateResultsDto(this.attemptComplete, this.attemptDuration, this.location);

  factory XapiStateResultsDto.fromJson(Map<String, dynamic> json) => _$XapiStateResultsDtoFromJson(json);

  @JsonKey(name: "attemptComplete")
  final bool attemptComplete;

  @JsonKey(name: "attemptDuration")
  final double attemptDuration;

  @JsonKey(name: "location")
  final int location;

  factory XapiStateResultsDto.fromPredefinedConfig({
    required bool attemptComplete,required double attemptDuration,required int location
  }) {
    return XapiStateResultsDto(attemptComplete,attemptDuration,location);
  }

  @override
  List<Object?> get props => [
    attemptComplete,
    attemptDuration,
    location
  ];
}