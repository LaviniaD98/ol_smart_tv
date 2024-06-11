import 'package:open_learning_smart_tv/domain/entities/wall/wall_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../entities/user/user_info_model.dart';
import '../../repositories/search/search_repository.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class GetSearchResultsUseCase {
  final SearchRepository _searchRepository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  GetSearchResultsUseCase(
    this._searchRepository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, WallModel>> call({
    required String text,
    required int page,
    required int pageSize,
  }) async {
    /// Get initiativeId
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase();
    int? initiativeId = userInfoModel?.initiativeId;

    /// Get corporateID
    final corporateId = await _getStoredCorporateIdUseCase();

    return await _searchRepository.getSearchWall(
      text: text,
      page: page,
      pageSize: pageSize,
      corporateId: corporateId?.id,
      initiativeId: initiativeId,
    );
  }
}
