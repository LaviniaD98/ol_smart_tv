import '../../../data/models/responses/community/attachments_item_dto.dart';

class AttachmentsItemModel {
  AttachmentsItemModel({
    this.duration,
    this.size,
    this.name,
    this.alt,
    this.id,
    this.content,
  });

  factory AttachmentsItemModel.fromDto(AttachmentsItemDto? dto){
    return AttachmentsItemModel(
      duration: dto?.duration,
      size: dto?.size,
      name: dto?.name,
      alt: dto?.alt,
      id: dto?.id,
      content: dto?.content,
    );
  }
  
  final String? duration;
  final String? size;
  final String? name;
  final String? alt;
  final String? id;
  final String? content;
}