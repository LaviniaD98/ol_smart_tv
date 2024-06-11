import 'package:open_learning_smart_tv/data/data_sources/auto_enrollment/auto_enrollment_data_source.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/repositories/auto_enrollment/auto_enrollment_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/enrollment/enrollment_model.dart';
import '../../models/requests/enrollment_body_dto.dart';

@LazySingleton(as: AutoEnrollmentRepository)
class AutoEnrollmentRepositoryImpl implements AutoEnrollmentRepository {
  final AutoEnrollmentDataSource _aeDataSource;

  AutoEnrollmentRepositoryImpl(this._aeDataSource);

  @override
  Future<Either<Failure, EnrollmentModel>> autoEnrollment(
      String path, List<EnrollmentDto> elist) {
    return catchFailure(() async {
      final res = await _aeDataSource.enrollment(path, elist);
      return EnrollmentModel.fromDto(res);
    });
  }
}
