import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/course_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/lo_types.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/detail/detail_page_model.dart';
import '../../domain/enums/types.dart';
import '../../theme/app_theme.dart';
import '../common/widgets/card_modulo.dart';
import '../common/widgets/dialog/ol_alert_dialog.dart';
import 'common/course_logic.dart';
import 'detail_page.dart';

class CommonObject {
  int orderNumber;
  CourseModel? course;
  LearningObjectModel? activity;

  CommonObject({required this.orderNumber, this.course, this.activity});
}

class CourseDetailModules extends StatelessWidget {
  final DetailPageModel model;
  final String? parentId;
  final Function(
          int index, bool isACourse, LearningObjectModel? ll, CourseModel? cc)
      onButtonPressed;

  const CourseDetailModules(
      {super.key,
      required this.model,
      required this.parentId,
      required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    List<CommonObject> commonObjects = [];
    for (var course in model.courses!) {
      commonObjects.add(
          CommonObject(orderNumber: course.prereqOrderNumber!, course: course));
    }
    for (var activity in model.learningActivities!) {
      commonObjects.add(CommonObject(
          orderNumber: activity.prereqOrderNumber!, activity: activity));
    }
    commonObjects.sort((a, b) => a.orderNumber.compareTo(b.orderNumber));

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              LearningObjectModel? ll = commonObjects[index].activity;
              CourseModel? cc = commonObjects[index].course;
              bool bIsEnabled = true;
              objLOCharacterization? ccCh = null;
              if (cc != null) {
                ccCh = CourseLogic().loCharacterizationNew(
                  status: cc.status ?? "",
                  learningObjectType: cc.learningObjectType,
                  learningObjectTypology: cc.learningObjectTypology,
                  percentageOfCompletion: cc.percentageOfCompletion ?? "0",
                  enrollType: cc.enrollType ?? EnrollType.autoEnroll,
                  ecmSpecialization: model.ecmSpecialization,
                  ecmRegistration: model.ecmRegistration,
                  isSubModule: true,
                );
                bIsEnabled = ccCh.buttonEnabled && cc.isEnable == true;
              }

              objLOCharacterization? llCh = null;
              if (ll != null) {
                llCh = CourseLogic().loCharacterizationNew(
                  status: ll.status ?? "",
                  learningObjectType: ll.learningObjectType,
                  learningObjectTypology: ll.learningObjectTypology,
                  percentageOfCompletion: ll.percentageOfCompletion ?? "0",
                  enrollType: ll.enrollType ?? EnrollType.autoEnroll,
                  ecmSpecialization: model.ecmSpecialization,
                  ecmRegistration: model.ecmRegistration,
                  isSubModule: true,
                );
                bIsEnabled = llCh.buttonEnabled && ll.isEnable == true;
              }
              return Column(
                children: [
                  cc != null
                      ? InkWell(
                          onTap: () {
                            if (bIsEnabled) {
                              context.pushNamed(DetailPage.routeName,
                                  extra: DetailPageArgs(
                                    id: cc.id.toString(),
                                    typology: LearningObjectTypology.course,
                                    parentId: model.id?.toString(),
                                    grandParentId: parentId?.toString(),
                                    parent: model,
                                  ));
                            }
                          },
                          child: CardModulo(
                            index: index,
                            imageUrl: cc.coverPublicURL ?? "",
                            tipoText:
                                cc.learningObjectTypology.value.toString(),
                            progressPercentage: CourseLogic()
                                .getCompletionPercentageFromString(
                                    cc.percentageOfCompletion),
                            titolo: cc.title ?? "",
                            buttonTitle: ccCh!.buttonTitle,
                            descrizione: cc.shortDescription ?? "",
                            durataMinuti: cc.duration,
                            numAttivita: cc.learningActivityNumber,
                            numRisorse: cc.toolNumber,
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
                                  onButtonPressed(cc.id!, true, ll, cc);
                                }
                              }
                            },
                            onDownloadPressed: (_) {},
                            isEnabled: bIsEnabled,
                            hasBadge: cc.badge != null,
                            isCompleted: cc.status == "C",
                            status: cc.status,
                          ))
                      : (ll != null
                          ? InkWell(
                              onTap: () {
                                if (bIsEnabled) {
                                  context.pushNamed(DetailPage.routeName,
                                      extra: DetailPageArgs(
                                        id: ll.id.toString(),
                                        typology: ll.learningObjectTypology,
                                        parentId: model.id?.toString(),
                                        grandParentId: parentId?.toString(),
                                        parent: model,
                                      ));
                                }
                              },
                              child: CardModulo(
                                index: index,
                                imageUrl: ll.coverPublicURL ?? "",
                                tipoText:
                                    ll.learningObjectTypology.value.toString(),
                                progressPercentage: CourseLogic()
                                    .getCompletionPercentageFromString(
                                        ll.percentageOfCompletion),
                                titolo: ll.title ?? "",
                                buttonTitle: llCh!.buttonTitle,
                                descrizione: ll.shortDescription ?? "",
                                durataMinuti: ll.duration,
                                numAttivita: null,
                                numRisorse: ll.toolNumber,
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
                                      onButtonPressed(ll.id, false, ll, cc);
                                    }
                                  }
                                },
                                onDownloadPressed: (_) {},
                                isEnabled: bIsEnabled,
                                hasBadge: (ll.badge != null ||
                                    ll.certificate != null),
                                isCompleted: ll.status == "C",
                                status: ll.status,
                              ))
                          : const Text("")),
                  if (index != (commonObjects.length - 1))
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: ColorManager().getColorBorder(),
                    ),
                ],
              );
            },
            childCount: commonObjects.length,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: Dimens.spacingXXXL,
          ),
        ),
        // SliverToBoxAdapter(
        //   child: ListView.builder(
        //     padding: const EdgeInsets.only(top: 4),
        //     physics: const NeverScrollableScrollPhysics(),
        //     shrinkWrap: true,
        //     itemCount: commonObjects.length,
        //     itemBuilder: (BuildContext context, int index) {
        //
        //       LearningObjectModel? ll = commonObjects[index].activity;
        //       CourseModel? cc = commonObjects[index].course;
        //
        //       bool bIsEnabled = true;
        //
        //       objLOCharacterization? ccCh = null;
        //       if(cc != null) {
        //         ccCh = CourseLogic().loCharacterizationNew(
        //             status: cc.status ?? "",
        //             learningObjectType: cc.learningObjectType,
        //             learningObjectTypology: cc.learningObjectTypology,
        //             percentageOfCompletion: cc.percentageOfCompletion ?? "0",
        //             enrollType: cc.enrollType ?? EnrollType.autoEnroll,
        //             ecmSpecialization: model.ecmSpecialization,
        //             ecmRegistration: model.ecmRegistration,
        //             isSubModule: true,
        //         );
        //         bIsEnabled = ccCh.buttonEnabled && cc.isEnable == true;
        //       }
        //
        //       objLOCharacterization? llCh = null;
        //       if(ll != null){
        //         llCh = CourseLogic().loCharacterizationNew(
        //             status: ll.status ?? "",
        //             learningObjectType: ll.learningObjectType,
        //             learningObjectTypology: ll.learningObjectTypology,
        //             percentageOfCompletion: ll.percentageOfCompletion ?? "0",
        //             enrollType: ll.enrollType ?? EnrollType.autoEnroll,
        //             ecmSpecialization: model.ecmSpecialization,
        //             ecmRegistration: model.ecmRegistration,
        //             isSubModule: true,
        //         );
        //         bIsEnabled = llCh.buttonEnabled && ll.isEnable == true;
        //       }
        //
        //
        //
        //       return Column(children: [
        //
        //         cc != null ?
        //       InkWell(
        //       onTap: () {
        //         if(bIsEnabled) {
        //           context.pushNamed(DetailPage.routeName,
        //               extra: DetailPageArgs(
        //                 id: cc.id.toString(),
        //                 typology: LearningObjectTypology.course,
        //                 parentId: model.id?.toString(),
        //                 grandParentId: parentId?.toString(),
        //                 parent: model,
        //               ));
        //         }
        //       },
        //       child:
        //         CardModulo(
        //           index: index,
        //           imageUrl: cc.coverPublicURL ?? "",
        //           tipoText: cc.learningObjectTypology.value.toString(),
        //           progressPercentage: CourseLogic().getCompletionPercentageFromString(cc.percentageOfCompletion),
        //           titolo: cc.title ?? "",
        //           buttonTitle: ccCh!.buttonTitle,
        //           descrizione: cc.shortDescription ?? "",
        //           durataMinuti: cc.duration,
        //           numAttivita: cc.learningActivityNumber,
        //           numRisorse: cc.toolNumber,
        //           onButtonPressed: (_) {
        //             if(bIsEnabled) {
        //               if(ccCh!.ctaMessage.isNotEmpty){
        //                 // TODO: Gestire le traduzioni!!
        //                 OlAlertDialog.show(
        //                   context,
        //                   title: "Attenzione",
        //                   message: "Contatta il tuo responsabile per farti iscrivere al contenuto",
        //                   actionLabel: "Ok",
        //                 );
        //               }
        //               else {
        //                 onButtonPressed(cc.id!, true, ll, cc);
        //               }
        //             }
        //           },
        //           onDownloadPressed: (_) {},
        //           isEnabled: bIsEnabled,
        //           hasBadge: ll?.badge != null,
        //           isCompleted: ll?.status == "C",
        //         ))
        //             : (
        //             ll != null ?
        //             InkWell(
        //                 onTap: () {
        //                   if(bIsEnabled) {
        //                     context.pushNamed(DetailPage.routeName,
        //                         extra: DetailPageArgs(
        //                           id: ll.id.toString(),
        //                           typology: ll.learningObjectTypology,
        //                           parentId: model.id?.toString(),
        //                           grandParentId: parentId?.toString(),
        //                           parent: model,
        //                        ));
        //                   }
        //                 },
        //                 child:
        //             CardModulo(
        //               index: index,
        //               imageUrl: ll.coverPublicURL ?? "",
        //               tipoText: ll.learningObjectTypology.value.toString(),
        //               progressPercentage: CourseLogic().getCompletionPercentageFromString(ll.percentageOfCompletion),
        //               titolo: ll.title ?? "",
        //               buttonTitle: llCh!.buttonTitle,
        //               descrizione: ll.shortDescription ?? "",
        //               durataMinuti: ll.duration,
        //               numAttivita: null,
        //               numRisorse: ll.toolNumber,
        //               onButtonPressed: (_) {
        //                 if(bIsEnabled) {
        //                   if(llCh!.ctaMessage.isNotEmpty){
        //                     // TODO: Gestire le traduzioni!!
        //                     OlAlertDialog.show(
        //                       context,
        //                       title: "Attenzione",
        //                       message: "Contatta il tuo responsabile per farti iscrivere al contenuto",
        //                       actionLabel: "Ok",
        //                     );
        //                   }
        //                   else {
        //                     onButtonPressed(ll.id, false, ll, cc);
        //                   }
        //                 }
        //               },
        //               onDownloadPressed: (_) {
        //               },
        //               isEnabled: bIsEnabled,
        //               hasBadge: (cc?.badge != null || cc?.certificate != null),
        //               isCompleted: cc?.status == "C",
        //             ))
        //                 : const Text("")),
        //
        //         Divider(
        //           height: 1,
        //           thickness: 1,
        //           color: ColorManager().getColorBorder(),
        //         ),
        //       ],
        //       );
        //
        //
        //     },
        //   ),
        // ),
      ],
    );
  }
}
