import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item.dart';
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_detail_page_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/get_stored_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/store_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/statements/get_state_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'local_card_status_state.dart';
part 'local_card_status_cubit.freezed.dart';

@injectable
class LocalCardStatusCubit extends Cubit<LocalCardStatusState> {
  final GetStoredDownloadContentInfoUseCase
      _getStoredDownloadContentInfoUseCase;
  final GetDetailPageUseCase _getDetailPageUseCase;
  final StoreDownloadContentInfoUseCase _storeDownloadContentInfoUseCase;
  final GetStateUseCase _getStateUseCase;

  LocalCardStatusCubit(
    this._getStoredDownloadContentInfoUseCase,
    this._getDetailPageUseCase,
    this._storeDownloadContentInfoUseCase,
    this._getStateUseCase,
  ) : super(const LocalCardStatusState.loading());

  void init(DownloadedItem? downloadedItem) async {
    emit(const LocalCardStatusState.loading());
    bool hasActiveConnection = await hasConnection();
    if (hasActiveConnection && downloadedItem != null) {
      final detailPageRes = await _getDetailPageUseCase.callDetailPage(
          downloadedItem.id?.toString() ?? "",
          downloadedItem.parentId,
          downloadedItem.grandParentId,
          downloadedItem.learningObjectTypology);
      await detailPageRes.fold(
        (l) {
          emit(LocalCardStatusState.done(downloadedItem));
        },
        (detailPageModel) async {
          await _checkLocalFile(detailPageModel);
          DownloadedItem? updatedDownloadedItem =
              await _getStoredDownloadContentInfoUseCase
                  .call(detailPageModel.id.toString());
          emit(LocalCardStatusState.done(updatedDownloadedItem));
        },
      );
    } else {
      emit(LocalCardStatusState.done(downloadedItem));
    }
  }

  Future<void> _checkLocalFile(DetailPageModel detailPageModel) async {
    DownloadedItem? downloadedItem = await _getStoredDownloadContentInfoUseCase
        .call(detailPageModel.id.toString());
    if (downloadedItem != null) {
      downloadedItem.iconStatus = detailPageModel.iconStatus;
      await _storeDownloadContentInfoUseCase.storeDownloadItem(
          downloadedItem, detailPageModel.id.toString());
    }
  }

  void _updateLocalFile(String loId, int currentBookmark) async {
    DownloadedItem? downloadedItem =
        await _getStoredDownloadContentInfoUseCase.call(loId);
    if (downloadedItem != null) {
      downloadedItem.bookmark = currentBookmark;
      await _storeDownloadContentInfoUseCase.storeDownloadItem(
          downloadedItem, loId);
    }
  }

  Future<bool> hasConnection() async {
    bool hasConnection = true;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      if (kDebugMode) print("hasConnection mobile");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      if (kDebugMode) print("hasConnection wifi");
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      if (kDebugMode) print("hasConnection ethernet");
    } else if (connectivityResult == ConnectivityResult.vpn) {
      if (kDebugMode) print("hasConnection vpn");
    } else if (connectivityResult == ConnectivityResult.bluetooth) {
      if (kDebugMode) print("hasConnection bluetooth");
    } else if (connectivityResult == ConnectivityResult.other) {
      if (kDebugMode) print("hasConnection other");
    } else if (connectivityResult == ConnectivityResult.none) {
      if (kDebugMode) print("hasConnection none");
      hasConnection = false;
    }
    return hasConnection;
  }
}
