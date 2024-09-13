import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/remote_theming/config/config_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/config/remote_config_keys.dart';
import 'package:intl/intl.dart';

import '../../../remote_theming/labels/labels_manager.dart';
import '../../../remote_theming/labels/remote_labels_keys.dart';
import 'lo_types.dart';

class CourseLogic {
  static final CourseLogic _instance = CourseLogic._internal();

  factory CourseLogic() {
    return _instance;
  }

  CourseLogic._internal();

  double getCompletionPercentageFromString(String? perc) {
    if (perc == null) return 0;
    return double.parse(perc.replaceAll("%", ""));
  }

  String getExpirationStringDate(List<int>? date) {
    if (date != null) {
      if (ConfigManager()
              .getRemoteString(RemoteConfigKeys.expiration_date_to_hide) ==
          date.convertToDateTimeString) {
        return "";
      }
      return LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.expiring_on) +
          date.convertToDateTimeString!;
    }
    return "";
  }

  String getEcmDurationStringDate(List<int>? startDate, List<int>? endDate) {
    if (startDate != null && endDate != null) {
      return LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.from_to)
          .replaceFirst('{{start}}', startDate.convertToDateTimeString!)
          .replaceFirst('{{end}}', endDate.convertToDateTimeString!);
    }
    return "";
  }

  String getTojDurationStringDate(String? startDate, String? endDate) {
    if (startDate != null && endDate != null) {
      final inDateFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
      final outDateFormat = DateFormat('dd/MM/yyyy');

      return LabelsManager()
          .getRemoteStringFromLabelKeys(RemoteLabelKeys.from_to)
          .replaceFirst(
              '{{start}}', outDateFormat.format(inDateFormat.parse(startDate)))
          .replaceFirst(
              '{{end}}', outDateFormat.format(inDateFormat.parse(endDate)));
    }
    return "";
  }

  String getMeetingString(int? count) {
    return LabelsManager()
        .getRemoteStringFromLabelKeys(RemoteLabelKeys.meeting_count)
        .replaceFirst('{{count}}', '$count');
  }

  String getDurationString(int? durationInMin) {
    if (durationInMin != null && durationInMin > 0) {
      final duration = Duration(minutes: durationInMin);
      String sDuration = "";
      // bool hasDays = false;
      // bool hasHours = false;
      if (duration.inDays > 0) {
       // hasDays = true;
        if (duration.inDays == 1) {
          sDuration =
              "${duration.inDays} ${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.detail_count_day)} ";
        } else {
          sDuration =
              "${duration.inDays} ${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.detail_count_days)} ";
        }
      }
      if (duration.inHours.remainder(24) > 0) {
       // hasHours = true;
        if (duration.inHours.remainder(24) == 1) {
          sDuration =
              "$sDuration${duration.inHours.remainder(24)} ${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.detail_count_hour)} ";
        } else {
          sDuration =
              "$sDuration${duration.inHours.remainder(24)} ${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.detail_count_hours)} ";
        }
      }
      if (duration.inMinutes.remainder(60) > 0) {
        if (duration.inMinutes.remainder(60) == 1) {
          sDuration =
              "$sDuration${duration.inMinutes.remainder(60)} ${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.detail_count_minute)}";
        } else {
          sDuration =
              "$sDuration${duration.inMinutes.remainder(60)} ${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.detail_count_minutes)}";
        }
      }
      return sDuration;
    } else {
      return "";
    }
  }

  // bool checkIfAutoEnrollment(EnrollType enrollType,String status,LearningObjectType learningObjectType){

  //   // TEST auto enrollment
  //   //return true;

  //   if(enrollType == EnrollType.autoEnroll && status.toUpperCase() == "N" &&
  //       (learningObjectType == LearningObjectType.async || learningObjectType == LearningObjectType.blended) ){
  //     return true;
  //   }

  //   return false;
  // }

  objLOCharacterization loCharacterizationNew({
    required String status,
    required LearningObjectType learningObjectType,
    required LearningObjectTypology learningObjectTypology,
    required String percentageOfCompletion,
    required EnrollType enrollType,
    required bool ecmSpecialization,
    required bool ecmRegistration,
    bool isSubModule = false,
  }) {
    objLOCharacterization res = objLOCharacterization();
    res.buttonTitle = LabelsManager()
        .getRemoteStringFromLabelKeys(RemoteLabelKeys.button_detail_see_detail);
    res.objLOAction = ObjLOAction.none;
    res.buttonEnabled = true;

    if (status == 'E' && ecmSpecialization && !ecmRegistration) {
      if (isSubModule) {
        res.objLOAction = ObjLOAction.none;
        res.buttonEnabled = false;
      } else {
        res.buttonTitle = LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.register);
        res.objLOAction = ObjLOAction.ecmNotRegistered;
      }
    } else if (learningObjectType == LearningObjectType.async) {
      switch (learningObjectTypology) {
        case LearningObjectTypology.urlRes:
          res.buttonTitle = LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.show_content);
          res.objLOAction = ObjLOAction.startFruition;
          break;
        case LearningObjectTypology.externalRes:
        case LearningObjectTypology.course:
        case LearningObjectTypology.path:
        case LearningObjectTypology.scorm:
        case LearningObjectTypology.xapi:
        case LearningObjectTypology.youtube:
        case LearningObjectTypology.linkedin:
        case LearningObjectTypology.survey:
          switch (status) {
            case "N":
              {
                if (enrollType == EnrollType.requestedAutoEnroll) {
                  res.buttonTitle = LabelsManager()
                      .getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.button_detail_request_enrollment);
                  res.objLOAction = ObjLOAction.autoEnrollmentBottom;
                } else if (enrollType == EnrollType.autoEnroll) {
                  res.buttonTitle = LabelsManager()
                      .getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.button_detail_request_enrollment);
                  res.objLOAction = ObjLOAction.autoEnrollmentAuto;
                } else {
                  res.buttonTitle = LabelsManager()
                      .getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.button_detail_start_fruition);
                  res.objLOAction = ObjLOAction.startFruition;
                  res.buttonEnabled = false;
                  res.objLOAction = ObjLOAction.notApplicable;
                }
              }
            case "W":
              {
                res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.button_detail_request_sent);
                if (enrollType == EnrollType.requestedAutoEnroll) {
                  res.buttonEnabled = false;
                  res.objLOAction = ObjLOAction.none;
                } else {
                  res.buttonEnabled = false;
                  res.objLOAction = ObjLOAction.notApplicable;
                }
              }
            case "R":
              {
                res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.button_detail_request_refused);
                if (enrollType == EnrollType.requestedAutoEnroll) {
                  res.buttonEnabled = false;
                  res.objLOAction = ObjLOAction.none;
                } else {
                  res.buttonEnabled = false;
                  res.objLOAction = ObjLOAction.notApplicable;
                }
              }
            case "P":
              {
                res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.button_detail_continue);
                res.objLOAction = ObjLOAction.startFruition;
              }
            case "E":
              {
                res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.button_detail_start_fruition);
                res.objLOAction = ObjLOAction.startFruition;
              }
            case "C":
              {
                res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.button_detail_restart);
                res.objLOAction = ObjLOAction.startFruition;
              }
            case "T":
              {
                res.buttonEnabled =
                    !(learningObjectTypology == LearningObjectTypology.survey);
              }
          }
          break;

        case LearningObjectTypology.material:
          res.buttonTitle = LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.show_materials);
          res.buttonEnabled = (status != "T");
          res.objLOAction = ObjLOAction.showDetailMaterials;
          break;
        case LearningObjectTypology.goals:
          res.buttonTitle = LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.show_materials);
          res.buttonEnabled = (status != "T");
          res.objLOAction = ObjLOAction.showDetailGoals;
          break;
        case LearningObjectTypology.meeting:
          res.buttonTitle = LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.show_info);
          res.buttonEnabled = (status != "T");
          res.objLOAction = ObjLOAction.showDetailMeeting;
          break;
        case LearningObjectTypology.finalBalance:
          res.buttonTitle = LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.show_final_balance);
          res.buttonEnabled = (status != "T");
          res.objLOAction = ObjLOAction.showDetailFinalBalance;
          break;
        default:
          break;
      }
    } else if (learningObjectType == LearningObjectType.blended) {
      if (learningObjectTypology == LearningObjectTypology.course ||
          learningObjectTypology == LearningObjectTypology.path) {
        switch (status) {
          case "N":
            {
              if (enrollType == EnrollType.requestedAutoEnroll) {
                res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.button_detail_request_enrollment);
                res.objLOAction = ObjLOAction.autoEnrollmentBottom;
              } else if (enrollType == EnrollType.autoEnroll) {
                res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.button_detail_start_fruition);
                res.objLOAction = ObjLOAction.autoEnrollmentAuto;
              } else {
                res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.button_detail_start_fruition);
                res.objLOAction = ObjLOAction.none;
                res.buttonEnabled = false;
              }
            }
          case "W":
          case "R":
            {
              res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.button_detail_request_sent);
              res.objLOAction = ObjLOAction.none;
              res.buttonEnabled = false;
            }
          case "P":
            {
              res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.button_detail_continue);
              res.objLOAction = ObjLOAction.startFruition;
            }
          case "E":
            {
              res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.button_detail_start_fruition);
              res.objLOAction = ObjLOAction.startFruition;
            }
          case "C":
            {
              res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.button_detail_restart);
              res.objLOAction = ObjLOAction.startFruition;
            }
        }
      }
    } else if (learningObjectType == LearningObjectType.sync) {
      if (learningObjectTypology == LearningObjectTypology.path ||
          learningObjectTypology == LearningObjectTypology.course) {
        switch (status) {
          case "E":
            {
              if (enrollType == EnrollType.topDown) {
                res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.button_detail_start_fruition);
                res.objLOAction = ObjLOAction.startFruition;
              }
            }
        }
      } else if (learningObjectTypology ==
              LearningObjectTypology.physicalClass ||
          learningObjectTypology == LearningObjectTypology.virtualClass) {
        switch (status) {
          case "N":
            {
              if (enrollType == EnrollType.requestedAutoEnroll ||
                  enrollType == EnrollType.autoEnroll) {
                res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.button_detail_see_editions);
                res.objLOAction = ObjLOAction.autoEnrollmentWithPatch;
              } else {
                res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.button_detail_see_modules);
                res.objLOAction = ObjLOAction.none;
                res.buttonEnabled = false;
              }
            }
          case "W":
            {
              res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.button_detail_request_sent);
              res.objLOAction = ObjLOAction.none;
              res.buttonEnabled = false;
            }
          case "R":
            {
              res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.button_detail_request_refused);
              res.objLOAction = ObjLOAction.none;
              res.buttonEnabled = false;
            }
          case "P":
          case "E":
            {
              res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.button_detail_registered);
              res.objLOAction = ObjLOAction.none;
              res.buttonEnabled = false;
            }
          case "C":
            {
              res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.button_detail_completed);
              res.objLOAction = ObjLOAction.none;
              res.buttonEnabled = false;
            }
          case "T":
            {
              res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.button_detail_see_editions);
              res.objLOAction = ObjLOAction.seeEditions;
            }
        }
      }
    }

    return res;
  }

  // objLOCharacterization loCharacterization(
  //     String status,LearningObjectType learningObjectType,LearningObjectTypology learningObjectTypology,String percentageOfCompletion
  //     ) {
  //
  //   objLOCharacterization res = objLOCharacterization();
  //   res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.start);
  //   bool isAutoSubscribe = Random().nextInt(2) == 0 ? true: false;
  //
  //   if (status == "E" && learningObjectType == LearningObjectType.unknown) {
  //
  //     if(isAutoSubscribe) {
  //       res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.modules_show);
  //     }
  //
  //     switch (learningObjectTypology) {
  //       case LearningObjectTypology.physicalClass:
  //         res.buttonTitle =  LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.editions_show);
  //       case LearningObjectTypology.virtualClass:
  //         res.buttonTitle =  LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.join);
  //       case LearningObjectTypology.course:
  //         res.buttonTitle =  LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.activities_show);
  //       default:
  //     }
  //
  //     res.buttonTitle =  "No title";
  //   }
  //   else if(status == "E"){
  //     res.buttonTitle =  LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.start);
  //   }
  //   else if (status == "C" && learningObjectType == LearningObjectType.unknown) {
  //     switch (learningObjectTypology) {
  //       case LearningObjectTypology.physicalClass:
  //       case LearningObjectTypology.virtualClass:
  //         res.buttonTitle =  LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.editions_show);
  //       case LearningObjectTypology.course:
  //         res.buttonTitle =  LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.activities_show);
  //       default:
  //     }
  //   }
  //   else if (status == "C" && double.parse(percentageOfCompletion.replaceAll("%","")) >= 100){
  //     res.buttonTitle =  LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.restart);
  //   }
  //   else if (status == "C"){
  //     res.buttonTitle =  LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.modules_show);
  //   }
  //   else if (status == "N" &&
  //       isAutoSubscribe &&
  //       learningObjectType == LearningObjectType.async ||
  //       learningObjectType == LearningObjectType.blended) {
  //     res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.start);
  //   }
  //   else if (status == "N" &&
  //       isAutoSubscribe &&
  //       learningObjectType != LearningObjectType.async &&
  //       learningObjectType != LearningObjectType.blended) {
  //     res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.details);
  //   }
  //   else if (status == "N" &&
  //       !isAutoSubscribe &&
  //       learningObjectType != LearningObjectType.async &&
  //       learningObjectType != LearningObjectType.blended) {
  //     res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.modules_show);
  //   }
  //   else if (status == "N" && learningObjectType == LearningObjectType.unknown){
  //     switch (learningObjectTypology) {
  //       case LearningObjectTypology.physicalClass:
  //       case LearningObjectTypology.virtualClass:
  //         res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.editions_show);
  //       case LearningObjectTypology.course:
  //         res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.activities_show);
  //       default:
  //         res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.modules_show);
  //     }
  //   }
  //   else if (status == "P"){
  //     res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.resume);
  //   }
  //   else if (status == "R"){
  //     res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.subscription_refused);
  //   }
  //   else if (status == "W"){
  //     res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.validation);
  //   }
  //   else if (status == "T" && !isAutoSubscribe && learningObjectType != LearningObjectType.async){
  //     res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.subscribe);
  //   }
  //   else if (status == "T" && learningObjectType.toString() == LearningObjectType.unknown){
  //     switch (learningObjectTypology) {
  //       case LearningObjectTypology.physicalClass:
  //       case LearningObjectTypology.virtualClass:
  //         res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.editions_show);
  //       case LearningObjectTypology.course:
  //         res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.activities_show);
  //       default:
  //         res.buttonTitle = LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.modules_show);
  //     }
  //   }
  //
  //   return res;
  // }
}
