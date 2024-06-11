
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/responses/corporate_code/corporate_code_dto.dart';

part 'corporate_code_model.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class CorporateCodeModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "country")
  final String? country;
  @JsonKey(name: "province")
  final String? province;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "postal_code")
  final String? postalCode;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "business_name")
  final String? businessName;
  @JsonKey(name: "fiscal_code")
  final String? fiscalCode;
  @JsonKey(name: "contact_emails")
  final List<String>? contactEmails;
  @JsonKey(name: "term_of_payment")
  final String? termOfPayment;
  @JsonKey(name: "pec")
  final String? pec;
  @JsonKey(name: "sdi")
  final String? sdi;
  @JsonKey(name: "login_type")
  final LoginType? loginType;
  @JsonKey(name: "client_id")
  final String? clientId;
  @JsonKey(name: "userpool_id")
  final String? userpoolId;
  @JsonKey(name: "corporate_domain")
  final String? corporateDomain;
  @JsonKey(name: "onboarding")
  final bool? onboarding;
  @JsonKey(name: "creation_date")
  final String? creationDate;
  @JsonKey(name: "update_date")
  final String? updateDate;
  @JsonKey(name: "updated_by")
  final String? updatedBy;
  @JsonKey(name: "initiative_list")
  final List<String>? initiativeList;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "link_admin_theme")
  final String? linkAdminTheme;
  @JsonKey(name: "welcome_email_extrasystem_flag")
  final bool? welcomeEmailExtrasystemFlag;
  @JsonKey(name: "enable_community_flag")
  final bool? enableCommunityFlag;
  // @JsonKey(name: "ssoLoginUrl")
  // final String? ssoLoginUrl;
  @JsonKey(name: "sso_redirect_url")
  final String? ssoRedirectUrl;

  const CorporateCodeModel({
    this.id,
    this.name,
    this.country,
    this.province,
    this.city,
    this.postalCode,
    this.address,
    this.businessName,
    this.fiscalCode,
    this.contactEmails,
    this.termOfPayment,
    this.pec,
    this.sdi,
    this.loginType,
    this.clientId,
    this.userpoolId,
    this.corporateDomain,
    this.onboarding,
    this.creationDate,
    this.updateDate,
    this.updatedBy,
    this.initiativeList,
    this.status,
    this.linkAdminTheme,
    this.welcomeEmailExtrasystemFlag,
    this.enableCommunityFlag,
    this.ssoRedirectUrl,
    // this.ssoLoginUrl
  });

  Map<String, dynamic> toJson() => _$CorporateCodeModelToJson(this);
  factory CorporateCodeModel.fromJson(Map<String, dynamic> json) => _$CorporateCodeModelFromJson(json);
  factory CorporateCodeModel.fromResponse(CorporateCodeDto? response) {
    return CorporateCodeModel(
      id: response?.id,
      name: response?.name,
      country: response?.country,
      province: response?.province,
      city: response?.city,
      postalCode: response?.postalCode,
      address: response?.address,
      businessName: response?.businessName,
      fiscalCode: response?.fiscalCode,
      contactEmails: response?.contactEmails,
      termOfPayment: response?.termOfPayment,
      pec: response?.pec,
      sdi: response?.sdi,
      loginType: response?.loginType,
      clientId: response?.clientId,
      userpoolId: response?.userpoolId,
      corporateDomain: response?.corporateDomain,
      onboarding: response?.onboarding,
      creationDate: response?.creationDate,
      updateDate: response?.updateDate,
      updatedBy: response?.updatedBy,
      initiativeList: response?.initiativeList,
      status: response?.status,
      linkAdminTheme: response?.linkAdminTheme,
      welcomeEmailExtrasystemFlag: response?.welcomeEmailExtrasystemFlag,
      enableCommunityFlag: response?.enableCommunityFlag,
      ssoRedirectUrl: response?.ssoRedirectUrl,
    );
  }
}