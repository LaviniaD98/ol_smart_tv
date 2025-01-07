import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/data_sources/session/session_data_source.dart';
import 'package:open_learning_smart_tv/domain/entities/cognito/auth_token_response_model.dart';

@lazySingleton
class GetQrCodeUseCase {
  GetQrCodeUseCase(this._sessionRepository);

  final SessionDataSource _sessionRepository;

  Future<dynamic> call(String corporateId) async {
    return _sessionRepository.generateQr(corporateId: corporateId);
  }

  Future<AuthTokenResponseModel?> validate({required String uuid}) async {
    final res = await _sessionRepository.validateQr(uuid: uuid);

    if (res != null) {
      try {
        return AuthTokenResponseModel.fromQrResponse(res);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<dynamic> getExternalIdByUsername({
    required String corporateId,
    required String username,
  }) {
    return _sessionRepository.getExternalIdByUsername(
        corporateId: corporateId, username: username);
  }
}
