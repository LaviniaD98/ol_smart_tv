import 'package:open_learning_smart_tv/data/models/responses/generic/tool_response_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/tool_model.dart';

class ToolResponseModel {
  ToolResponseModel({this.tools});

  factory ToolResponseModel.fromDto(ToolResponseDto dto) {
    return ToolResponseModel(
        tools: dto.tools?.map((dto) => ToolModel.fromDto(dto)).toList());
  }

  final List<ToolModel>? tools;
}
