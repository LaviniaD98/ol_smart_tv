import '../../models/requests/ecm/ecm_register_request.dart';
import '../../models/responses/ecm/ecm_disciplines_dto.dart';
import '../../models/responses/ecm/ecm_professions_dto.dart';

abstract class EcmDataSource {
  Future<EcmProfessionsDto> getProfessions(int page, int pageSize);
  Future<EcmDisciplinesDto> getDiscipline(int page, int pageSize, String professionIds);
  Future<void> register(EcmRegisterRequest request);
}
