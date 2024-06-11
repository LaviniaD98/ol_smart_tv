import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/object_statistics_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/course_logic.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/lo_types.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/course_detail_editions.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/course_detail_opinions_no_page.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/favorites/cubit/favourite_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/favorites/favourite_button_page.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/rating/rating_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/rating/rating_text.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/learning_activity_row.dart';
import 'package:open_learning_smart_tv/remote_theming/config/config_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/config/remote_config_keys.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/presentation/web_player/web_view_page.dart';
import 'package:open_learning_smart_tv/router/app_router.dart';
import 'package:open_learning_smart_tv/wrappers/tracking/tracking_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import '../../color_management/color_manager.dart';
import '../../domain/entities/generic/course_model.dart';
import '../../domain/entities/menu/route/menu_route.dart';
import '../../domain/entities/smart_configurator/smart_configurator_model.dart';
import '../../theme/app_theme.dart';
import '../app_state/cubit/app_cubit.dart';
import '../common/widgets/app_bar/gradient_app_bar.dart';
import '../common/widgets/dialog/ol_alert_dialog.dart';
import '../common/widgets/error/error_screen.dart';
import '../common/widgets/rating/ratings_dialog.dart';
import '../common/widgets/styled_icon_button.dart';
import '../dynamic_content/strip/community/detail/post_detail_page_connector.dart';
import '../dynamic_content/strip/community/post/post_page.dart';
import '../video_player/video_player_page.dart';
import 'course_detail_modules.dart';
import 'course_detail_opinions.dart';
import 'details_tab.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/dynamic_sliver_detail_header.dart';
import 'widgets/tools/tools_list.dart';

class DetailPage extends StatelessWidget {
  final DetailPageArgs args;
  static String routeName = 'detail';

