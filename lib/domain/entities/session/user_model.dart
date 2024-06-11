import 'package:equatable/equatable.dart';
import 'package:open_learning_smart_tv/data/models/responses/session/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class UserModel extends Equatable {
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

  const UserModel({
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
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromResponse(UserDto? response) {
    return UserModel(
      idUser: response?.idUser,
      organizationId: response?.organizationId,
      externalId: response?.externalId,
      name: response?.name,
      surname: response?.surname,
      email: response?.email,
      job: response?.job,
      status: response?.status,
      roles: response?.roles,
      permissions: response?.permissions,
      uog: response?.uog,
      skills: response?.skills,
      personas: response?.personas,
      initiativeid: response?.initiativeid,
    );
  }

  @override
  List<Object?> get props => [
        idUser,
        organizationId,
        externalId,
        name,
        surname,
        email,
        job,
        status,
        roles,
        permissions,
        uog,
        skills,
        personas,
        initiativeid,
      ];
}
