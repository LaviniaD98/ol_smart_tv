import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/data/models/responses/generic/object_statistics_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/list_header_title.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/course_logic.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/lo_types.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/course_detail_editions.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/course_detail_opinions_no_page.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/rating/rating_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/learning_activity_row.dart';
import 'package:open_learning_smart_tv/presentation/video_player/cubit/video_player_cubit.dart';
import 'package:open_learning_smart_tv/presentation/web_player/cubit/web_view_page_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/config/config_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/config/remote_config_keys.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/presentation/web_player/web_view_page.dart';
import 'package:open_learning_smart_tv/router/app_router.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:open_learning_smart_tv/wrappers/tracking/tracking_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import '../../color_management/color_manager.dart';
import '../../domain/entities/generic/course_model.dart';
import '../../domain/entities/smart_configurator/smart_configurator_model.dart';
import '../common/widgets/dialog/ol_alert_dialog.dart';
import '../common/widgets/error/error_screen.dart';
import '../common/widgets/rating/ratings_dialog.dart';
import '../dynamic_content/strip/community/detail/post_detail_page_connector.dart';
import '../video_player/video_player_page.dart';
import 'course_detail_modules.dart';
import 'course_detail_opinions.dart';
import 'details_tab.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/dynamic_sliver_detail_header.dart';
import 'widgets/tools/tools_list.dart';

class DetailPage extends StatefulWidget {
  final DetailPageArgs args;

  static String routeName = 'detail';