  const DetailPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: GradientAppBar(
        automaticallyImplyLeading: false,
        actions: [
          StyledIconButton(
            svgPath: 'assets/icons/cross_alt.svg',
            onTap: context.pop,
          ),
        ],
      ),
      body: BlocConsumer<DetailPageCubit, DetailPageState>(
        listener: (context, state) => state.whenOrNull(
          autoEnroll: (data) => startOrResumeCheck(context, data.id!, data),
          autoEnrollFail: (eres) async {
            await OlAlertDialog.show(context,
                title: LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                message: eres.errorMessage!,
                actionLabel: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.continue_button),
                barrierDismissible: false);
            if (context.mounted) context.pop(true);
            return null;
          },
          errorWithDialog: (message) async {
            await OlAlertDialog.show(context,
                title: LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                message: message,
                actionLabel: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.continue_button),
                barrierDismissible: false);
            return null;
          },
          readyToPlay: (model, detail) => startPlay(context, model, detail),
          openDetail: (model, detail) {
            context.pushNamed(
              DetailPage.routeName,
              extra: DetailPageArgs(
                id: model.id.toString(),
                parentId: args.id,
                typology: model.learningObjectTypology,
                grandParentId: args.parentId,
                parent: detail,
              ),
            );
            return null;
          },
          goToSharedPostDetails: (postArgs) async {
            await context.pushNamed(
              PostDetailPageConnector.routeName,
              extra: postArgs,
            );
            if (context.mounted) {
              context.read<DetailPageCubit>().init(args);
              getIt<TrackingManager>()
                  .communityTrackingHandler(AppRouter.I.fullPath);
            }
            return null;
          },
        ),
        buildWhen: (previous, current) => current.maybeMap(
          success: (_) => true,
          loading: (_) => true,
          error: (_) => true,
          orElse: () => false,
        ),
        builder: (context, state) => state.maybeWhen(
          loading: () => _loading,
          success: (selectedIndex, model, smartConfig) =>
              _content(context, selectedIndex, model, smartConfig),
          error: () => _error(context),
          orElse: () => const SizedBox(),
        ),
      ),
    );
  }

  Widget _error(BuildContext context) {
    return Center(
      child: ErrorScreen(
          title: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
          message: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.error_occurred),
          onReload: () => {context.pop()}),
    );
  }

  Widget get _loading {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _content(BuildContext context, int selectedIndex,
      DetailPageModel model, SmartConfiguratorModel? smartConfig) {
    int tabContentLength = contentBarLength(context, model, false);
    return DefaultTabController(
      length: tabContentLength,
      initialIndex: selectedIndex,
      child: Container(
        decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: NestedScrollView(
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              /// Header
              DynamicSliverDetailHeader(
                model: model,
                args: args,
              ),

              /// Actions
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.spacingL,
                    vertical: Dimens.spacingXXS,
                  ),
                  child: Row(
                    children: [
                      if (smartConfig?.funcCommunity == true &&
                          context
                                  .read<AppCubit>()
                                  .state
                                  .dynamicRoutes
                                  ?.whereType<VisCommunity>()
                                  .isNotEmpty ==
                              true)
                        GestureDetector(
                          onTap: () async {
                            final res = await context.pushNamed<bool?>(
                              PostPage.routeName,
                              extra: PostPageArgs(
                                pageType: PostPageType.shared,
                                loId: '${model.id}',
                                loAuthor:
                                    'abc123', //TODO: hardcodato sul web, dove troviamo il campo?
                                loType: model.learningObjectTypology,
                              ),
                            );
                            getIt<TrackingManager>()
                                .communityTrackingHandler(AppRouter.I.fullPath);
                            if (context.mounted && res != null && res) {
                              context.read<DetailPageCubit>().init(args);
                            }
                          },
                          behavior: HitTestBehavior.translucent,
                          child: Transform.scale(
                              scale: 0.9999,
                              child: SvgPicture.asset(
                                'assets/icons/detail/dettaglio_condividi.svg',
                                colorFilter: ColorFilter.mode(
                                  ColorManager().getColorBackgroundPrimaryCta(),
                                  BlendMode.srcIn,
                                ),
                              )),
                        ),
                      if (smartConfig?.funcRating == true &&
                          (smartConfig?.funcCommunity == true &&
                              context
                                      .read<AppCubit>()
                                      .state
                                      .dynamicRoutes
                                      ?.whereType<VisCommunity>()
                                      .isNotEmpty ==
                                  true))
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: Dimens.spacingS),
                          width: 1,
                          height: 18,
                          color: ColorManager().getColorBorder(),
                        ),
                      if (smartConfig?.funcRating == true)
                        BlocProvider(
                          create: (_) => getIt<RatingCubit>()..init(model),
                          child: Row(
                            children: [
                              ratingStars(model),
                              const SizedBox(width: Dimens.spacingXXS),
                              RatingText(detailPageModel: model),
                            ],
                          ),
                        ),
                      if (smartConfig?.funcFavourites == true) const Spacer(),
                      if (smartConfig?.funcFavourites == true)
                        BlocProvider(
                          create: (_) =>
                              getIt<FavouriteCubit>()..init(model, args.parent),
                          child: FavoriteButton(
                            detailPageModel: model,
                            parentId: args.parentId,
                            grandParentId: args.grandParentId,
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              /// Tab
              SliverToBoxAdapter(
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ColorManager().getColorTextPrimary(),
                        width: 2.0,
                      ),
                    ),
                  ),
                  isScrollable: true,
                  padding: const EdgeInsets.only(left: 5, right: 20),
                  labelStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: ColorManager().getColorTextPrimary()),
                  unselectedLabelStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: ColorManager().getColorTextPrimary()),
                  tabs: buildTabContentBar(context, model, true, smartConfig),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: buildTabContentBar(
              context,
              model,
              false,
              smartConfig,
            ),
          ),
        ),
      ),
    );
  }

  void startOrResumeCheck(
      BuildContext context, int loId, DetailPageModel detail) {
    String parentId =
        (args.parentId == null || args.parentId!.toLowerCase() == "null")
            ? loId.toString()
            : args.parentId!;
    context
        .read<DetailPageCubit>()
        .getStartOrResumeModel(loId, parentId, detail);
  }

  void startPlay(BuildContext context, LearningObjectModel lo,
      DetailPageModel detail) async {
    if (lo.fruitionFlag == true) {
      if (lo.learningObjectTypology != LearningObjectTypology.externalRes) {
        if (lo.link != null && context.mounted) {
          WakelockPlus.enable();
          await context.pushNamed(
            WebViewPage.routeName,
            extra: WebViewPageArgs(
              model: lo,
            ),
          );
          WakelockPlus.disable();
          if (context.mounted) {
            context.read<DetailPageCubit>().refreshContinueLearningStrip();
            context.read<DetailPageCubit>().init(args);
          }
        } else {
          OlAlertDialog.show(
            context,
            title: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
            message: LabelsManager().getRemoteStringFromLabelKeys(
                RemoteLabelKeys.detail_link_alert),
            actionLabel: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.close),
          );
        }
      } else {
        WakelockPlus.enable();
        final res = await context.pushNamed<bool?>(
          VideoPlayerPage.routeName,
          extra: VideoPlayerPageArgs(
            id: lo.id,
            title: lo.title ?? '',
            typology: lo.learningObjectTypology,
            type: lo.learningObjectType,
            isMandatory: lo.isMandatory ?? false,
            brightcoveId: lo.brightcoveId,
            pathId: args.parentId,
            tentativeId: "${lo.tentativeId}",
            onTapDetail: () async {
              final subNavigationTypes = [
                LearningObjectTypology.course,
                LearningObjectTypology.path
              ];
              context.pop();
              if (subNavigationTypes.contains(detail.learningObjectTypology)) {
                /// navigate to detail sub route
                await context.pushNamed(
                  DetailPage.routeName,
                  extra: DetailPageArgs(
                    id: lo.id.toString(),
                    parentId: lo.id == detail.id ? null : detail.id.toString(),
                    typology: lo.learningObjectTypology,
                    grandParentId: lo.id == detail.id ? null : args.parentId,
                    parent: detail,
                  ),
                );

                /// reload parent detail
                if (context.mounted) context.read<DetailPageCubit>().init(args);
              } else {
                /// reload parent detail
                context.read<DetailPageCubit>().init(args);
              }
            },
          ),
        );
        WakelockPlus.disable();
        if (res != null && res && context.mounted) {
          /// reload detail
          context.read<DetailPageCubit>().init(args);
        }
      }
    } else {
      OlAlertDialog.show(context,
          title: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
          message: LabelsManager().getRemoteStringFromLabelKeys(
              RemoteLabelKeys.details_no_fruition),
          actionLabel: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.continue_button),
          barrierDismissible: false);
    }
  }

  Widget? getTabActivity(
      DetailPageModel model, bool isTabHeader, BuildContext context) {
    if (model.learningActivities != null &&
        model.learningActivities!.isNotEmpty == true) {
      if (isTabHeader) {
        return Tab(
            text: LabelsManager().getRemoteStringFromLabelKeys(
                RemoteLabelKeys.learning_activities));
      } else {
        var loCharacterization = CourseLogic().loCharacterizationNew(
          status: model.status ?? "",
          learningObjectType: model.learningObjectType,
          learningObjectTypology: model.learningObjectTypology,
          percentageOfCompletion: model.percentageOfCompletion ?? "0",
          enrollType: model.enrollType ?? EnrollType.autoEnroll,
          ecmSpecialization: model.ecmSpecialization,
          ecmRegistration: model.ecmRegistration,
        );
        return LearningActivityRow(
            items: model.learningActivities!,
            parentModel: model,
            grandParentId: args.parentId,
            parentId: model.id.toString(),
            enable: !(loCharacterization.objLOAction ==
                ObjLOAction.ecmNotRegistered),
            returnFromDetailCallback: () {
              if (context.mounted) {
                context.read<DetailPageCubit>().refreshContinueLearningStrip();
                context.read<DetailPageCubit>().init(args);
              }
            });
      }
    }
    return null;
  }

  Widget getTabDetail(DetailPageModel model, bool isTabHeader) {
    if (isTabHeader) {
      return Tab(
          text: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.details));
    } else {
      return DetailsTab(
          model: model,
          parentModel: args.parent,
          showDuration:
              (model.learningObjectTypology == LearningObjectTypology.course));
    }
  }

  Widget? getTabTools(DetailPageModel model, bool isTabHeader) {
    if (model.toolResponseModel != null &&
        model.toolResponseModel?.tools?.isNotEmpty == true) {
      if (isTabHeader) {
        return Tab(
            text: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.instruments));
      } else {
        return ToolsList(model.toolResponseModel!.tools!,
            learningObjectId: model.id);
      }
    }
    return null;
  }

  Widget? getTabRelated(DetailPageModel model, bool isTabHeader) {
    if (model.releatedLearningActivityResponseModel != null &&
        model.releatedLearningActivityResponseModel?.relatedLearningActivities
                ?.isNotEmpty ==
            true) {
      if (isTabHeader) {
        return Tab(
            text: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.related));
      } else {
        return LearningActivityRow(
          items: model.releatedLearningActivityResponseModel!
              .relatedLearningActivities!,
          parentModel: model,
        );
      }
    }
    return null;
  }

  Widget? getTabModules(
      BuildContext context, DetailPageModel model, bool isTabHeader) {
    if ((model.courses?.isNotEmpty == true) ||
        (model.learningActivities?.isNotEmpty == true)) {
      if (isTabHeader) {
        return Tab(
            text: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.modules));
      } else {
        var loCharacterization = CourseLogic().loCharacterizationNew(
          status: model.status ?? "",
          learningObjectType: model.learningObjectType,
          learningObjectTypology: model.learningObjectTypology,
          percentageOfCompletion: model.percentageOfCompletion ?? "0",
          enrollType: model.enrollType ?? EnrollType.autoEnroll,
          ecmSpecialization: model.ecmSpecialization,
          ecmRegistration: model.ecmRegistration,
        );
        return CourseDetailModules(
            model: model,
            parentId: args.parentId,
            onButtonPressed: (int index, bool isACourse,
                LearningObjectModel? ll, CourseModel? cc) {
              if (loCharacterization.buttonEnabled &&
                  (loCharacterization.objLOAction != ObjLOAction.none &&
                      loCharacterization.objLOAction !=
                          ObjLOAction.notApplicable)) {
                int idToAE = model.id!;
                if (args.grandParentId != null) {
                  idToAE = int.parse(args.grandParentId!);
                } else if (args.parentId != null) {
                  idToAE = int.parse(args.parentId!);
                }
                switch (loCharacterization.objLOAction) {
                  case ObjLOAction.none:
                  case ObjLOAction.notApplicable:
                    //do nothing
                    break;
                  case ObjLOAction.startFruition:
                    if (isACourse) {
                      CourseModel cm = model.courses!
                          .where((element) => element.id == index)
                          .single;
                      startOrResumeCheck(context, cm.id!, model);
                    } else {
                      LearningObjectModel lm = model.learningActivities!
                          .where((element) => element.id == index)
                          .single;
                      startOrResumeCheck(context, lm.id, model);
                    }
                    break;
                  case ObjLOAction.autoEnrollmentBottom:
                    context.read<DetailPageCubit>().executeAutoEnrollment(
                        args, idToAE, "BOTTOM", model, false);
                    break;
                  case ObjLOAction.autoEnrollmentAuto:
                    context.read<DetailPageCubit>().executeAutoEnrollment(
                        args, idToAE, "AUTO", model, true);
                    break;
                  case ObjLOAction.autoEnrollmentWithPatch:
                  case ObjLOAction.seeEditions:
                    String? id =
                        ll != null ? ll.id.toString() : cc?.id.toString();
                    if (id != null) {
                      context.pushNamed(
                        DetailPage.routeName,
                        extra: DetailPageArgs(
                          id: id,
                          parentId: model.id.toString(),
                          typology: model.learningObjectTypology,
                          grandParentId: args.parentId,
                          parent: model,
                        ),
                      );
                    }
                    break;
                  case ObjLOAction.ecmNotRegistered:
                    if (kDebugMode) print('ECM module');
                    break;
                  case ObjLOAction.showDetailMaterials:
                  case ObjLOAction.showDetailGoals:
                  case ObjLOAction.showDetailFinalBalance:
                    int? id = ll != null ? ll.id : cc?.id;
                    if (id != null) {
                      context
                          .read<DetailPageCubit>()
                          .getStartOrResumeModel(id, '${model.id}', model);
                    }
                    break;
                  case ObjLOAction.showDetailMeeting:
                    OlAlertDialog.show(
                      context,
                      title: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.show_info),
                      message: LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.from_meeting_info),
                      actionLabel: LabelsManager()
                          .getRemoteStringFromLabelKeys(RemoteLabelKeys.ok),
                    );
                    break;
                }
              }
            });
      }
    }
    return null;
  }

  Widget? getTabEditions(DetailPageModel model, bool isTabHeader) {
    if (model.editionsModel != null &&
        model.editionsModel?.editions?.isNotEmpty == true) {
      if (isTabHeader) {
        return Tab(
            text: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.editions));
      } else {
        return CourseDetailEditions(model: model, args: args);
      }
    }
    return null;
  }

  Widget? getTabOpinions(DetailPageModel model, bool isTabHeader,
      SmartConfiguratorModel? smartConfig) {
    if (smartConfig?.funcCommunity == true &&
        model.sharedPostsModel != null &&
        model.sharedPostsModel?.data?.isNotEmpty == true) {
      if (isTabHeader) {
        return Tab(
            text: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.opinions));
      } else {
        if (ConfigManager()
            .getRemoteBoolean(RemoteConfigKeys.paginate_opinions, false)) {
          return CourseDetailOpinions(model: model, args: args);
        } else {
          return CourseDetailOpinionsNoPage(model: model, args: args);
        }
      }
    }
    return null;
  }

  int contentBarLength(
      BuildContext context, DetailPageModel model, bool isTabHeader) {
    int contentBarLength = 0;
    switch (model.learningObjectTypology) {
      case LearningObjectTypology.course:
        if (model.learningActivities?.isNotEmpty == true) {
          contentBarLength++;
        }
        contentBarLength++;
        if (model.toolResponseModel != null &&
            model.toolResponseModel?.tools?.isNotEmpty == true) {
          contentBarLength++;
        }
        if (model.releatedLearningActivityResponseModel != null &&
            model.releatedLearningActivityResponseModel
                    ?.relatedLearningActivities?.isNotEmpty ==
                true) {
          contentBarLength++;
        }
        if (model.sharedPostsModel != null &&
            model.sharedPostsModel?.data.isNotEmpty == true) {
          contentBarLength++;
        }
        break;
      case LearningObjectTypology.path:
        if ((model.courses?.isNotEmpty == true) ||
            (model.learningActivities?.isNotEmpty == true)) {
          contentBarLength++;
        }
        contentBarLength++;
        if (model.toolResponseModel != null &&
            model.toolResponseModel?.tools?.isNotEmpty == true) {
          contentBarLength++;
        }
        if (model.releatedLearningActivityResponseModel != null &&
            model.releatedLearningActivityResponseModel
                    ?.relatedLearningActivities?.isNotEmpty ==
                true) {
          contentBarLength++;
        }
        if (model.sharedPostsModel != null &&
            model.sharedPostsModel?.data?.isNotEmpty == true) {
          contentBarLength++;
        }
        break;
      default:
        contentBarLength++;
        if (model.editionsModel != null &&
            model.editionsModel?.editions?.isNotEmpty == true) {
          contentBarLength++;
        }
        if (model.toolResponseModel != null &&
            model.toolResponseModel?.tools?.isNotEmpty == true) {
          contentBarLength++;
        }
        if (model.releatedLearningActivityResponseModel != null &&
            model.releatedLearningActivityResponseModel
                    ?.relatedLearningActivities?.isNotEmpty ==
                true) {
          contentBarLength++;
        }
        if (model.sharedPostsModel != null &&
            model.sharedPostsModel?.data.isNotEmpty == true) {
          contentBarLength++;
        }
        break;
    }
    return contentBarLength;
  }

  List<Widget> buildTabContentBar(BuildContext context, DetailPageModel model,
      bool isTabHeader, SmartConfiguratorModel? smartConfig) {
    List<Widget> widgets = [];
    switch (model.learningObjectTypology) {
      case LearningObjectTypology.course:
        Widget? tabActivity = getTabActivity(model, isTabHeader, context);
        if (tabActivity != null) {
          widgets.add(tabActivity);
        }
        widgets.add(getTabDetail(model, isTabHeader));
        Widget? tabInstruments = getTabTools(model, isTabHeader);
        if (tabInstruments != null) {
          widgets.add(tabInstruments);
        }
        Widget? tabRelated = getTabRelated(model, isTabHeader);
        if (tabRelated != null) {
          widgets.add(tabRelated);
        }
        Widget? tabOpinions = getTabOpinions(model, isTabHeader, smartConfig);
        if (tabOpinions != null) {
          widgets.add(tabOpinions);
        }
        break;
      case LearningObjectTypology.path:
        Widget? tabModules = getTabModules(context, model, isTabHeader);
        if (tabModules != null) {
          widgets.add(tabModules);
        }
        widgets.add(getTabDetail(model, isTabHeader));
        Widget? tabInstruments = getTabTools(model, isTabHeader);
        if (tabInstruments != null) {
          widgets.add(tabInstruments);
        }
        Widget? tabRelated = getTabRelated(model, isTabHeader);
        if (tabRelated != null) {
          widgets.add(tabRelated);
        }
        Widget? tabOpinions = getTabOpinions(model, isTabHeader, smartConfig);
        if (tabOpinions != null) {
          widgets.add(tabOpinions);
        }
        break;
      default:
        widgets.add(getTabDetail(model, isTabHeader));
        Widget? tabEditions = getTabEditions(model, isTabHeader);
        if (tabEditions != null) {
          widgets.add(tabEditions);
        }
        Widget? tabInstruments = getTabTools(model, isTabHeader);
        if (tabInstruments != null) {
          widgets.add(tabInstruments);
        }
        Widget? tabRelated = getTabRelated(model, isTabHeader);
        if (tabRelated != null) {
          widgets.add(tabRelated);
        }
        Widget? tabOpinions = getTabOpinions(model, isTabHeader, smartConfig);
        if (tabOpinions != null) {
          widgets.add(tabOpinions);
        }
        break;
    }
    return widgets;
  }

  Widget ratingStars(DetailPageModel model) {
    return BlocConsumer<RatingCubit, RatingState>(
      listener: (context, state) {},
      buildWhen: (previous, current) => current.maybeMap(
        Error: (_) => false,
        orElse: () => true,
      ),
      builder: (context, state) => state.maybeWhen(
        Success: (rating, maxStars, previousRating) =>
            _ratingStarButton(model, rating, maxStars, context, previousRating),
        orElse: () => const SizedBox(),
      ),
    );
  }

  Widget _ratingStarButton(DetailPageModel model, ObjectStatisticsDto? rating,
      int? maxStars, BuildContext buildContext, int? previousRating) {
    String iconPath = buildContext
        .read<RatingCubit>()
        .getRatingIconButton(rating, maxStars: maxStars);
    return GestureDetector(
      onTap: () async {
        await showDialog(
          context: buildContext,
          barrierColor:
              ColorManager().getColorBackgroundDrawerWidget().withOpacity(.5),
          builder: (_) => RatingsDialog(
            detailPageModel: model,
            max: maxStars ?? 5,
            initialRating: previousRating ?? 0,
          ),
        );
        if (buildContext.mounted) {
          buildContext.read<RatingCubit>().updateRating(model);
        }
      },
      behavior: HitTestBehavior.translucent,
      child: Transform.scale(
          scale: 0.9999,
          child: SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(
              ColorManager().getColorBackgroundPrimaryCta(),
              BlendMode.srcIn,
            ),
          )),
    );
  }
}

class DetailPageArgs {
  final String id;
  final LearningObjectTypology typology;
  final String? parentId;
  final String? grandParentId;
  final DetailPageModel? parent;

  DetailPageArgs({
    required this.id,
    required this.typology,
    this.parentId,
    this.grandParentId,
    this.parent,
  });
}
