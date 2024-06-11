import 'package:open_learning_smart_tv/data/models/requests/post/post_body_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cms_post_request.g.dart';

@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
)
abstract class CmsPostRequest {
  CmsPostRequest(
    this.body,
    this.endpoint,
    this.method,
    this.userId,
    this.xInitiativeId,
  );

  Map<String, dynamic> toJson() => _$CmsPostRequestToJson(this);

  final PostBodyDto? body;
  final String endpoint;
  final String method;
  final String userId;
  final String xInitiativeId;
}
