import 'package:open_learning_smart_tv/data/models/requests/edition_patch_body_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/edition/edition_response_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/edition/edition_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/failure.dart';
import '../../entities/user/user_info_model.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class EditionRegisterUseCase {
  final EditionRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  EditionRegisterUseCase(
    this._repository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, EditionsResponseModel>> call(
      int idOggetto, int detailId) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int idUser = userInfoModel?.user?.idUser ?? 0;
    int initiativeId = userInfoModel?.initiativeId ?? 0;
    final corporateId = await _getStoredCorporateIdUseCase();

    String path = "enrollment/enrollments";
    EditionPatchBodyDto bodyElement = EditionPatchBodyDto(
        corporateId?.id ?? 0, initiativeId, idOggetto, false, detailId, idUser);
    return await _repository.register(path, [bodyElement]);
  }
}
