import 'package:open_learning_smart_tv/domain/entities/session/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class UserInfoModel {
  @JsonKey(name: "sessionId")
  final String? sessionId;
  @JsonKey(name: "initiativeId")
  final int? initiativeId;
  @JsonKey(name: "userModel")
  final UserModel? user;

  UserInfoModel(this.sessionId, this.initiativeId, this.user);

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
