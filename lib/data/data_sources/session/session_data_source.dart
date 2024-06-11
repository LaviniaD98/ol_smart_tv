import 'package:open_learning_smart_tv/data/models/responses/session_dto.dart';

import '../../models/requests/initiative_body_dto.dart';
import '../../models/responses/session/check_session_dto.dart';

abstract class SessionDataSource {
  Future<SessionDto> sessions({
    String? authorization,
    String? authToken,
    String? refreshToken,
  });

  Future<CheckSessionDto> checkSession({
    String? authorization,
    String sessionId,
  });

  Future<SessionDto> setInitiative({
    String? authorization,
    String? authToken,
    String? refreshToken,
    required InitiativeBodyDto initiativeBodyDto,
  });
}
