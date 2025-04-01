import 'package:open_learning_smart_tv/domain/entities/generic/editions_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/detail/detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../entities/user/user_info_model.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class GetEditionsUseCase {
  final DetailRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  GetEditionsUseCase(
    this._repository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, EditionsModel>> call(String id) async {
    /// Get initiativeId
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? initiativeId = userInfoModel?.initiativeId;

    /// Get corporateID
    final corporateId = await _getStoredCorporateIdUseCase();
    final String path =
        "/learning-catalogue/{corporateId}/{initiativeId}/classrooms/{classroomId}/editions"
            .replaceFirst('{corporateId}', '${corporateId?.id}')
            .replaceFirst('{initiativeId}', '$initiativeId')
            .replaceFirst(
              '{classroomId}',
              id,
            );

    print('GET EDITIONS path: ${path}');
    return await _repository.getEditions(path);
  }
}
