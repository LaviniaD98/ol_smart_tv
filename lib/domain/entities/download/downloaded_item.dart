import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'downloaded_item.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class DownloadedItem {
  DownloadedItem({
    this.id,
    this.taskId,
    this.coverUrl,
    this.type,
    required this.title,
    required this.description,
    this.pathId,
    this.duration,
    required this.isMandatory,
    required this.learningObjectType,
    required this.learningObjectTypology,
    this.coverLocalPath,
    this.size,
    required this.tentativeId,
    required this.iconStatus,
    required this.bookmark,
    required this.parentId,
    required this.grandParentId,
  });

  Map<String, dynamic> toJson() => _$DownloadedItemToJson(this);
  factory DownloadedItem.fromJson(Map<String, dynamic> json) =>
      _$DownloadedItemFromJson(json);

  final int? id;
  final String? taskId;
  final String? coverUrl;
  final String? type;
  final String title;
  final String description;
  final String? pathId;
  final int? duration;
  final bool isMandatory;
  final LearningObjectType learningObjectType;
  final LearningObjectTypology learningObjectTypology;
  String? coverLocalPath;
  final int? size;
  final String? tentativeId;
  IconStatus iconStatus;
  int bookmark;
  String parentId;
  String grandParentId;

  set cover(String coverLocalPath) {
    this.coverLocalPath = coverLocalPath;
  }
}
