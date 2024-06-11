import 'package:open_learning_smart_tv/data/models/requests/statements_body_dto.dart';
import '../../models/requests/xapi_body_dto.dart';
import '../../models/responses/statements/xapi_state_results_dto.dart';

abstract class StatementsDataSource {
  Future<List<String>> statements(
      String xapiVer, String path, StatementsDto statObj);

  Future<void> setState(String xapiVer, String path, XapiBodyDto stateDto);

  Future<XapiStateResultsDto> getState(
    String xapiVer,
    String path,
  );
}
