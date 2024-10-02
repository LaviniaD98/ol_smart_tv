import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/calendar/calendar_strip_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/calendar/not_available_slots_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../data/models/failure.dart';
import '../../entities/strip/row/strip_row.dart';
import '../../entities/user/user_info_model.dart';
import '../../repositories/strip/strip_repository.dart';
import '../get_page_size_strip_use_case.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class GetCalendarStripUseCase {
  final StripRepository _stripRepository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;
  final GetPageSizeStripUseCase _getPageSizeStripUseCase;

  GetCalendarStripUseCase(
    this._stripRepository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
    this._getPageSizeStripUseCase,
  );

  Future<Either<Failure, CalendarStripModel>> call({
    required StripRow strip,
    required DateTime date,
    bool isMonth = false,
  }) async {
    /// Get initiativeId
    final page = await _getPageSizeStripUseCase();
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase();
    int? initiativeId = userInfoModel?.initiativeId;

    DateTime start;
    DateTime end;

    if (isMonth) {
      final dayInMonth = DateUtils.getDaysInMonth(date.year, date.month);
      start = DateTime(date.year, date.month, 1);
      end = DateTime(date.year, date.month, dayInMonth);
    } else {
      start = date.subtract(Duration(days: date.weekday - 1));
      end = start.add(const Duration(days: 6));
    }

    /// Get corporateID
    final corporateId = await _getStoredCorporateIdUseCase();
    final path = strip.apiPath
        .replaceFirst('{corporateId}', '${corporateId?.id}')
        .replaceFirst('{initiativeId}', '$initiativeId')
        .replaceFirst('{pageNumber}', '${page.$1}')
        .replaceFirst('{pageSize}', '${page.$2}')
        .replaceFirst('{selectedDate}', DateFormat('yyyy-MM-dd').format(date))
        .replaceFirst('{startDate}', DateFormat('yyyy-MM-dd').format(start))
        .replaceFirst('{endDate}', DateFormat('yyyy-MM-dd').format(end));

    print('path: $path');
    return await _stripRepository.getCalendarStrip(path);
  }

  Future<Either<Failure, NotAvailableSlotsModel>> callForNotAvailableSlots({
    required StripRow strip,
    required DateTime date,
  }) async {
    /// Get initiativeId
    final page = await _getPageSizeStripUseCase();
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase();
    int? initiativeId = userInfoModel?.initiativeId;

    final start = date.subtract(Duration(days: date.weekday - 1));
    final end = start.add(const Duration(days: 6));

    /// Get corporateID
    final corporateId = await _getStoredCorporateIdUseCase();
    final path = strip.apiPath
        .replaceFirst('{corporateId}', '${corporateId?.id}')
        .replaceFirst('{initiativeId}', '$initiativeId')
        .replaceFirst('{pageNumber}', '${page.$1}')
        .replaceFirst('{pageSize}', '${page.$2}')
        .replaceFirst('{selectedDate}', DateFormat('yyyy-MM-dd').format(date))
        .replaceFirst('{startDate}', DateFormat('yyyy-MM-dd').format(start))
        .replaceFirst('{endDate}', DateFormat('yyyy-MM-dd').format(end));
    return await _stripRepository.getNotAvailableSlots(path);
  }
}
