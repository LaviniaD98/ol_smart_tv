import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/core/env/env.dart';
import 'package:open_learning_smart_tv/core/web_client_config/web_client_config.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dependency_injection.config.dart';

final getIt = GetIt.I;

@InjectableInit()
Future<void> configureDependencies(String appFlavor) async => getIt.init(
      environment: appFlavor,
    );

@module
abstract class ExternalModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      );

  @lazySingleton
  PrettyDioLogger get logInterceptor => PrettyDioLogger(
        requestBody: false, // true,
        responseBody: false, // true,
        error: true,
        requestHeader: true,
        responseHeader: false, // true,
        compact: true,
        logPrint: (message) => {
          // if (kDebugMode) {print("${DateTime.now()} - ${message.toString()}")}
        },
      );

  @Named(WebClientType.defaultClient)
  Dio dioDefault(
    PrettyDioLogger logInterceptor,
    Env env,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: env.baseUrl,
      ),
    );
    dio.interceptors.addAll([
      logInterceptor,
    ]);
    return dio;
  }

  @Named(WebClientType.authenticated)
  Dio dioAuthenticated(
    AuthenticationInterceptor authenticationInterceptor,
    PrettyDioLogger logInterceptor,
    Env env,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: env.baseUrl,
      ),
    );
    dio.interceptors.addAll([
      authenticationInterceptor,
      logInterceptor,
    ]);
    return dio;
  }

  @Named(WebClientType.cognitoAuthClient)
  Dio dioCognito(
    PrettyDioLogger logInterceptor,
    Env env,
  ) {
    final dio = Dio();
    dio.interceptors.addAll([
      logInterceptor,
    ]);
    return dio;
  }

  @Named(WebClientType.dynamicUrlClient)
  Dio dioDynamic(
    PrettyDioLogger logInterceptor,
    Env env,
  ) {
    final dio = Dio();
    dio.interceptors.addAll([
      logInterceptor,
    ]);
    return dio;
  }

  LazyDatabase get lazyDatabase => LazyDatabase(() async {
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(join(dbFolder.path, 'app_db.sqlite'));
        return NativeDatabase(file);
      });
}
