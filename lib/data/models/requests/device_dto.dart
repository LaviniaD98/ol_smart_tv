import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class DeviceDto extends Equatable {

  const DeviceDto(this.model,this.modelVersion,this.os,this.osVersion, this.UUID);

  Map<String, dynamic> toJson() => _$DeviceDtoToJson(this);

  @JsonKey()
  final String model;
  @JsonKey()
  final String modelVersion;
  @JsonKey()
  final String os;
  @JsonKey()
  final String osVersion;
  @JsonKey()
  final String UUID;

  factory DeviceDto.fromPredefinedConfig({
    required String model, required String modelVersion, required String os, required String osVersion, required String UUID
  }) {
    return DeviceDto(model, modelVersion, os, osVersion, UUID);
  }

  @override
  List<Object?> get props => [
    model, modelVersion, os, osVersion, UUID
  ];
}