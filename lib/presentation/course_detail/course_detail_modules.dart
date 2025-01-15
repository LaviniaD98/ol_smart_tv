import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/course_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/list_header_title.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/lo_types.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../domain/entities/detail/detail_page_model.dart';
import '../../domain/enums/types.dart';
import '../common/widgets/card_modulo.dart';
import '../common/widgets/dialog/ol_alert_dialog.dart';
import 'common/course_logic.dart';

class CommonObject {
  int orderNumber;
  CourseModel? course;
  LearningObjectModel? activity;

  CommonObject({required this.orderNumber, this.course, this.activity});
}

class CourseDetailModules extends StatefulWidget {
  final DetailPageModel model;
  final String? parentId;
  final void Function(CourseModel)? onLearningActivityFocused;
  final void Function(
    LearningObjectModel?,
    CourseModel?,
    bool isSubActivities,
  )? onResumeButtonFocused;
  final Function(
    int index,
    bool isACourse,
    LearningObjectModel? ll,
    CourseModel? cc,
  ) onButtonPressed;

  final bool isSubActivitites;
  final bool autoFocus;

  const CourseDetailModules({
    super.key,
    required this.model,
    required this.parentId,
    required this.onButtonPressed,
    this.onLearningActivityFocused,
    this.onResumeButtonFocused,
    this.isSubActivitites = false,
    this.autoFocus = false,
  });

  @override
  State<CourseDetailModules> createState() => _CourseDetailModulesState();
}

class _CourseDetailModulesState extends State<CourseDetailModules> {
  final autoScrollController = AutoScrollController(
    viewportBoundaryGetter: () => const Rect.fromLTRB(0, 440, 0, 0),
    axis: Axis.vertical,
  );
  late OlFocusScopeNode _focusNode;
  final OrderedTraversalPolicy _policy = OrderedTraversalPolicy();

  List<CommonObject> commonObjects = [];
  bool isStarting = true;

