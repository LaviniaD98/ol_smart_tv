import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../entities/strip/row/strip_row.dart';
import '../../entities/user/user_info_model.dart';
import '../../entities/wall/wall_model.dart';
import '../../repositories/wall/wall_repository.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class GetWallStripContentUseCase {
  final WallRepository _wallRepository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  GetWallStripContentUseCase(
    this._wallRepository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, WallModel>> call({
    required StripRow strip,
    required int page,
    required int pageSize,
  }) async {

    String? startTime;
    String? endTime;
    /// Get initiativeId
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase();
    int? initiativeId = userInfoModel?.initiativeId;
    /// Get corporateID
    if(strip is SmartLearning) {
      if(strip.startTime != null) startTime = strip.startTime!.toUtc().toIso8601String();
      if(strip.endTime != null) endTime = strip.endTime!.toUtc().toIso8601String();
    }

    final corporateId = await _getStoredCorporateIdUseCase();
    String path = strip.apiPath
        .replaceFirst('{corporateId}', '${corporateId?.id}')
        .replaceFirst('{initiativeId}', '$initiativeId')
        .replaceFirst('{pageNumber}', '$page')
        .replaceFirst('{pageSize}', '$pageSize')
        .replaceFirst('{startTime}', '$startTime')
        .replaceFirst('{endTime}', '$endTime')
        .replaceFirst('{topics}', '')
        .replaceFirst('{learningObjectsType}', '')
        .replaceFirst('{status}', '');

    return await _wallRepository.getStripWall(strip, path);
  }
}
