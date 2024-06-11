import 'package:json_annotation/json_annotation.dart';
import 'package:open_learning_smart_tv/data/models/responses/self/id_label_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/self/uog_dto.dart';

part 'self_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class SelfDto {
  SelfDto(
      this.name,
      this.surname,
      this.externalId,
      this.email,
      this.phoneNumber,
      this.address,
      this.gender,
      this.fiscalCode,
      this.countryCode,
      this.countryDescription,
      this.birthday,
      this.birthCountry,
      this.birthProvince,
      this.atecoCode,
      this.branch,
      this.externalEmployeeFlag,
      this.contractualCrameworkCode,
      this.contractualFrameworkType,
      this.newHireFlag,
      this.hireDate,
      this.terminationDate,
      this.contractType,
      this.scheduleType,
      this.ccnl,
      this.language,
      this.supervisor,
      this.boardFlag,
      this.receievedCredentialsFlag,
      this.privacyConsentFlag,
      this.smartWorkingFlag,
      this.roles,
      this.initiatives,
      this.internalEmployeeFlag,
      this.persona,
      this.job,
      this.industry,
      this.profession,
      this.adminFlag,
      this.smartLearningHours,
      this.onboardingFlag,
      this.uogList,
      this.level1Proficiency,
      this.level2Proficiency,
      this.level3Proficiency,
      this.level4Proficiency,
      this.level5Proficiency,
      this.c1value,
      this.c2value,
      this.c3value,
      this.c4value,
      this.c5value,
      this.c6value,
      this.c7value,
      this.c8value,
      this.c9value,
      this.c10value,
      this.c11value,
      this.c12value,
      this.c13value,
      this.c14value,
      this.c15value,
      this.c16value,
      this.c17value,
      this.c18value,
      this.c19value,
      this.c20value);

  factory SelfDto.fromJson(Map<String, dynamic> json) =>
      _$SelfDtoFromJson(json);

  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "surname")
  final String? surname;
  @JsonKey(name: "external_id")
  final String? externalId;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "fiscal_code")
  final String? fiscalCode;
  @JsonKey(name: "country_code")
  final String? countryCode;
  @JsonKey(name: "country_description")
  final String? countryDescription;
  @JsonKey(name: "birthday")
  final int? birthday;
  @JsonKey(name: "birth_country")
  final String? birthCountry;
  @JsonKey(name: "birth_province")
  final String? birthProvince;
  @JsonKey(name: "ateco_code")
  final String? atecoCode;
  @JsonKey(name: "branch")
  final String? branch;
  @JsonKey(name: "external_employee_flag")
  final bool? externalEmployeeFlag;
  @JsonKey(name: "contractual_framework_code")
  final String? contractualCrameworkCode;
  @JsonKey(name: "contractual_framework_type")
  final String? contractualFrameworkType;
  @JsonKey(name: "new_hire_flag")
  final bool? newHireFlag;
  @JsonKey(name: "hire_date")
  final int? hireDate;
  @JsonKey(name: "termination_date")
  final int? terminationDate;
  @JsonKey(name: "contract_type")
  final String? contractType;
  @JsonKey(name: "schedule_type")
  final String? scheduleType;
  @JsonKey(name: "ccnl")
  final String? ccnl;
  @JsonKey(name: "language")
  final String? language;
  @JsonKey(name: "supervisor")
  final String? supervisor;
  @JsonKey(name: "board_flag")
  final bool? boardFlag;
  @JsonKey(name: "receieved_credentials_flag")
  final bool? receievedCredentialsFlag;
  @JsonKey(name: "privacy_consent_flag")
  final bool? privacyConsentFlag;
  @JsonKey(name: "smart_working_flag")
  final bool? smartWorkingFlag;
  @JsonKey(name: "roles")
  final List<String>? roles;
  @JsonKey(name: "initiatives")
  final List<IdLabelDto>? initiatives;
  @JsonKey(name: "internal_employee_flag")
  final bool? internalEmployeeFlag;
  @JsonKey(name: "persona")
  final List<String>? persona;
  @JsonKey(name: "job")
  final IdLabelDto? job;
  @JsonKey(name: "industry")
  final IdLabelDto? industry;
  @JsonKey(name: "profession")
  final IdLabelDto? profession;
  @JsonKey(name: "admin_flag")
  final bool? adminFlag;
  @JsonKey(name: "smart_learning_hours")
  final int? smartLearningHours;
  @JsonKey(name: "onboarding_flag")
  final bool? onboardingFlag;
  @JsonKey(name: "uog")
  final List<UogDto>? uogList;
  @JsonKey(name: "level1_proficiency")
  final List<IdLabelDto>? level1Proficiency;
  @JsonKey(name: "level2_proficiency")
  final List<IdLabelDto>? level2Proficiency;
  @JsonKey(name: "level3_proficiency")
  final List<IdLabelDto>? level3Proficiency;
  @JsonKey(name: "level4_proficiency")
  final List<IdLabelDto>? level4Proficiency;
  @JsonKey(name: "level5_proficiency")
  final List<IdLabelDto>? level5Proficiency;
  @JsonKey(name: "c1value")
  final String? c1value;
  @JsonKey(name: "c2value")
  final String? c2value;
  @JsonKey(name: "c3value")
  final String? c3value;
  @JsonKey(name: "c4value")
  final String? c4value;
  @JsonKey(name: "c5value")
  final String? c5value;
  @JsonKey(name: "c6value")
  final String? c6value;
  @JsonKey(name: "c7value")
  final String? c7value;
  @JsonKey(name: "c8value")
  final String? c8value;
  @JsonKey(name: "c9value")
  final String? c9value;
  @JsonKey(name: "c10value")
  final String? c10value;
  @JsonKey(name: "c11value")
  final String? c11value;
  @JsonKey(name: "c12value")
  final String? c12value;
  @JsonKey(name: "c13value")
  final String? c13value;
  @JsonKey(name: "c14value")
  final String? c14value;
  @JsonKey(name: "c15value")
  final String? c15value;
  @JsonKey(name: "c16value")
  final String? c16value;
  @JsonKey(name: "c17value")
  final String? c17value;
  @JsonKey(name: "c18value")
  final String? c18value;
  @JsonKey(name: "c19value")
  final String? c19value;
  @JsonKey(name: "c20value")
  final String? c20value;
}
