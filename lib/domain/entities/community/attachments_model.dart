import '../../../data/models/responses/community/attachments_dto.dart';
import 'attachments_item_model.dart';

class AttachmentsModel {
  AttachmentsModel({
    this.image,
    this.link,
    this.brightcove,
    this.document,
  });

  factory AttachmentsModel.fromDto(AttachmentsDto? dto) {
    return AttachmentsModel(
      image: dto?.image?.map((e) => AttachmentsItemModel.fromDto(e)).first,
      link: dto?.link?.map((e) => AttachmentsItemModel.fromDto(e)).first,
      brightcove: dto?.brightcove?.map((e) => AttachmentsItemModel.fromDto(e)).first,
      document: dto?.document?.map((e) => AttachmentsItemModel.fromDto(e)).first,
    );
  }
  
  final AttachmentsItemModel? image;
  final AttachmentsItemModel? link;
  final AttachmentsItemModel? brightcove;
  final AttachmentsItemModel? document;
}

