import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

enum UserRoles {
  @JsonValue("BUSINESS_ADMIN") BUSINESS_ADMIN,
  @JsonValue("HR") HR,
  @JsonValue("LEARNER") LEARNER,
  @JsonValue("MANAGER") MANAGER,
  @JsonValue("PRODUCT_OWNER") PRODUCT_OWNER,
  @JsonValue("TEACHER") TEACHER
}

enum UserPersonas {
  @JsonValue("DIRIGENTE") DIRIGENTE,
  @JsonValue("IMPIEGATO") IMPIEGATO,
  @JsonValue("LEADERSHIP") LEADERSHIP,
  @JsonValue("NEOASSUNTO") NEOASSUNTO,
  @JsonValue("QUADRO") QUADRO
}

@JsonSerializable(createToJson: false, checked: true)
class UserDto {
  UserDto(
  this.idUser,
  this.organizationId,
  this.externalId,
  this.name,
  this.surname,
  this.email,
  this.phoneNumber,
  this.address,
  this.job,
  this.status,
  this.roles,
  this.permissions,
  this.uog,
  this.skills,
  this.personas,
  this.initiativeid,
  );

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  @JsonKey(name: "id_user")
  final int? idUser;
  @JsonKey(name: "organization_id")
  final int? organizationId;
  @JsonKey(name: "external_id")
  final String? externalId;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "surname")
  final String? surname;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "job")
  final int? job;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "roles")
  final List<UserRoles>? roles;
  @JsonKey(name: "permissions")
  final List<String>? permissions;
  @JsonKey(name: "uog")
  final List<String>? uog;
  @JsonKey(name: "skills")
  final List<int>? skills;
  @JsonKey(name: "personas")
  final List<UserPersonas>? personas;
  @JsonKey(name: "initiative_id")
  final int? initiativeid;
}
