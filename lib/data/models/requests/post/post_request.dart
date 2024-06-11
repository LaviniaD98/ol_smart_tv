import 'package:open_learning_smart_tv/data/models/requests/post/post_body_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cms_post_request.dart';

part 'post_request.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  explicitToJson: true,
)
class PostRequest implements CmsPostRequest {
  const PostRequest({
    this.body,
    required this.endpoint,
    required this.method,
    required this.userId,
    required this.xInitiativeId,
  });

  @override
  Map<String, dynamic> toJson() => _$PostRequestToJson(this);

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
  @JsonKey(name: 'user-id')
  final String userId;

  @override
  @JsonKey(name: 'x-initiative-id')
  final String xInitiativeId;
}
