import 'package:open_learning_smart_tv/data/models/requests/enrollment_body_dto.dart';
import 'package:open_learning_smart_tv/data/models/requests/learning_object_body_dto.dart';
import 'package:open_learning_smart_tv/domain/repositories/auto_enrollment/auto_enrollment_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import '../../../data/models/failure.dart';
import '../../entities/enrollment/enrollment_model.dart';
import '../../entities/user/user_info_model.dart';
import '../get_secure_stored_user_info_use_case.dart';
import '../session/get_stored_corporate_id_use_case.dart';

@lazySingleton
class BottomEnrollmentUseCase {
  final AutoEnrollmentRepository _repository;
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetStoredCorporateIdUseCase _getStoredCorporateIdUseCase;

  BottomEnrollmentUseCase(
    this._repository,
    this._getSecureStoredUserInfoUseCase,
    this._getStoredCorporateIdUseCase,
  );

  Future<Either<Failure, EnrollmentModel>> call(int idOggetto) async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    int? idUser = userInfoModel?.user?.idUser;
    int? initiativeId = userInfoModel?.initiativeId;
    final corporateId = await _getStoredCorporateIdUseCase();

    String path = "enrollment/enrollments";
    LearningObjectBodyDto lo =
        LearningObjectBodyDto(corporateId?.id, idOggetto);
    EnrollmentDto ed = EnrollmentDto(
        null, initiativeId, getCurrentDateTime(), "BOTTOM", lo, false, idUser!);
    return await _repository.autoEnrollment(path, [ed]);
  }

  String getCurrentDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd hh:mm:ss');
    return formatter.format(now);
  }
}
