import 'package:json_annotation/json_annotation.dart';

import 'ecm_info_request.dart';

part 'ecm_register_request.g.dart';

@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
)
class EcmRegisterRequest {
  EcmRegisterRequest({
    required this.disciplines,
    required this.professions,
    required this.sponsors,
    required this.isProfessional,
    required this.isSponsored,
    this.enrollId,
    this.corporateId,
    this.userId,
    this.loId,
  });

  final List<EcmInfoRequest> disciplines;
  final List<EcmInfoRequest> professions;
  final List<EcmInfoRequest> sponsors;
  final bool isProfessional;
  final bool isSponsored;
  @JsonKey(name: "LOid")
  final int? loId;
  final int? corporateId;
  final int? enrollId;
  final int? userId;

  Map<String, dynamic> toJson() => _$EcmRegisterRequestToJson(this);
}
