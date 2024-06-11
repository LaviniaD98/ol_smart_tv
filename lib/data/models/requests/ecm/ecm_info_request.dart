import 'package:json_annotation/json_annotation.dart';

part 'ecm_info_request.g.dart';

@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
)
class EcmInfoRequest {

  const EcmInfoRequest({
    this.id,
    required this.title,
  });

  final int? id;
  final String title;

  Map<String, dynamic> toJson() => _$EcmInfoRequestToJson(this);
}
