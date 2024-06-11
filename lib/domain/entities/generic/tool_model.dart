import 'package:open_learning_smart_tv/data/models/responses/generic/tool_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/useful_link_model.dart';

class ToolModel {
  ToolModel(
      {this.id,
      this.name,
      this.shortDescription,
      this.dimension,
      this.notes,
      this.usefulLinks});

  factory ToolModel.fromDto(ToolDto? dto) {
    return ToolModel(
        id: dto?.id,
        name: dto?.name,
        shortDescription: dto?.shortDescription,
        dimension: dto?.dimension,
        notes: dto?.notes,
        usefulLinks: dto?.usefulLinks
            ?.map((dto) => UsefulLinkModel(
                url: dto.url,
                urlLabel: dto.urlLabel,
                description: dto.description))
            .toList());
  }

  final int? id;
  final String? name;
  final String? shortDescription;
  final int? dimension;
  final String? notes;
  final List<UsefulLinkModel>? usefulLinks;
}
