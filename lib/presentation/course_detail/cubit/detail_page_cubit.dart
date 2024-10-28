import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/domain/entities/community/community_posts_model.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/editions_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/releated_learning_activity_response_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/tool_response_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_detail_page_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_editions_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_related_activities_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/detail/get_tools_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/get_stored_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/download/store_download_content_info_use_case.dart';
import 'package:open_learning_smart_tv/domain/use_cases/edition/edition_register_use_case.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/continue_learning/cubit/continue_learning_strip_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/community/community_data_model.dart';
import '../../../domain/entities/enrollment/enrollment_model.dart';
import '../../../domain/entities/generic/edition_model.dart';
import '../../../domain/entities/smart_configurator/smart_configurator_model.dart';
import '../../../domain/use_cases/auto_enrollment/auto_enrollment_use_case.dart';
import '../../../domain/use_cases/auto_enrollment/bottom_enrollment_use_case.dart';
import '../../../domain/use_cases/detail/get_shared_posts_use_case.dart';
import '../../../domain/use_cases/post/delete_post_use_case.dart';
import '../../../domain/use_cases/smart_configurator/get_stored_smart_configuration_use_case.dart';
import '../../../domain/use_cases/start_resume_use_case/start_resume_use_case.dart';
import '../../../remote_theming/config/config_manager.dart';
import '../../../remote_theming/config/remote_config_keys.dart';
import '../detail_page.dart';

part 'detail_page_state.dart';
part 'detail_page_cubit.freezed.dart';

@injectable
class DetailPageCubit extends Cubit<DetailPageState> {
  final GetDetailPageUseCase _getDetailPageUseCase;
  final GetToolsUseCase _getToolsUseCase;
  final GetRelatedActivitiesUseCase _getRelatedActivitiesUseCase;
  final GetEditionsUseCase _getEditionsUseCase;
  final GetSharedPostsUseCase _getSharedPostsUseCase;
  final AutoEnrollmentUseCase _getAutoEnrollmentUseCase;
  final StartResumeUseCase _getStartOrResumeUseCase;
  final GetStoredSmartConfigurationUseCase _getStoredSmartConfigurationUseCase;
  final EditionRegisterUseCase _editionRegisterUseCase;
  final BottomEnrollmentUseCase _bottomEnrollmentUseCase;
  final ContinueLearningStripCubit _continueLearningStripCubit;
  final DeletePostUseCase _deletePostUseCase;
  final GetStoredDownloadContentInfoUseCase
      _getStoredDownloadContentInfoUseCase;
  final StoreDownloadContentInfoUseCase _storeDownloadContentInfoUseCase;

  bool callingApi = false;

  final paginate = ConfigManager()
      .getRemoteBoolean(RemoteConfigKeys.paginate_opinions, false);

  OrderedTraversalPolicy? mainPolicy;

  FocusScopeNode? leftPanelNode;
  FocusScopeNode? rightPanelNode;
  FocusScopeNode? subActivitiesFocusNode;
  FocusScopeNode? detailsFocusNode;

  DetailPageCubit(
    this._getDetailPageUseCase,
    this._getToolsUseCase,
    this._getRelatedActivitiesUseCase,
    this._getEditionsUseCase,
    this._getSharedPostsUseCase,
    this._getAutoEnrollmentUseCase,
    this._getStartOrResumeUseCase,
    this._getStoredSmartConfigurationUseCase,
    this._editionRegisterUseCase,
    this._bottomEnrollmentUseCase,
    this._continueLearningStripCubit,
    this._deletePostUseCase,
    this._getStoredDownloadContentInfoUseCase,
    this._storeDownloadContentInfoUseCase,
  ) : super(const DetailPageState.loading());

  final _pageSize =
      ConfigManager().getRemoteInt(RemoteConfigKeys.page_size_comments, 10);
  PagingController<int, CommunityDataModel> pagedController =
      PagingController(firstPageKey: 0);
  late Function(int) _listener;

