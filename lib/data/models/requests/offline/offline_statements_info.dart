import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offline_statements_info.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class OfflineStatementsInfo {
  @JsonKey(unknownEnumValue: LearningObjectTypology.unknown)
  final LearningObjectTypology learningObjectTypology;
  @JsonKey()
  final String loId;
  @JsonKey()
  final String? title;
  @JsonKey()
  final String? description;
  @JsonKey()
  final bool completed;
  @JsonKey()
  final Duration duration;
  @JsonKey()
  final String? pathId;
  @JsonKey()
  final String? tentativeId;

  OfflineStatementsInfo({
    required this.learningObjectTypology,
    required this.loId,
    this.title,
    this.description,
    required this.completed,
    required this.duration,
    this.pathId,
    this.tentativeId,
  });

  Map<String, dynamic> toJson() => _$OfflineStatementsInfoToJson(this);

  factory OfflineStatementsInfo.fromJson(Map<String, dynamic> json) =>
      _$OfflineStatementsInfoFromJson(json);
}
