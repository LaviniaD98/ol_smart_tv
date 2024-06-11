import 'package:open_learning_smart_tv/data/models/requests/device_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_device_body_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class RegisterDeviceBodyDto extends Equatable {
  const RegisterDeviceBodyDto(
      this.appVersion, this.deviceToken, this.userId, this.device);

  Map<String, dynamic> toJson() => _$RegisterDeviceBodyDtoToJson(this);

  @JsonKey()
  final String appVersion;
  @JsonKey()
  final String deviceToken;
  @JsonKey()
  final String userId;
  @JsonKey()
  final DeviceDto device;

  factory RegisterDeviceBodyDto.fromPredefinedConfig(
      {required String appVersion,
      required String deviceToken,
      required String userId,
      required DeviceDto device}) {
    return RegisterDeviceBodyDto(appVersion, deviceToken, userId, device);
  }

  @override
  List<Object?> get props => [appVersion, deviceToken, userId, device];
}
