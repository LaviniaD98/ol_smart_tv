import 'package:open_learning_smart_tv/domain/entities/page/page_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/page/page_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../entities/user/user_info_model.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class GetPageStructureUseCase {
  final PageRepository _pageRepository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  GetPageStructureUseCase(
    this._pageRepository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, PageModel>> call(String basePath) async {
    /// Get initiativeId
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? initiativeId = userInfoModel?.initiativeId;

    /// Get corporateID
    final corporateId = await _getStoredCorporateIdUseCase();

    final path = basePath
        .replaceFirst('{corporateId}', '${corporateId?.id}')
        .replaceFirst(
          '{initiativeId}',
          '$initiativeId',
        );
    return await _pageRepository.getPage(path);
  }
}
