import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

enum LearningObjectType {
  @JsonValue('ASYNC')
  async('Digital', 'ASYNC'),
  @JsonValue('BLENDED')
  blended('Blended', 'BLENDED'),
  @JsonValue('DA_PHYSICAL_CLASS')
  physicalClass('Live Classroom', 'DA_PHYSICAL_CLASS'),
  @JsonValue('DA_VIRTUAL_CLASS')
  virtualClass('Live Classroom', 'DA_VIRTUAL_CLASS'),
  @JsonValue('SYNC')
  sync('Live', 'SYNC'),
  unknown('Live', '');

  String getTranslatedValue() {
    String tr = LabelsManager().getRemoteStringFromString(apiValue);
    if (tr == apiValue) return value;
    return tr;
  }

  final String value;
  final String apiValue;
  const LearningObjectType(this.value, this.apiValue);
}

enum LearningObjectTypology {
  @JsonValue('COURSE')
  course('Course', 'COURSE'),
  @JsonValue('DA_EXTERNAL_RES')
  externalRes('Learning activity', 'DA_EXTERNAL_RES'),
  @JsonValue('DA_SCORM')
  scorm('Learning activity', 'DA_SCORM'),
  @JsonValue('DA_XAPI')
  xapi('Learning activity', 'DA_XAPI'),
  @JsonValue('DA_PHYSICAL_CLASS')
  physicalClass('Learning activity', 'DA_PHYSICAL_CLASS'),
  @JsonValue('DA_VIRTUAL_CLASS')
  virtualClass('Learning activity', 'DA_VIRTUAL_CLASS'),
  @JsonValue('DA_YOUTUBE')
  youtube('Learning activity', 'DA_YOUTUBE'),
  @JsonValue('DA_LINKEDIN')
  linkedin('Learning activity', 'DA_LINKEDIN'),
  @JsonValue('PATH')
  path('Path', 'PATH'),
  @JsonValue('DA_MATERIAL')
  material('Material', 'DA_MATERIAL'),
  @JsonValue('DA_GOALS')
  goals('Goal', 'DA_GOALS'),
  @JsonValue('DA_MEETING')
  meeting('Meeting', 'DA_MEETING'),
  @JsonValue('DA_FINAL_BALANCE')
  finalBalance('Balance', 'DA_FINAL_BALANCE'),
  @JsonValue('DA_URL_RES')
  urlRes('External activity', 'DA_URL_RES'),
  @JsonValue('DA_SURVEY')
  survey('Survey', 'DA_SURVEY'),
  unknown('Live', '');

  final String value;
  final String apiValue;
  const LearningObjectTypology(this.value, this.apiValue);

  String getTranslatedValue() {
    String tr = LabelsManager().getRemoteStringFromString(apiValue);
    if (tr == apiValue) return value;
    return tr;
  }

  static String fromJsonValue(String? jsonValue) {
    if (jsonValue != null) {
      for (var typology in LearningObjectTypology.values) {
        if (typology.value.toUpperCase() == jsonValue.toUpperCase()) {
          return typology.name;
        }
      }
    }
    return "";
  }
}

enum IconStatus {
  mandatory('assets/icons/mandatory.svg'),
  completed('assets/icons/checkbox_tick.svg'),
  expired('assets/icons/mandatory.svg'),
  suggestedAI('assets/icons/suggested_ai.svg'),
  suggestedHR('assets/icons/suggested_hr.svg'),
  idle();

  final String? svgPath;
  const IconStatus([this.svgPath]);
}

enum EnrollType {
  @JsonValue('AUTO_ENROLL')
  autoEnroll('AutoEnroll'),

  @JsonValue('TOP_DOWN')
  topDown('TopDown'),

  @JsonValue('REQUESTED_AUTO_ENROLL')
  requestedAutoEnroll('RequestedAutoEnroll'),

  unknown('TopDown');

  final String value;
  const EnrollType(this.value);
}

enum LocalNotificationType {
  welcome('assets/icons/border_check.svg'),
  welcomenp('assets/icons/border_check.svg'),
  badge('assets/icons/border_check.svg'),
  reset('assets/icons/border_check.svg'),
  reminder('assets/icons/mandatory.svg'),
  learnrem('assets/icons/calendar.svg'),
  enroll('assets/icons/sound.svg'),
  suggest('assets/icons/sound.svg'),
  livevent('assets/icons/sound.svg'), //TODO
  decline('assets/icons/mandatory.svg'), //TODO
  approvalrequest('assets/icons/mandatory.svg'), //TODO
  unknown('assets/icons/mandatory.svg');

  final String svgPath;
  const LocalNotificationType(this.svgPath);

  static LocalNotificationType fromName(String? type) {
    return LocalNotificationType.values.firstWhereOrNull(
            (e) => e.name.toUpperCase() == type?.toUpperCase()) ??
        LocalNotificationType.unknown;
  }
}

// enum PlayerEvent { onStart, onPause, onResume, onComplete, onClose}

enum PlayerEvent {
  onStart(),
  onPause(),
  onResume(),
  onComplete(),
  onClose(),
  unknown();

  const PlayerEvent();

  static PlayerEvent fromName(String? type) {
    return PlayerEvent.values.firstWhereOrNull(
            (e) => e.name.toUpperCase() == type?.toUpperCase()) ??
        PlayerEvent.unknown;
  }
}

enum AgendaEventType { events, eventSmartLearning, eventLearningObject }

enum PostType {
  POST,
  TALK,
  SHARED;

  factory PostType.fromString(String? value) {
    return switch (value?.toLowerCase()) {
      "free" => PostType.POST,
      "shared" => PostType.SHARED,
      _ => PostType.TALK,
    };
  }
}
