import 'package:equatable/equatable.dart';
import 'package:open_learning_smart_tv/data/models/responses/self/self_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/self/id_label_model.dart';
import 'package:open_learning_smart_tv/domain/entities/self/uog_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'self_model.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class SelfModel extends Equatable {
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
  final List<IdLabelModel>? initiatives;
  @JsonKey(name: "internal_employee_flag")
  final bool? internalEmployeeFlag;
  @JsonKey(name: "persona")
  final List<String>? persona;
  @JsonKey(name: "job")
  final IdLabelModel? job;
  @JsonKey(name: "industry")
  final IdLabelModel? industry;
  @JsonKey(name: "profession")
  final IdLabelModel? profession;
  @JsonKey(name: "admin_flag")
  final bool? adminFlag;
  @JsonKey(name: "smart_learning_hours")
  final int? smartLearningHours;
  @JsonKey(name: "onboarding_flag")
  final bool? onboardingFlag;
  @JsonKey(name: "uog")
  final List<UogModel>? uogList;
  @JsonKey(name: "level1_proficiency")
  final List<IdLabelModel>? level1Proficiency;
  @JsonKey(name: "level2_proficiency")
  final List<IdLabelModel>? level2Proficiency;
  @JsonKey(name: "level3_proficiency")
  final List<IdLabelModel>? level3Proficiency;
  @JsonKey(name: "level4_proficiency")
  final List<IdLabelModel>? level4Proficiency;
  @JsonKey(name: "level5_proficiency")
  final List<IdLabelModel>? level5Proficiency;

  const SelfModel({
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
  });

  factory SelfModel.fromJson(Map<String, dynamic> json) =>
      _$SelfModelFromJson(json);
  Map<String, dynamic> toJson() => _$SelfModelToJson(this);

  factory SelfModel.fromResponse(SelfDto response) {
    return SelfModel(
      name: response.name,
      surname: response.surname,
      externalId: response.externalId,
      email: response.email,
      phoneNumber: response.phoneNumber,
      address: response.address,
      gender: response.gender,
      fiscalCode: response.fiscalCode,
      countryCode: response.countryCode,
      countryDescription: response.countryDescription,
      birthday: response.birthday,
      birthCountry: response.birthCountry,
      birthProvince: response.birthProvince,
      atecoCode: response.atecoCode,
      branch: response.branch,
      externalEmployeeFlag: response.externalEmployeeFlag,
      contractualCrameworkCode: response.contractualCrameworkCode,
      contractualFrameworkType: response.contractualFrameworkType,
      newHireFlag: response.newHireFlag,
      hireDate: response.hireDate,
      terminationDate: response.terminationDate,
      contractType: response.contractType,
      scheduleType: response.scheduleType,
      ccnl: response.ccnl,
      language: response.language,
      supervisor: response.supervisor,
      boardFlag: response.boardFlag,
      receievedCredentialsFlag: response.receievedCredentialsFlag,
      privacyConsentFlag: response.privacyConsentFlag,
      smartWorkingFlag: response.smartWorkingFlag,
      roles: response.roles,
      initiatives: response.initiatives
          ?.map((e) => IdLabelModel(id: e.id, label: e.label))
          .toList(),
      internalEmployeeFlag: response.internalEmployeeFlag,
      persona: response.persona,
      job: IdLabelModel.fromResponse(response.job),
      industry: IdLabelModel.fromResponse(response.industry),
      profession: IdLabelModel.fromResponse(response.profession),
      adminFlag: response.adminFlag,
      smartLearningHours: response.smartLearningHours,
      onboardingFlag: response.onboardingFlag,
      uogList: response.uogList
          ?.map((e) => UogModel(uog: e.uog, uogDescription: e.uogDescription))
          .toList(),
      level1Proficiency: response.level1Proficiency
          ?.map((e) => IdLabelModel(id: e.id, label: e.label))
          .toList(),
      level2Proficiency: response.level2Proficiency
          ?.map((e) => IdLabelModel(id: e.id, label: e.label))
          .toList(),
      level3Proficiency: response.level3Proficiency
          ?.map((e) => IdLabelModel(id: e.id, label: e.label))
          .toList(),
      level4Proficiency: response.level4Proficiency
          ?.map((e) => IdLabelModel(id: e.id, label: e.label))
          .toList(),
      level5Proficiency: response.level5Proficiency
          ?.map((e) => IdLabelModel(id: e.id, label: e.label))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        name,
        surname,
        externalId,
        email,
        phoneNumber,
        address,
        gender,
        fiscalCode,
        countryCode,
        countryDescription,
        birthday,
        birthCountry,
        birthProvince,
        atecoCode,
        branch,
        externalEmployeeFlag,
        contractualCrameworkCode,
        contractualFrameworkType,
        newHireFlag,
        hireDate,
        terminationDate,
        contractType,
        scheduleType,
        ccnl,
        language,
        supervisor,
        boardFlag,
        receievedCredentialsFlag,
        privacyConsentFlag,
        smartWorkingFlag,
        roles,
        initiatives,
        internalEmployeeFlag,
        persona,
        job,
        industry,
        profession,
        adminFlag,
        smartLearningHours,
        onboardingFlag,
        uogList,
        level1Proficiency,
        level2Proficiency,
        level3Proficiency,
        level4Proficiency,
        level5Proficiency,
      ];
}
