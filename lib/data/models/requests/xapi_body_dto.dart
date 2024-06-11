import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'xapi_body_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class XapiBodyDto extends Equatable {
  const XapiBodyDto(this.attemptComplete,this.attemptDuration,this.location);

  Map<String, dynamic> toJson() => _$XapiBodyDtoToJson(this);

  @JsonKey(name: "attemptComplete")
  final bool attemptComplete;
  @JsonKey(name: "attemptDuration")
  final double attemptDuration;
  @JsonKey(name: "location")
  final int location;

  factory XapiBodyDto.fromPredefinedConfig({
    required bool attemptComplete,required double attemptDuration,required int location}) {
    return XapiBodyDto(attemptComplete,attemptDuration,location);
  }

  @override
  List<Object?> get props => [
    attemptComplete,attemptDuration,location
  ];
}