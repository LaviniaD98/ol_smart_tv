import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_device_response.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class RegisterDeviceResponse {

  RegisterDeviceResponse(this.address,this.channelType,this.creationDate,this.effectiveDate,this.endPoint,
  this.errorManagement, this.errorResponse, this.requestId, this.resultCode, this.statusDeviceToken, this.success);

  factory RegisterDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceResponseFromJson(json);

  @JsonKey()
  final String? address;
  @JsonKey()
  final String? channelType;
  @JsonKey()
  final String? creationDate;
  @JsonKey()
  final String? effectiveDate;
  @JsonKey()
  final String? endPoint;
  @JsonKey()
  final String? errorManagement;
  @JsonKey()
  final String? errorResponse;
  @JsonKey()
  final String? requestId;
  @JsonKey()
  final String? resultCode;
  @JsonKey()
  final String? statusDeviceToken;
  @JsonKey()
  final bool? success;
}