import 'package:open_learning_smart_tv/data/models/requests/post/post_body_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cms_post_request.dart';

part 'delete_post_request.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  explicitToJson: true,
)
class DeletePostRequest implements CmsPostRequest {
  const DeletePostRequest({
    this.body,
    required this.endpoint,
    required this.method,
    required this.userId,
    required this.xModeratorFlag,
    required this.xInitiativeId,
  });

  @override
  Map<String, dynamic> toJson() => _$DeletePostRequestToJson(this);

  @override
  @JsonKey()
  final PostBodyDto? body;

  @override
  @JsonKey()
  final String endpoint;

  @override
  @JsonKey()
  final String method;

  @override
  @JsonKey(name: 'x-user-id')
  final String userId;

  @override
  @JsonKey(name: 'x-initiative-id')
  final String xInitiativeId;

  @JsonKey(name: 'x-moderator-flag')
  final bool xModeratorFlag;
}
