import 'package:open_learning_smart_tv/data/models/requests/edition_patch_body_dto.dart';
import 'package:open_learning_smart_tv/data/models/responses/edition/edition_response_dto.dart';

abstract class EditionDataSource {
  Future<EditionResponseDto> register(
      String path, List<EditionPatchBodyDto> elist);
}
