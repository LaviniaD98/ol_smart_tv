
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/progress/learner_goals.dart';
import '../../../domain/entities/progress/learner_progress.dart';
import '../../../domain/entities/progress/progress_goals_config_model.dart';
import '../../../domain/entities/user/user_info_model.dart';
import '../../../domain/entities/user_image/user_image_model.dart';
import '../../../domain/use_cases/get_secure_stored_user_info_use_case.dart';
import '../../../domain/use_cases/progress/get_learner_goals_use_case.dart';
import '../../../domain/use_cases/progress/get_learner_progress_use_case.dart';
import '../../../domain/use_cases/progress/get_progress_goals_config_use_case.dart';
import '../../../domain/use_cases/user_profile_image/get_user_image_use_case.dart';

part 'profile_page_state.dart';
part 'profile_page_cubit.freezed.dart';

@injectable
class ProfilePageCubit extends Cubit<ProfilePageState> {
  final GetSecureStoredUserInfoUseCase _getSecureStoredUserInfoUseCase;
  final GetUserImageUseCase _getUserImageUseCase;
  final GetProgressGoalsConfigUseCase _getProgressGoalsConfigUseCase;
  final GetLearnerGoalsUseCase _getLearnerGoalsUseCase;
  final GetLearnerProgressUseCase _getLearnerProgressUseCase;

  ProfilePageCubit(
      this._getUserImageUseCase,
      this._getSecureStoredUserInfoUseCase,
      this._getProgressGoalsConfigUseCase,
      this._getLearnerGoalsUseCase,
      this._getLearnerProgressUseCase,
      ) : super (const ProfilePageState.loading());

  void init() async {
    UserInfoModel? userInfoModel = await _getSecureStoredUserInfoUseCase.call();
    final userImage = await _getUserImage(userInfoModel);
    final config = await _getConfig();
    final goals = await _getGoals(config);
    final progress = await _getProgress(config);

    emit(ProfilePageState.success(
      userInfoModel: userInfoModel,
      imageUrl: userImage?.imageUrl,
      progressGoalsConfig: config,
      goals: goals,
      progress: progress,
    ));
  }

  Future<ProgressGoalsConfigModel?> _getConfig() async {
    final res = await _getProgressGoalsConfigUseCase();

    return res.fold(
      (l) async {
        return null;
      },
      (r) async {
        return r;
      }
    );
  }

  Future<LearnerGoalsModel?> _getGoals(ProgressGoalsConfigModel? config) async {
    if (config?.enabled != true || config?.yourGoals?.enabled != true) {
      return null;
    }

    final res = await _getLearnerGoalsUseCase();
    return res.fold(
      (l) async {
        return null;
      },
      (r) async {
        return r;
      }
    );
  }

  Future<LearnerProgressModel?> _getProgress(ProgressGoalsConfigModel? config) async {
    if (config?.enabled != true || config?.yourProgress?.enabled != true) {
      return null;
    }

    final res = await _getLearnerProgressUseCase();
    return res.fold(
      (l) async {
        return null;
      },
      (r) async {
        return r;
      }
    );
  }

  Future<UserImageModel?> _getUserImage(UserInfoModel? userInfoModel) async {
    final res = await _getUserImageUseCase(userInfoModel?.user?.idUser);
    return res.fold(
      (l) async {
        return null;
      },
      (r) async {
        return r;
      }
    );
  }
}