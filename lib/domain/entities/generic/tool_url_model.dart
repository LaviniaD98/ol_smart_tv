import '../../../data/models/responses/generic/tool_url_dto.dart';

class ToolUrlModel {
  ToolUrlModel({
    this.id,
    this.privateUrl,
    this.publicUrl,
  });

  factory ToolUrlModel.fromDto(ToolUrlDto? dto) {
    return ToolUrlModel(
      id: dto?.id,
      privateUrl: dto?.privateUrl,
      publicUrl: dto?.publicUrl,
    );
  }

  final int? id;
  final String? privateUrl;
  final String? publicUrl;
}
