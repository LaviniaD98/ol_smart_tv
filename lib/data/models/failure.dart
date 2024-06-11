import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String? error;
  final int? statusCode;

  const Failure({
    this.error,
    this.statusCode,
  });

  @override
  List<Object?> get props => [error, statusCode];
}

Future<Either<Failure, R>> catchFailure<R>(
    Future<R> Function() function) async {
  try {
    final response = await function();
    return Right(response);
  } catch (e) {
    if (e is DioException) {
      return Left(
        Failure(
            error: e.response?.statusMessage ??
                LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.error_occurred),
            statusCode: e.response?.statusCode),
      );
    }
    return Left(
      Failure(error: e.toString()),
    );
  }
}
