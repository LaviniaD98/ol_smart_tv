import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item_wall.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/get_stored_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/store_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/statements/get_state_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

part 'local_card_state.dart';
part 'local_card_cubit.freezed.dart';

@injectable
class LocalCardCubit extends Cubit<LocalCardState> {
  final GetStoredDownloadContentInfoUseCase
      _getStoredDownloadContentInfoUseCase;
  final StoreDownloadContentInfoUseCase _storeDownloadContentInfoUseCase;
  final GetStateUseCase _getStateUseCase;

  LocalCardCubit(
    this._getStoredDownloadContentInfoUseCase,
    this._storeDownloadContentInfoUseCase,
    this._getStateUseCase,
  ) : super(const LocalCardState.loading());

  void init(DownloadedItemExtended data, BuildContext parentContext) async {
    emit(const LocalCardState.loading());
    bool hasActiveConnection = await hasConnection();
    if (hasActiveConnection && data.downloadedItem != null) {
      final res = await _getStateUseCase.call(
          data.downloadedItem!.learningObjectTypology,
          data.downloadedItem!.id.toString(),
          data.downloadedItem!.tentativeId);
      res.fold((l) async {
        emit(LocalCardState.done(data, parentContext));
      }, (r) async {
        double duration = r.attemptDuration!;
        _updateLocalFile(data.downloadedItem!.id.toString(), duration.toInt());
        DownloadedItem? updatedDownloadedItem =
            await _getStoredDownloadContentInfoUseCase
                .call(data.downloadedItem!.id.toString());
        data.downloadedItem = updatedDownloadedItem;
        String? localPath = await _getSavedDir();
        data.downloadedItem!.cover =
            '$localPath/COVER_${data.downloadedItem!.id.toString()}';
        if (parentContext.mounted) {
          emit(LocalCardState.done(data, parentContext));
        }
      });
    } else {
      if (parentContext.mounted) {
        emit(LocalCardState.done(data, parentContext));
      }
    }
  }

  Future<String?> _getSavedDir() async {
    String? externalStorageDirPath;
    externalStorageDirPath =
        (await getApplicationDocumentsDirectory()).absolute.path;

    return externalStorageDirPath;
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