  Future<void> init(DetailPageArgs args, {int selectedIndex = 0}) async {
    if (state is! Loading) emit(const DetailPageState.loading());
    final detailPageRes = await _getDetailPageUseCase(args, args.typology);
    await detailPageRes.fold(
      (l) {
        emit(const Error());
      },
      (detailPageModel) async {
        var tabValues = await Future.wait([
          _getTools(args.id),
          _getRelatedActivities(args.id),
          _getEditions(detailPageModel, args.id),
          paginate ? _fetchInitialOpinions(args.id) : _getSharedPosts(args.id),
        ]);

        tabValues[0].fold(
          (l) {
            emit(const Error());
          },
          (r) {
            detailPageModel.toolResponse = r as ToolResponseModel;
          },
        );
        tabValues[1].fold(
          (l) {},
          (r) {
            detailPageModel.releatedLearningActivity =
                r as ReleatedLearningActivityResponseModel;
          },
        );
        tabValues[2].fold(
          (l) {},
          (r) {
            detailPageModel.editions = r as EditionsModel;
          },
        );
        tabValues[3].fold(
          (l) {},
          (r) {
            detailPageModel.sharedPosts = r as CommunityPostsModel;
          },
        );
        final smartConfig = await _getStoredSmartConfigurationUseCase();

        _listener =
            (pageKey) => _fetchOpinions(args.id, pageKey, detailPageModel);
        pagedController.addPageRequestListener(_listener);

        emit(Success(selectedIndex, detailPageModel, smartConfig));

        _checkLocalFile(detailPageModel);
      },
    );
  }

  Future<DetailPageModel?> getCourseDetails({
    required DetailPageArgs args,
  }) async {
    final detailPageRes = await _getDetailPageUseCase(args, args.typology);

    DetailPageModel? result;

    detailPageRes.fold(
      (l) {},
      (detailPageModel) {
        result = detailPageModel;
      },
    );
    await Future.delayed(const Duration(milliseconds: 100), () {});
    return result;
  }

  Future<void> selectEditionsIfPresentIndex(
    DetailPageArgs args,
    DetailPageModel model,
  ) async {
    if (model.learningObjectTypology != LearningObjectTypology.course &&
        model.learningObjectTypology != LearningObjectTypology.path &&
        model.editionsModel != null &&
        model.editionsModel?.editions?.isNotEmpty == true) {
      init(args, selectedIndex: 1);
    } else {
      emit(
        ErrorWithDialog(
          LabelsManager().getRemoteStringFromLabelKeys(
              RemoteLabelKeys.detail_editions_not_present),
        ),
      );
    }
  }

  void getStartOrResumeModel(int loId, String parentId, DetailPageModel detail,
      BuildContext? playerContext) async {
    if (kDebugMode) print("getStartOrResumeModel callingApi: $callingApi");
    if (callingApi) {
      return;
    }
    callingApi = true;
    if (kDebugMode) print("getStartOrResumeModel callingApi SET to true");
    final detailPageRes = await _getStartOrResumeUseCase(loId, parentId);
    await detailPageRes.fold((l) async {
      await Future.delayed(const Duration(milliseconds: 300));
      callingApi = false;
      if (kDebugMode) print("getStartOrResumeModel callingApi SET to false");
      return null;
    }, (srResponseModel) async {
      if ((detail.learningObjectTypology == LearningObjectTypology.path ||
              detail.learningObjectTypology == LearningObjectTypology.course) &&
          srResponseModel.isToj()) {
        emit(DetailPageState.openDetail(srResponseModel, detail));
        await Future.delayed(const Duration(milliseconds: 300));
        callingApi = false;
        if (kDebugMode) print("getStartOrResumeModel callingApi SET to false");
      } else {
        if (srResponseModel.learningObjectType == LearningObjectType.sync) {
          emit(DetailPageState.openDetail(srResponseModel, detail));
          await Future.delayed(const Duration(milliseconds: 300));
          callingApi = false;
          if (kDebugMode)
            print("getStartOrResumeModel callingApi SET to false");
        } else {
          emit(DetailPageState.readyToPlay(
              srResponseModel, detail, playerContext));
          await Future.delayed(const Duration(milliseconds: 300));
          callingApi = false;
          if (kDebugMode)
            print("getStartOrResumeModel callingApi SET to false");
        }
      }
      //return srResponseModel;
    });
  }

