import 'package:open_learning_smart_tv/core/user_info_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/domain/entities/user/user_info_model.dart';

@lazySingleton
class GetSecureStoredUserInfoUseCase {
  GetSecureStoredUserInfoUseCase();
  Future<UserInfoModel?> call() async {
    return UserInfoManager().getUserInfoModel();
  }
}
