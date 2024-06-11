import '../../../data/models/responses/community/extended_information_dto.dart';
import '../self/uog_model.dart';
import 'initiative_model.dart';

class ExtendedInformationModel {
  ExtendedInformationModel({
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

  factory ExtendedInformationModel.fromDto(ExtendedInformationDto? dto) {
    return ExtendedInformationModel(
      profession: dto?.profession,
      persona: dto?.persona,
      externalEmployeeFlag: dto?.externalEmployeeFlag,
      lastUpdateDate: dto?.lastUpdateDate,
      roles: dto?.roles,
      externalId: dto?.externalId,
      newHireFlag: dto?.newHireFlag,
      industry: dto?.industry,
      creationDate: dto?.creationDate,
      uog: dto?.uog?.map((e) => UogModel.fromResponse(e)).toList(),
      corporateId: dto?.corporateId,
      idUser: dto?.idUser,
      skills: dto?.skills,
      receievedCredentialsFlag: dto?.receievedCredentialsFlag,
      onboardingFlag: dto?.onboardingFlag,
      privacyConsentFlag: dto?.privacyConsentFlag,
      surname: dto?.surname,
      name: dto?.name,
      smartWorkingFlag: dto?.smartWorkingFlag,
      initiatives: dto?.initiatives?.map((e) => InitiativeModel.fromDto(e)).toList(),
      adminFlag: dto?.adminFlag,
      profileImageUrl: dto?.profileImageUrl,
      email: dto?.email,
      status: dto?.status,
    );
  }
  
  final double? profession;
  final List<String>? persona;
  final bool? externalEmployeeFlag;
  final double? lastUpdateDate;
  final List<String>? roles;
  final String? externalId;
  final bool? newHireFlag;
  final double? industry;
  final double? creationDate;
  final List<UogModel>? uog;
  final double? corporateId;
  final double? idUser;
  final List<int>? skills;
  final bool? receievedCredentialsFlag;
  final bool? onboardingFlag;
  final bool? privacyConsentFlag;
  final String? surname;
  final String? name;
  final bool? smartWorkingFlag;
  final List<InitiativeModel>? initiatives;
  final bool? adminFlag;
  final String? profileImageUrl;
  final String? email;
  final double? status;
}