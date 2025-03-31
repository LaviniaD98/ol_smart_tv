import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/course_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/card_modulo.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/card_modulo_horizontal.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/learning_card.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/course_logic.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/lo_types.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/course_detail_modules.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../domain/entities/detail/detail_page_model.dart';

class CourseDetailHorizontalModules extends StatefulWidget {
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

  const CourseDetailHorizontalModules({
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
  State<CourseDetailHorizontalModules> createState() =>
      _CourseDetailHorizontalModulesState();
}

class _CourseDetailHorizontalModulesState
    extends State<CourseDetailHorizontalModules> {
  final autoScrollController = AutoScrollController(
    viewportBoundaryGetter: () => const Rect.fromLTRB(100, 0, 0, 0),
    axis: Axis.horizontal,
  );
  late OlFocusScopeNode _focusNode;
  final OrderedTraversalPolicy _policy = OrderedTraversalPolicy();

  List<CommonObject> commonObjects = [];
  bool isStarting = true;

  @override
  void initState() {
    super.initState();

    _focusNode =
        OlFocusScopeNode(id: 'CourseDetailHorizontalModules${widget.model.id}');

    if (widget.autoFocus) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (context.mounted) {
          _focusNode.requestFocus();
        }
      });
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
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          _focusNode.focusInDirection(TraversalDirection.left);
        },
        const SingleActivator(LogicalKeyboardKey.arrowRight): () {
          _focusNode.focusInDirection(TraversalDirection.right);
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
        child: Align(
          child: SizedBox(
            height: 240,
            child: FocusTraversalGroup(
              key: LabeledGlobalKey('FocusTraversalGroup - Main'),
              policy: _policy,
              child: ListView.builder(
                controller: autoScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: commonObjects.length,
                padding: const EdgeInsets.only(
                  left: Dimens.hPadding,
                  right: Dimens.hPadding,
                  top: 20,
                  bottom: 20,
                ),
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
                      percentageOfCompletion: cc.percentageOfCompletion ?? "0",
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
                      percentageOfCompletion: ll.percentageOfCompletion ?? "0",
                      enrollType: ll.enrollType ?? EnrollType.autoEnroll,
                      ecmSpecialization: widget.model.ecmSpecialization,
                      ecmRegistration: widget.model.ecmRegistration,
                      isSubModule: true,
                    );
                    bIsEnabled = llCh.buttonEnabled && ll.isEnable == true;
                  }

                  if (cc != null) {
                    return FocusTraversalOrder(
                      order: NumericFocusOrder(index.toDouble()),
                      child: AutoScrollTag(
                        key: ValueKey(index),
                        controller: autoScrollController,
                        index: index,
                        child: CardModuloHorizontal(
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
                        child: CardModuloHorizontal(
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
                  }

                  /*
                  //bool bIsEnabled = true;
                   objLOCharacterization? ccCh;
                  if (cc != null) {
                    ccCh = CourseLogic().loCharacterizationNew(
                      status: cc.status ?? "",
                      learningObjectType: cc.learningObjectType,
                      learningObjectTypology: cc.learningObjectTypology,
                      percentageOfCompletion: cc.percentageOfCompletion ?? "0",
                      enrollType: cc.enrollType ?? EnrollType.autoEnroll,
                      ecmSpecialization: widget.model.ecmSpecialization,
                      ecmRegistration: widget.model.ecmRegistration,
                      isSubModule: true,
                    );
                    //bIsEnabled = ccCh.buttonEnabled && cc.isEnable == true;
                  }

               
                 objLOCharacterization? llCh;

                  if (ll != null) {
                    llCh = CourseLogic().loCharacterizationNew(
                      status: ll.status ?? "",
                      learningObjectType: ll.learningObjectType,
                      learningObjectTypology: ll.learningObjectTypology,
                      percentageOfCompletion: ll.percentageOfCompletion ?? "0",
                      enrollType: ll.enrollType ?? EnrollType.autoEnroll,
                      ecmSpecialization: widget.model.ecmSpecialization,
                      ecmRegistration: widget.model.ecmRegistration,
                      isSubModule: true,
                    );
                    //bIsEnabled = llCh.buttonEnabled && ll.isEnable == true;
                  }
                  */

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
                    // return FocusTraversalOrder(
                    //     order: NumericFocusOrder(index.toDouble()),
                    //     child: AutoScrollTag(
                    //         key: ValueKey(index),
                    //         controller: autoScrollController,
                    //         index: index,
                    //         child: CallbackShortcuts(
                    //           bindings: <ShortcutActivator, VoidCallback>{
                    //             const SingleActivator(LogicalKeyboardKey.enter):
                    //                 () {
                    //               widget.onButtonPressed(ll.id, false, ll, cc);
                    //             },
                    //             const SingleActivator(
                    //                 LogicalKeyboardKey.select): () {
                    //               widget.onButtonPressed(ll.id, false, ll, cc);
                    //             },
                    //           },
                    //           child: LearningCard(
                    //             data: ll,
                    //             onFocusChange: (hasFocus) {
                    //               if (hasFocus) {
                    //                 scrollToPosition(index);
                    //               }
                    //             },
                    //           ),
                    //         )));
                    return Container(
                      height: 150,
                      width: 200,
                      color: Colors.green,
                      margin: EdgeInsets.all(6),
                    );
                  }

                  if (ll != null) {
                    return FocusTraversalOrder(
                      order: NumericFocusOrder(index.toDouble()),
                      child: AutoScrollTag(
                          key: ValueKey(index),
                          controller: autoScrollController,
                          index: index,
                          child: CallbackShortcuts(
                            bindings: <ShortcutActivator, VoidCallback>{
                              const SingleActivator(LogicalKeyboardKey.enter):
                                  () {
                                widget.onButtonPressed(ll.id, false, ll, cc);
                              },
                              const SingleActivator(LogicalKeyboardKey.select):
                                  () {
                                widget.onButtonPressed(ll.id, false, ll, cc);
                              },
                            },
                            child: LearningCard(
                              data: ll,
                              onFocusChange: (hasFocus) {
                                if (hasFocus) {
                                  scrollToPosition(index);
                                }
                              },
                            ),
                          )

                          //  CardModulo(
                          //   index: index,
                          //   type: widget.model.learningObjectTypology,
                          //   parentFocus: _focusNode,
                          //   imageUrl: ll.coverPublicURL ?? "",
                          //   tipoText: ll.learningObjectType
                          //       .getTranslatedValue()
                          //       .toString(),
                          //   progressPercentage: CourseLogic()
                          //       .getCompletionPercentageFromString(
                          //           ll.percentageOfCompletion),
                          //   titolo: ll.title ?? "",
                          //   buttonTitle: llCh!.buttonTitle,
                          //   descrizione: ll.shortDescription ?? "",
                          //   durataMinuti: ll.duration,
                          //   numAttivita: null,
                          //   numRisorse: ll.toolNumber,
                          //   isSubActivities: widget.isSubActivitites,
                          //   onModuleButtonFocused: (type) {
                          //     if (type == ButtonFocusedType.resume) {
                          //       widget.onResumeButtonFocused
                          //           ?.call(ll, cc, widget.isSubActivitites);
                          //     }
                          //   },
                          //   onFocusChange: (hasFocus) {
                          //     if (hasFocus) {
                          //       scrollToPosition(index);
                          //     }
                          //   },
                          //   onButtonPressed: (_) {
                          //     if (bIsEnabled) {
                          //       if (llCh!.ctaMessage.isNotEmpty) {
                          //         // TODO: Gestire le traduzioni!!
                          //         OlAlertDialog.show(
                          //           context,
                          //           title: "Attenzione",
                          //           message:
                          //               "Contatta il tuo responsabile per farti iscrivere al contenuto",
                          //           actionLabel: "Ok",
                          //         );
                          //       } else {
                          //         widget.onButtonPressed(ll.id, false, ll, cc);
                          //       }
                          //     }
                          //   },
                          //   onDownloadPressed: (_) {},
                          //   isEnabled: bIsEnabled,
                          //   hasBadge: (ll.badge != null || ll.certificate != null),
                          //   isCompleted: ll.status == "C",
                          //   status: ll.status,
                          // ),
                          ),
                    );
                  } else {
                    return Container(
                      height: 150,
                      width: 200,
                      color: Colors.red,
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
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

  void pushDetails() {}
}
