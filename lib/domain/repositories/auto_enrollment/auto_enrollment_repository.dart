
import 'package:dartz/dartz.dart';
import '../../../data/models/failure.dart';
import '../../../data/models/requests/enrollment_body_dto.dart';
import '../../entities/enrollment/enrollment_model.dart';

abstract class AutoEnrollmentRepository {
  Future<Either<Failure, EnrollmentModel>> autoEnrollment(String path, List<EnrollmentDto> elist);
}