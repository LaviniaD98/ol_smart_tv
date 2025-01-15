import 'package:open_learning_smart_tv/data/models/responses/generic/object_statistics_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_rating_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/smart_configurator/get_stored_smart_configuration_use_case.dart';

part 'rating_state.dart';
part 'rating_cubit.freezed.dart';

@injectable
class RatingCubit extends Cubit<RatingState> {
  final GetRatingUseCase _getRatingUseCase;
  final GetStoredSmartConfigurationUseCase _getStoredSmartConfiguratorUseCase;

  RatingCubit(
    this._getRatingUseCase,
    this._getStoredSmartConfiguratorUseCase,
  ) : super(const RatingState.Initial());

  void init(DetailPageModel detailPageModel) async {
    getRatingInfo(detailPageModel);
  }

  String getRatingIconButton(ObjectStatisticsDto? ostat, {int? maxStars = 5}) {
    double topRating = maxStars?.toDouble() ?? 5.0;
    if (ostat != null && ostat.averageRating != null) {
      if (ostat.averageRating! >= topRating) {
        return 'assets/icons/star/star_100.svg';
      } else if (ostat.averageRating! >= (topRating * 0.25) &&
          ostat.averageRating! < (topRating * 0.5)) {
        return 'assets/icons/star/star_25.svg';
      } else if (ostat.averageRating! >= (topRating * 0.5) &&
          ostat.averageRating! < (topRating * 0.75)) {
        return 'assets/icons/star/star_50.svg';
      } else if (ostat.averageRating! >= (topRating * 0.75) &&
          ostat.averageRating! < topRating) {
        return 'assets/icons/star/star_75.svg';
      } else {
        return 'assets/icons/star/star_0.svg';
      }
    }
    return 'assets/icons/star/star_0.svg';
  }

  void updateRating(DetailPageModel detailPageModel) async {
    getRatingInfo(detailPageModel);
  }

  void getRatingInfo(DetailPageModel detailPageModel) async {
    final res = await _getRatingUseCase(detailPageModel);
    await res.fold(
      (l) {
        emit(const Error());
      },
      (ratingInfo) async {
        final smartConfig = await _getStoredSmartConfiguratorUseCase();
        if (ratingInfo.learnerObjectList != null &&
            ratingInfo.learnerObjectList!.isNotEmpty) {
          ObjectStatisticsDto? ostat =
              ratingInfo.learnerObjectList!.first.objectStatistics;
          if (ostat != null) {
            emit(Success(ostat, smartConfig?.ratingMax,
                ratingInfo.learnerObjectList?.first.userRating?.rating));
          }
        } else {
          emit(Success(null, smartConfig?.ratingMax, null));
        }
      },
    );
  }
}
