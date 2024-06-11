
import '../../models/requests/enrollment_body_dto.dart';
import '../../models/responses/enrollment/enrollment_response_dto.dart';

abstract class AutoEnrollmentDataSource {
  Future<EnrollmentResponseDto> enrollment(String path,List<EnrollmentDto> elist);
}