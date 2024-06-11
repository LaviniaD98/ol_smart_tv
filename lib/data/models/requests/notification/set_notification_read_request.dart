import 'package:json_annotation/json_annotation.dart';

part 'set_notification_read_request.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  explicitToJson: true,
)
class SetNotificationReadRequest {

  const SetNotificationReadRequest({
    required this.messageIds,
    required this.readStatus,
  });

  @override
  Map<String, dynamic> toJson() => _$SetNotificationReadRequestToJson(this);

  @override
  @JsonKey()
  final List<int> messageIds;

  @override
  @JsonKey()
  final String readStatus;
}