  void executeAutoEnrollment(
    DetailPageArgs args,
    int idOggetto,
    String enrollType,
    DetailPageModel model,
    bool playContent,
  ) async {
    // emit(const DetailPageState.loading());
    final detailPageRes =
        await _getAutoEnrollmentUseCase(idOggetto, enrollType);
    await detailPageRes.fold((l) {
      emit(const Error());
    }, (enrollResponse) async {
      //EnrollmentResponseDto
      if (enrollResponse.enrollNotSaved != null &&
          enrollResponse.enrollNotSaved!.isNotEmpty) {
        emit(DetailPageState.autoEnrollFail(enrollResponse));
      } else {
        if (playContent) {
          emit(DetailPageState.autoEnroll(model));
        } else {
          init(args);
        }
      }
    });
  }

  Future<Either<Failure, ToolResponseModel>> _getTools(String id) async {
    return await _getToolsUseCase(id);
  }

  Future<Either<Failure, ReleatedLearningActivityResponseModel>>
      _getRelatedActivities(String id) async {
    return await _getRelatedActivitiesUseCase(id);
  }

  Future<Either<Failure, EditionsModel>> _getEditions(
      DetailPageModel detailPageModel, String id) async {
    if (detailPageModel.learningObjectTypology ==
            LearningObjectTypology.virtualClass ||
        detailPageModel.learningObjectTypology ==
            LearningObjectTypology.physicalClass) {
      return await _getEditionsUseCase(id);
    } else {
      return const Left(
        Failure(error: "not implemented for this kind of detail"),
      );
    }
  }

  Future<Either<Failure, CommunityPostsModel>> _getSharedPosts(
      String id) async {
    return await _getSharedPostsUseCase(id: id, page: null, pageSize: null);
  }

  Future<Either<Failure, CommunityPostsModel>> _fetchInitialOpinions(
      String id) async {
    return await _getSharedPostsUseCase(
      id: id,
      page: 0,
      pageSize: _pageSize,
    );
  }

  Future _fetchOpinions(
      String id, int page, DetailPageModel detailPageModel) async {
    final res = await _getSharedPostsUseCase(
      id: id,
      page: page,
      pageSize: _pageSize,
    );

    res.fold((l) {
      pagedController.error = l.error;
    }, (r) async {
      detailPageModel.sharedPosts = r;

      final items = r.data;
      late bool isLast;
      final totalPages = r.pager?.totalPages;

      if (totalPages != null) {
        isLast = page >= totalPages.toInt();
      } else {
        isLast = r.data.length < _pageSize;
      }

      if (isLast) {
        pagedController.appendLastPage(items);
      } else {
        pagedController.appendPage(items, ++page);
      }
    });
  }

  Future<void> registerEdition(DetailPageArgs args, EditionModel editionModel,
      DetailPageModel model) async {
    emit(const Loading());
    await _bottomEnrollmentUseCase(model.id ?? 0);
    await _editionRegisterUseCase(editionModel.id ?? 0, model.id ?? 0);
    init(args);
  }

  void deleteSharedPost(DetailPageArgs args, String? id) async {
    if (id != null) {
      emit(const Loading());
      final res = await _deletePostUseCase(id);
      res.fold(
        (l) => emit(const DetailPageState.error()),
        (r) => init(args),
      );
    }
  }

  void refreshContinueLearningStrip() => _continueLearningStripCubit.refresh();

  void _checkLocalFile(DetailPageModel detailPageModel) async {
    DownloadedItem? downloadedItem = await _getStoredDownloadContentInfoUseCase
        .call(detailPageModel.id.toString());
    if (downloadedItem != null) {
      downloadedItem.iconStatus = detailPageModel.iconStatus;
      await _storeDownloadContentInfoUseCase.storeDownloadItem(
          downloadedItem, detailPageModel.id.toString());
    }
  }
}