  @override
  void initState() {
    super.initState();

    _focusNode = OlFocusScopeNode(id: 'CourseDetailModules${widget.model.id}');

    if (widget.autoFocus) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (context.mounted) {
          _focusNode.requestFocus();
        }
      });
    }

    if (widget.isSubActivitites) {
      context.read<DetailPageCubit>().subActivitiesFocusNode = _focusNode;
    } else {
      context.read<DetailPageCubit>().detailsFocusNode = _focusNode;
    }

    for (var course in widget.model.courses ?? <CourseModel>[]) {
      commonObjects.add(
        CommonObject(orderNumber: course.prereqOrderNumber!, course: course),
      );
    }
    for (var activity in widget.model.learningActivities!) {
      commonObjects.add(
        CommonObject(
          orderNumber: activity.prereqOrderNumber!,
          activity: activity,
        ),
      );
    }
    commonObjects.sort((a, b) => a.orderNumber.compareTo(b.orderNumber));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CallbackShortcuts(
          bindings: <ShortcutActivator, VoidCallback>{
            const SingleActivator(LogicalKeyboardKey.arrowUp): () {
              if (currentIndex == 0) {
                return;
              }
              _policy.previous(_focusNode);
            },
            const SingleActivator(LogicalKeyboardKey.arrowDown): () {
              if (currentIndex == (commonObjects.length - 1)) {
                return;
              }
              _policy.next(_focusNode);
            },
          },
          child: FocusScope(
            node: _focusNode,
            onFocusChange: (value) {
              if (value) {
                if (_focusNode.focusedChild == null) {
                  final firstFocus = _policy.findFirstFocus(_focusNode);
                  firstFocus?.requestFocus();
                }
              }
            },
            child: Container(
              color: OLColors.backgroundPrimary,
              child: FocusTraversalGroup(
                key: LabeledGlobalKey('FocusTraversalGroup - Main'),
                policy: _policy,
                child: ListView.builder(
                  controller: autoScrollController,
                  itemCount: commonObjects.length,
                  addAutomaticKeepAlives: true,
                  padding: const EdgeInsets.only(bottom: 800, top: 140),
                  itemBuilder: (context, index) {
                    LearningObjectModel? ll = commonObjects[index].activity;
                    CourseModel? cc = commonObjects[index].course;

                    bool bIsEnabled = true;
                    objLOCharacterization? ccCh;
                    if (cc != null) {
                      ccCh = CourseLogic().loCharacterizationNew(
                        status: cc.status ?? "",
                        learningObjectType: cc.learningObjectType,
                        learningObjectTypology: cc.learningObjectTypology,
                        percentageOfCompletion:
                            cc.percentageOfCompletion ?? "0",
                        enrollType: cc.enrollType ?? EnrollType.autoEnroll,
                        ecmSpecialization: widget.model.ecmSpecialization,
                        ecmRegistration: widget.model.ecmRegistration,
                        isSubModule: true,
                      );
                      bIsEnabled = ccCh.buttonEnabled && cc.isEnable == true;
                    }

                    objLOCharacterization? llCh;

                    if (ll != null) {
                      llCh = CourseLogic().loCharacterizationNew(
                        status: ll.status ?? "",
                        learningObjectType: ll.learningObjectType,
                        learningObjectTypology: ll.learningObjectTypology,
                        percentageOfCompletion:
                            ll.percentageOfCompletion ?? "0",
                        enrollType: ll.enrollType ?? EnrollType.autoEnroll,
                        ecmSpecialization: widget.model.ecmSpecialization,
                        ecmRegistration: widget.model.ecmRegistration,
                        isSubModule: true,
                      );
                      bIsEnabled = llCh.buttonEnabled && ll.isEnable == true;
                    }

                    /*
                     if (bIsEnabled) {
                            context.pushNamed(
                              DetailPage.routeName,
                              extra: DetailPageArgs(
                                id: cc.id.toString(),
                                typology: LearningObjectTypology.course,
                                parentId: widget.model.id?.toString(),
                                grandParentId: widget.parentId?.toString(),
                                parent: widget.model,
                              ),
                            );
                          }
                          ------------
                          if (bIsEnabled) {
                                context.pushNamed(
                                  DetailPage.routeName,
                                  extra: DetailPageArgs(
                                    id: ll.id.toString(),
                                    typology: ll.learningObjectTypology,
                                    parentId: widget.model.id?.toString(),
                                    grandParentId: widget.parentId?.toString(),
                                    parent: widget.model,
                                  ),
                                );
                              }
                    */

                    if (cc != null) {
                      return FocusTraversalOrder(
                        order: NumericFocusOrder(index.toDouble()),
                        child: AutoScrollTag(
                          key: ValueKey(index),
                          controller: autoScrollController,
                          index: index,
                          child: CardModulo(
                            index: index,
                            type: cc.learningObjectTypology,
                            parentFocus: _focusNode,
                            imageUrl: cc.coverPublicURL ?? "",
                            tipoText: cc.learningObjectType
                                .getTranslatedValue()
                                .toString(),
                            progressPercentage: CourseLogic()
                                .getCompletionPercentageFromString(
                                    cc.percentageOfCompletion),
                            titolo: cc.title ?? "",
                            buttonTitle: ccCh!.buttonTitle,
                            descrizione: cc.shortDescription ?? "",
                            durataMinuti: cc.duration,
                            numAttivita: cc.learningActivityNumber,
                            numRisorse: cc.toolNumber,
                            isSubActivities: widget.isSubActivitites,
                            onButtonPressed: (_) {
                              if (bIsEnabled) {
                                if (ccCh!.ctaMessage.isNotEmpty) {
                                  // TODO: Gestire le traduzioni!!
                                  OlAlertDialog.show(
                                    context,
                                    title: "Attenzione",
                                    message:
                                        "Contatta il tuo responsabile per farti iscrivere al contenuto",
                                    actionLabel: "Ok",
                                  );
                                } else {
                                  widget.onButtonPressed(cc.id!, true, ll, cc);
                                }
                              }
                            },
                            onDownloadPressed: (_) {},
                            isEnabled: bIsEnabled,
                            onModuleButtonFocused: (type) {
                              if (type == ButtonFocusedType.resume) {
                                widget.onResumeButtonFocused
                                    ?.call(null, cc, widget.isSubActivitites);
                              } else if (type ==
                                  ButtonFocusedType.learningActivities) {
                                widget.onLearningActivityFocused?.call(cc);
                              }
                            },
                            onFocusChange: (hasFocus) {
                              if (hasFocus) {
                                scrollToPosition(index);
                              }
                            },
                            hasBadge: cc.badge != null,
                            isCompleted: cc.status == "C",
                            status: cc.status,
                          ),
                        ),
                      );
                    } else if (ll != null) {
                      return FocusTraversalOrder(
                        order: NumericFocusOrder(index.toDouble()),
                        child: AutoScrollTag(
                          key: ValueKey(index),
                          controller: autoScrollController,
                          index: index,
                          child: CardModulo(
                            index: index,
                            type: ll.learningObjectTypology,
                            parentFocus: _focusNode,
                            imageUrl: ll.coverPublicURL ?? "",
                            tipoText: ll.learningObjectType
                                .getTranslatedValue()
                                .toString(),
                            progressPercentage: CourseLogic()
                                .getCompletionPercentageFromString(
                                    ll.percentageOfCompletion),
                            titolo: ll.title ?? "",
                            buttonTitle: llCh!.buttonTitle,
                            descrizione: ll.shortDescription ?? "",
                            durataMinuti: ll.duration,
                            numAttivita: null,
                            numRisorse: ll.toolNumber,
                            isSubActivities: widget.isSubActivitites,
                            onModuleButtonFocused: (type) {
                              if (type == ButtonFocusedType.resume) {
                                widget.onResumeButtonFocused
                                    ?.call(ll, cc, widget.isSubActivitites);
                              }
                            },
                            onFocusChange: (hasFocus) {
                              if (hasFocus) {
                                scrollToPosition(index);
                              }
                            },
                            onButtonPressed: (_) {
                              if (bIsEnabled) {
                                if (llCh!.ctaMessage.isNotEmpty) {
                                  // TODO: Gestire le traduzioni!!
                                  OlAlertDialog.show(
                                    context,
                                    title: "Attenzione",
                                    message:
                                        "Contatta il tuo responsabile per farti iscrivere al contenuto",
                                    actionLabel: "Ok",
                                  );
                                } else {
                                  widget.onButtonPressed(ll.id, false, ll, cc);
                                }
                              }
                            },
                            onDownloadPressed: (_) {},
                            isEnabled: bIsEnabled,
                            hasBadge:
                                (ll.badge != null || ll.certificate != null),
                            isCompleted: ll.status == "C",
                            status: ll.status,
                          ),
                        ),
                      );
                    } else {
                      return const Text("");
                    }
                  },
                ),
              ),
            ),
          ),
        ),
        if (widget.model.learningObjectTypology ==
            LearningObjectTypology.course) ...[
          ListHeaderTitle(
            title: commonObjects.length == 1
                ? LabelsManager()
                    .getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.count_learning_object,
                    )
                    .replaceFirst('{{count}}', '1')
                : LabelsManager()
                    .getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.count_learning_objects,
                    )
                    .replaceFirst('{{count}}', '${commonObjects.length}'),
          ),
        ] else ...[
          ListHeaderTitle(
            title: commonObjects.length == 1
                ? LabelsManager()
                    .getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.count_modules_object,
                    )
                    .replaceFirst('{{count}}', '1')
                : LabelsManager()
                    .getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.count_modules_objects,
                    )
                    .replaceFirst('{{count}}', '${commonObjects.length}'),
          ),
        ],
      ],
    );
  }

  int? currentIndex;

  Future<void> scrollToPosition(int index) async {
    currentIndex = index;
    await autoScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
    );
  }
}
