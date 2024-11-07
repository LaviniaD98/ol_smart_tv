import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/data_sources/session/session_data_source.dart';

@lazySingleton
class GetQrCodeUseCase {
  GetQrCodeUseCase(this._sessionRepository);

  final SessionDataSource _sessionRepository;

  Future<dynamic> call(String corporateId) async {
    return _sessionRepository.generateQr(corporateId: corporateId);
  }

  Future<dynamic> validate({required String uuid}) async {
    return _sessionRepository.validateQr(uuid: uuid);
  }
}
