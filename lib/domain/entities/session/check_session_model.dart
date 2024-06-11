import 'package:equatable/equatable.dart';
import 'package:open_learning_smart_tv/data/models/responses/session/check_session_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/session/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_session_model.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class CheckSessionModel extends Equatable {
  final String? sessionId;
  final String? initiativeId;
  final UserModel? user;

  const CheckSessionModel({
    this.sessionId,
    this.initiativeId,
    this.user,
  });

  Map<String, dynamic> toJson() => _$CheckSessionModelToJson(this);
  factory CheckSessionModel.fromResponse(CheckSessionDto response) {
    return CheckSessionModel(
        sessionId: response.sessionId,
        initiativeId: response.initiativeId,
        user: UserModel.fromResponse(response.user));
  }

  @override
  List<Object?> get props => [sessionId, initiativeId, user];
}