  const DetailPage({
    super.key,
    required this.args,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _focusNode = FocusScopeNode(debugLabel: 'DetailPage');
  final _focusNodeLeft = FocusScopeNode(debugLabel: 'DetailPage - Left Panel');
  final _focusNodeRight =
      FocusScopeNode(debugLabel: 'DetailPage - Right Panel');

  final ValueNotifier<bool> _expanded = ValueNotifier(false);
  final ValueNotifier<RightPanelState> _rightPanelState = ValueNotifier(
    RightPanelState.start,
  );
  final ValueNotifier<RightPanelState> _subRightPanelState = ValueNotifier(
    RightPanelState.details,
  );

  final ValueNotifier<Future<DetailPageModel?>?> _subDetailsFutureNotifier =
      ValueNotifier(null);
  final ValueNotifier<Object?> currentModule = ValueNotifier(null);

  String? currentSubActivityId;

  @override
  void initState() {
    super.initState();

    //context.read<DetailPageCubit>().mainNode = _focusNode;
    context.read<DetailPageCubit>().leftPanelNode = _focusNodeLeft;
    context.read<DetailPageCubit>().rightPanelNode = _focusNodeRight;

    Future.delayed(const Duration(milliseconds: 1000), () {
      final focus = _focusNodeLeft.descendants.firstWhereOrNull((element) {
        return element.debugLabel == 'BUTTON DETAILS CONTINUE';
      });
      focus?.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _focusNodeLeft.dispose();
    _focusNodeRight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            await OlAlertDialog.show(
              context,
              title: LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
              message: message,
              actionLabel: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.continue_button),
              barrierDismissible: false,
            );
            return null;
          },
          readyToPlay: (model, detail) => startPlay(context, model, detail),
          openDetail: (model, detail) {
            context.pushNamed(
              DetailPage.routeName,
              extra: DetailPageArgs(
                id: model.id.toString(),
                object: model,
                parentId: widget.args.id,
                typology: model.learningObjectTypology,
                grandParentId: widget.args.parentId,
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
              context.read<DetailPageCubit>().init(widget.args);
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
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (selectedIndex, model, smartConfig) {
              return _content(context, selectedIndex, model, smartConfig);
            },
            error: () => Center(
              child: ErrorScreen(
                title: LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                message: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.error_occurred),
                onReload: () => {context.pop()},
              ),
            ),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }

  bool expanded = false;

  bool descriptionFocused = false;

  Widget _content(
    BuildContext context,
    int selectedIndex,
    DetailPageModel model,
    SmartConfiguratorModel? smartConfig,
  ) {
    return FocusScope(
      node: _focusNode,
      child: Container(
        color: OLColors.backgroundPrimary,
        child: Row(
          children: [
            CallbackShortcuts(
              bindings: <ShortcutActivator, VoidCallback>{
                const SingleActivator(LogicalKeyboardKey.arrowRight): () {
                  if (_rightPanelState.value == RightPanelState.related) {
                    if ((model.releatedLearningActivityResponseModel
                                ?.relatedLearningActivities ??
                            [])
                        .isNotEmpty) {
                      _focusNodeRight.requestFocus();
                    }
                  } else {
                    _focusNodeRight.requestFocus();
                  }
                },
              },
              child: FocusScope(
                node: _focusNodeLeft,
                onFocusChange: (value) {
                  if (value) {
                    _expanded.value = false;
                  }
                },
                child: ValueListenableBuilder(
                  valueListenable: _expanded,
                  builder: (context, expanded, _) {
                    return AnimatedContainer(
                      curve: Curves.easeInOut,
                      width: expanded ? 40 : 870,
                      duration: const Duration(milliseconds: 500),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 0,
                            child: buildLeftPanel(model: model),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: buildRightPanel(model: model),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRightPanel({required DetailPageModel model}) {
    return ValueListenableBuilder<RightPanelState>(
      valueListenable: _rightPanelState,
      builder: (context, state, _) {
        return FocusScope(
          node: _focusNodeRight,
          onFocusChange: (value) {
            if (value) {
              if (state == RightPanelState.start) {
                _expanded.value = true;
              }

              if (_focusNodeRight.focusedChild == null) {
                final focus = _focusNodeRight.descendants.firstOrNull;
                focus?.requestFocus();
              }
            }
          },
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child: Builder(
                  builder: (context) {
                    return SizedBox(
                      width: 1710,
                      child: Row(
                        children: [
                          Expanded(
                            child: ValueListenableBuilder(
                              valueListenable: _rightPanelState,
                              builder: (context, value, child) {
                                if (value == RightPanelState.start) {
                                  return getTabModules(context, model, false);
                                } else if (value == RightPanelState.details) {
                                  return getTabDetail(model, false);
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          ),
                          const VerticalDivider(
                            thickness: 1,
                            width: 1,
                            color: OLColors.divider,
                          ),
                          Expanded(
                            child: ValueListenableBuilder(
                              valueListenable: currentModule,
                              builder: (context, value, child) {
                                return ValueListenableBuilder(
                                  valueListenable: _subRightPanelState,
                                  builder: (context, state, child) {
                                    if (state == RightPanelState.details) {
                                      String? description;

                                      if (value is LearningObjectModel) {
                                        description = value.longDescription;
                                      } else if (value is CourseModel) {
                                        description = value.shortDescription;
                                      }
                                      return buildDescriptionWidget(
                                        description: description,
                                      );
                                    } else if (state ==
                                        RightPanelState.subActivities) {
                                      return buildSubActivitiesWidget();
                                    }
                                    return const SizedBox.shrink();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildSubActivitiesWidget() {
    return ValueListenableBuilder(
      valueListenable: _subDetailsFutureNotifier,
      builder: (context, value, child) {
        return FutureBuilder(
          future: value,
          builder:
              (BuildContext context, AsyncSnapshot<DetailPageModel?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return const SizedBox.shrink();
              }

              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 140.0),
                    child: getTabModules(
                      context,
                      snapshot.data!,
                      false,
                      autoFocus: true,
                      isSubActivities: true,
                    ),
                  ),
                  ListHeaderTitle(
                    title:
                        '${snapshot.data?.learningActivities?.length ?? 0} Attività didattiche',
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const SizedBox.shrink();
            }
          },
        );
      },
    );
  }

  Widget buildLeftPanel({required DetailPageModel model}) {
    return SizedBox(
      width: 870,
      child: DynamicSliverDetailHeader(
        model: model,
        isSliver: false,
        args: widget.args,
        rightPanelState: _rightPanelState,
      ),
    );
  }

  void startOrResumeCheck(
    BuildContext context,
    int loId,
    DetailPageModel detail,
  ) {
    String parentId = (widget.args.parentId == null ||
            widget.args.parentId!.toLowerCase() == "null")
        ? loId.toString()
        : widget.args.parentId!;
    context
        .read<DetailPageCubit>()
        .getStartOrResumeModel(loId, parentId, detail);
  }

  void startPlay(
    BuildContext context,
    LearningObjectModel lo,
    DetailPageModel detail,
  ) async {
    print('WEAAAA-------1-------');
    if (lo.fruitionFlag == true) {
      print('WEAAAA-------2-------');
      if (lo.learningObjectTypology != LearningObjectTypology.externalRes) {
        print('WEAAAA-------3-------');
        if (lo.link != null && context.mounted) {
          print('WEAAAA-------4-------${lo.learningObjectTypology}');
          WakelockPlus.enable();

          await Nav.push(
            context,
            screen: BlocProvider(
              create: (_) =>
                  getIt<WebViewPageCubit>()..init(WebViewPageArgs(model: lo)),
              child: WebViewPage(
                args: WebViewPageArgs(model: lo),
                isYoutube:
                    lo.learningObjectTypology == LearningObjectTypology.youtube,
              ),
            ),
          ) as bool?;

          WakelockPlus.disable();
          if (context.mounted) {
            context.read<DetailPageCubit>().refreshContinueLearningStrip();
            context.read<DetailPageCubit>().init(widget.args);
          }
        } else {
          print('WEAAAA-------5-------');
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
        print('WEAAAA-------6-------');
        WakelockPlus.enable();

        final args = VideoPlayerPageArgs(
          id: lo.id,
          title: lo.title ?? '',
          typology: lo.learningObjectTypology,
          type: lo.learningObjectType,
          isMandatory: lo.isMandatory ?? false,
          brightcoveId: lo.brightcoveId,
          pathId: widget.args.parentId,
          tentativeId: "${lo.tentativeId}",
          onTapDetail: () async {
            // TODO(UmbertoGrimaldi): CHECK THIS / PROPOSAL TO REMOVE
            // final subNavigationTypes = [
            //   LearningObjectTypology.course,
            //   LearningObjectTypology.path
            // ];
            // context.pop();

            // if (subNavigationTypes.contains(detail.learningObjectTypology)) {
            //   /// navigate to detail sub route
            //   await context.pushNamed(
            //     DetailPage.routeName,
            //     extra: DetailPageArgs(
            //       id: lo.id.toString(),
            //       object: lo,
            //       parentId: lo.id == detail.id ? null : detail.id.toString(),
            //       typology: lo.learningObjectTypology,
            //       grandParentId:
            //           lo.id == detail.id ? null : widget.args.parentId,
            //       parent: detail,
            //     ),
            //   );

            //   /// reload parent detail
            //   if (context.mounted)
            //     context.read<DetailPageCubit>().init(widget.args);
            // } else {
            //   /// reload parent detail
            //   context.read<DetailPageCubit>().init(widget.args);
            // }
          },
        );

        final res = await Nav.push(
          context,
          screen: BlocProvider(
            create: (_) =>
                getIt<VideoPlayerCubit>()..init(args.brightcoveId, args),
            child: VideoPlayerPage(args: args),
          ),
        ) as bool?;

        print('RESPONSE; ${res}');

        WakelockPlus.disable();
        if (res != null && res && context.mounted) {
          /// reload detail
          context.read<DetailPageCubit>().init(widget.args);
        }
      }
    } else {
      OlAlertDialog.show(
        context,
        title:
            LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
        message: LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.details_no_fruition),
        actionLabel: LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.continue_button),
        barrierDismissible: false,
      );
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
            grandParentId: widget.args.parentId,
            parentId: model.id.toString(),
            enable: !(loCharacterization.objLOAction ==
                ObjLOAction.ecmNotRegistered),
            returnFromDetailCallback: () {
              if (context.mounted) {
                context.read<DetailPageCubit>().refreshContinueLearningStrip();
                context.read<DetailPageCubit>().init(widget.args);
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
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 140.0),
            child: DetailsTab(
              model: model,
              parentModel: widget.args.parent,
              showDuration: (model.learningObjectTypology ==
                  LearningObjectTypology.course),
            ),
          ),
          const ListHeaderTitle(title: 'Dettagli del Percorso'),
        ],
      );
    }
  }

  Widget buildDescriptionWidget({String? description}) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 140.0,
            left: Dimens.hViewPadding,
            right: Dimens.hViewPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.what_to_expect),
                style: AppTextTheme.title(
                  color: ColorManager().getColorTextPrimaryCta(),
                  size: 24,
                ),
              ),
              const SizedBox(height: 12),
              if (description != null) ...[
                Text(
                  description,
                  style: AppTextTheme.subtitle(
                    color: ColorManager().getColorTextPrimary(),
                    weight: FontWeight.w500,
                    size: 20,
                  ),
                ),
              ],
            ],
          ),
        ),
        const ListHeaderTitle(title: 'Dettagli del Percorso'),
      ],
    );
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
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 140.0),
              child: LearningActivityRow(
                items: model.releatedLearningActivityResponseModel!
                    .relatedLearningActivities!,
                isGridView: true,
                parentModel: model,
              ),
            ),
            const ListHeaderTitle(title: 'Dettagli del Percorso'),
          ],
        );
      }
    }
    return null;
  }

  Widget getTabModules(
    BuildContext context,
    DetailPageModel model,
    bool isTabHeader, {
    bool isSubActivities = false,
    bool autoFocus = false,
  }) {
    if ((model.courses?.isNotEmpty == true) ||
        (model.learningActivities?.isNotEmpty == true)) {
      if (isTabHeader) {
        return Tab(
          text: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.modules),
        );
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
          autoFocus: autoFocus,
          isSubActivitites: isSubActivities,
          parentId: widget.args.parentId,
          onResumeButtonFocused: (ll, cc) {
            currentModule.value = cc ?? ll;
            _subRightPanelState.value = RightPanelState.details;
          },
          onLearningActivityFocused: (cc) async {
            _subRightPanelState.value = RightPanelState.subActivities;

            if (currentSubActivityId != cc.id.toString()) {
              currentSubActivityId == cc.id.toString();
              _subDetailsFutureNotifier.value =
                  context.read<DetailPageCubit>().getCourseDetails(
                        args: DetailPageArgs(
                          id: cc.id.toString(),
                          parentId: model.id.toString(),
                          parent: model,
                          object: null,
                          typology: cc.learningObjectTypology,
                        ),
                      );
            }
          },
          onButtonPressed: (
            int index,
            bool isACourse,
            LearningObjectModel? ll,
            CourseModel? cc,
          ) {
            if (loCharacterization.buttonEnabled &&
                (loCharacterization.objLOAction != ObjLOAction.none &&
                    loCharacterization.objLOAction !=
                        ObjLOAction.notApplicable)) {
              int idToAE = model.id!;
              if (widget.args.grandParentId != null) {
                idToAE = int.parse(widget.args.grandParentId!);
              } else if (widget.args.parentId != null) {
                idToAE = int.parse(widget.args.parentId!);
              }
              print(
                  'loCharacterization.objLOAction: ${loCharacterization.objLOAction}');

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
                      widget.args, idToAE, "BOTTOM", model, false);
                  break;
                case ObjLOAction.autoEnrollmentAuto:
                  context.read<DetailPageCubit>().executeAutoEnrollment(
                      widget.args, idToAE, "AUTO", model, true);
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
                        object: ll,
                        parentId: model.id.toString(),
                        typology: model.learningObjectTypology,
                        grandParentId: widget.args.parentId,
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
          },
        );
      }
    }
    return const SizedBox.shrink();
  }

  Widget? getTabEditions(DetailPageModel model, bool isTabHeader) {
    if (model.editionsModel != null &&
        model.editionsModel?.editions?.isNotEmpty == true) {
      if (isTabHeader) {
        return Tab(
            text: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.editions));
      } else {
        return CourseDetailEditions(model: model, args: widget.args);
      }
    }
    return null;
  }

  Widget? getTabOpinions(DetailPageModel model, bool isTabHeader,
      SmartConfiguratorModel? smartConfig) {
    if (smartConfig?.funcCommunity == true &&
        model.sharedPostsModel != null &&
        model.sharedPostsModel?.data.isNotEmpty == true) {
      if (isTabHeader) {
        return Tab(
            text: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.opinions));
      } else {
        if (ConfigManager()
            .getRemoteBoolean(RemoteConfigKeys.paginate_opinions, false)) {
          return CourseDetailOpinions(model: model, args: widget.args);
        } else {
          return CourseDetailOpinionsNoPage(model: model, args: widget.args);
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
            model.sharedPostsModel?.data.isNotEmpty == true) {
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
        Widget tabModules = getTabModules(context, model, isTabHeader);
        widgets.add(tabModules);
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
  final LearningObjectModel? object;

  DetailPageArgs({
    required this.id,
    required this.typology,
    this.object,
    this.parentId,
    this.grandParentId,
    this.parent,
  });
}

enum RightPanelState {
  start,
  details,
  related,
  subActivities,
}
