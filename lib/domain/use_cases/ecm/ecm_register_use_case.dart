import 'package:open_learning_smart_tv/data/models/requests/ecm/ecm_info_request.dart';
import 'package:open_learning_smart_tv/data/models/requests/ecm/ecm_register_request.dart';
import 'package:open_learning_smart_tv/domain/entities/ecm/ecm_discipline_model.dart';
import 'package:open_learning_smart_tv/domain/entities/ecm/ecm_profession_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../repositories/ecm/ecm_repository.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@injectable
class EcmRegisterUseCase {
  final EcmRepository _ecmRepository;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;

  EcmRegisterUseCase(
    this._ecmRepository,
    this._getStoredCorporateIdUseCase,
    this._getSecureStoredUserInfoUseCase,
  );

  Future<Either<Failure, void>> call({
    required List<EcmDisciplineModel> disciplines,
    required List<EcmProfessionModel> professions,
    required List<String> sponsors,
    required bool isProfessional,
    required bool isSponsored,
    int? enrollId,
    int? loId,
  }) async {
    final corporateInfo = await _getStoredCorporateIdUseCase();
    final userInfoModel = await _getSecureStoredUserInfoUseCase();

    final reg = EcmRegisterRequest(
      disciplines: disciplines
          .map((e) => EcmInfoRequest(id: e.id, title: e.name))
          .toList(),
      professions: professions
          .map((e) => EcmInfoRequest(id: e.id, title: e.name))
          .toList(),
      sponsors:
          sponsors.map((e) => EcmInfoRequest(id: loId, title: e)).toList(),
      corporateId: corporateInfo?.id,
      enrollId: enrollId,
      isProfessional: isProfessional,
      isSponsored: isSponsored,
      loId: loId,
      userId: userInfoModel?.user?.idUser,
    );

    return await _ecmRepository.register(reg);
  }
}
