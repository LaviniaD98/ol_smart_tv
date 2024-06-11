import 'dart:io';

import 'package:open_learning_smart_tv/data/data_sources/assets/app_resource_data_source.dart';
import 'package:open_learning_smart_tv/domain/entities/assets/app_resource_get_file_model.dart';
import 'package:open_learning_smart_tv/domain/repositories/assets/app_resource_repository.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/logo_app_header/cubit/app_logo_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import 'package:http/http.dart' as http;

import '../../models/failure.dart';

@LazySingleton(as: AppResourceRepository)
class AppResourceRepositoryImpl implements AppResourceRepository {
  final AppResourceDataSource _appResourceDataSource;

  AppResourceRepositoryImpl(this._appResourceDataSource);

  @override
  Future<Either<Failure, AppResourceGetFileModel>> getFile(
      String? corporateId, String? fileName) async {
    var fileDelete = await _deleteLocalFile();
    fileDelete.fold((l) {
      if (kDebugMode)
        print("AppResourceRepositoryImpl error while deleting existing file");
    }, (deleted) {
      if (kDebugMode) print("AppResourceRepositoryImpl existing file deleted");
    });
    return catchFailure(() async {
      final res = await _appResourceDataSource.getFile(
        corporateId: corporateId,
        fileName: fileName,
      );

      catchFailure(() async {
        String? localPath = await _getSavedDir();
        if (localPath == null) {
          throw Exception(
              "Errore durante la fase di inizializzazione del local storage");
        }
        if (res.publicUrl?.isNotEmpty == true) {
          final http.Response response =
              await http.get(Uri.parse(res.publicUrl!));
          if (kDebugMode)
            print(
                "AppResourceRepositoryImplresponseStatusCode: ${response.statusCode}");
          if (response.statusCode != 200) {
            if (kDebugMode) print("AppResourceRepositoryImpl logo not found");
            var fullFileName = '$localPath/RES_${AppLogoCubit.localLogoName}';
            // Save to filesystem
            final file = File(fullFileName);
            if (file.existsSync()) {
              file.deleteSync();
            }
          } else {
            // Create an image name
            var fullFileName = '$localPath/RES_${AppLogoCubit.localLogoName}';

            // Save to filesystem
            final file = File(fullFileName);
            await file.writeAsBytes(response.bodyBytes);

            if (kDebugMode)
              print(
                  "AppResourceRepositoryImpl LOGO for fileName: $fileName saved in $fullFileName");
          }
        } else {
          if (kDebugMode)
            print("AppResourceRepositoryImpl COVER NO download for coverurl");
        }
      });

      return AppResourceGetFileModel.fromDto(res);
    });
  }

  Future<Either<Failure, bool>> _deleteLocalFile() async {
    return catchFailure(() async {
      //remove existing file
      String? localPath = await _getSavedDir();
      if (localPath == null) {
        throw Exception(
            "Errore durante la fase di inizializzazione del local storage");
      }
      var fullFileName = '$localPath/RES_${AppLogoCubit.localLogoName}';
      final file = File(fullFileName);
      file.deleteSync();
      return true;
    });
  }

  Future<String?> _getSavedDir() async {
    String? externalStorageDirPath;
    externalStorageDirPath =
        (await getApplicationDocumentsDirectory()).absolute.path;

    return externalStorageDirPath;
  }
}
