import 'package:open_learning_smart_tv/data/models/responses/self/uog_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'initiative_dto.dart';

part 'extended_information_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ExtendedInformationDto {
  ExtendedInformationDto({
    this.profession,
    this.persona,
    this.externalEmployeeFlag,
    this.lastUpdateDate,
    this.roles,
    this.externalId,
    this.newHireFlag,
    this.industry,
    this.creationDate,
    this.uog,
    this.corporateId,
    this.idUser,
    this.skills,
    this.receievedCredentialsFlag,
    this.onboardingFlag,
    this.privacyConsentFlag,
    this.surname,
    this.name,
    this.smartWorkingFlag,
    this.initiatives,
    this.adminFlag,
    this.profileImageUrl,
    this.email,
    this.status,
  });

  factory ExtendedInformationDto.fromJson(Map<String, dynamic> json) =>
      _$ExtendedInformationDtoFromJson(json);

  @JsonKey(name: 'profession')
  final double? profession;
  @JsonKey(name: 'persona')
  final List<String>? persona;
  @JsonKey(name: 'externalEmployeeFlag')
  final bool? externalEmployeeFlag;
  @JsonKey(name: 'lastUpdateDate')
  final double? lastUpdateDate;
  @JsonKey(name: 'roles')
  final List<String>? roles;
  @JsonKey(name: 'externalId')
  final String? externalId;
  @JsonKey(name: 'newHireFlag')
  final bool? newHireFlag;
  @JsonKey(name: 'industry')
  final double? industry;
  @JsonKey(name: 'creationDate')
  final double? creationDate;
  @JsonKey(name: 'uog')
  final List<UogDto>? uog;
  @JsonKey(name: 'corporateId')
  final double? corporateId;
  @JsonKey(name: 'idUser')
  final double? idUser;
  @JsonKey(name: 'skills')
  final List<int>? skills;
  @JsonKey(name: 'receievedCredentialsFlag')
  final bool? receievedCredentialsFlag;
  @JsonKey(name: 'onboardingFlag')
  final bool? onboardingFlag;
  @JsonKey(name: 'privacyConsentFlag')
  final bool? privacyConsentFlag;
  @JsonKey(name: 'surname')
  final String? surname;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'smartWorkingFlag')
  final bool? smartWorkingFlag;
  @JsonKey(name: 'initiatives')
  final List<InitiativeDto>? initiatives;
  @JsonKey(name: 'adminFlag')
  final bool? adminFlag;
  @JsonKey(name: 'profileImageUrl')
  final String? profileImageUrl;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'status')
  final double? status;
}
