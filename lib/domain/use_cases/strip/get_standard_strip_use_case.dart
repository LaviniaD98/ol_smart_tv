import 'dart:developer';

import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../entities/strip/row/strip_row.dart';
import '../../entities/user/user_info_model.dart';
import '../../repositories/strip/strip_repository.dart';
import '../get_page_size_strip_use_case.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class GetStandardStripUseCase {
  final StripRepository _stripRepository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;
  final GetPageSizeStripUseCase _getPageSizeStripUseCase;

  GetStandardStripUseCase(
    this._stripRepository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
    this._getPageSizeStripUseCase,
  );

  Future<Either<Failure, List<LearningObjectModel>>> call({
    required StripRow strip,
    List<String>? filters,
  }) async {
    /// Get initiativeId
    final start1 = DateTime.now();
    final page = await _getPageSizeStripUseCase();
    final start2 = DateTime.now();
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase();
    final start3 = DateTime.now();
    int? initiativeId = userInfoModel?.initiativeId;

    /// Get corporateID
    final corporateId = await _getStoredCorporateIdUseCase();
    final start4 = DateTime.now();
    final filter = filters?.join(',') ?? '';
    final path = strip.apiPath
        .replaceFirst('{corporateId}', '${corporateId?.id}')
        .replaceFirst('{initiativeId}', '$initiativeId')
        .replaceFirst('{pageNumber}', '${page.$1}')
        .replaceFirst('{pageSize}', '${page.$2}')
        .replaceFirst('{topics}', filter)
        .replaceFirst('{learningObjectsType}', filter)
        .replaceFirst('{status}', filter);
    final start5 = DateTime.now();
    if (kDebugMode)
      print(
          "${DateTime.now()} https:// in GetStandardStripUseCase s2-s1:(${start2.difference(start1)}) - s3-s2:(${start3.difference(start2)}) s4-s3:(${start4.difference(start3)}) s5-s4:(${start5.difference(start4)})  ${strip.apiPath}");
    return await _stripRepository.getLearningObjectsStrip(strip, path);
  }
}
