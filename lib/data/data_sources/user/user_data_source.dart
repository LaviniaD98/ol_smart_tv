import 'package:open_learning_smart_tv/data/models/responses/self/self_dto.dart';

abstract class UserDataSource {
  Future<SelfDto> self({
    String? authorization,
    String? sessionId,
  });

  Future<void> setPrivacyConsent({
    String? authorization,
    String? sessionId,
  });
}
