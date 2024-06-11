
class objLOCharacterization {
  String buttonTitle = "";
  String ctaMessage = "";
  bool buttonEnabled = true;
  ObjLOAction objLOAction = ObjLOAction.none;
}

enum ObjLOAction {
  none,
  notApplicable,
  startFruition,
  autoEnrollmentBottom,
  autoEnrollmentAuto,
  autoEnrollmentWithPatch,
  seeEditions,
  ecmNotRegistered,
  showDetailMaterials,
  showDetailGoals,
  showDetailMeeting,
  showDetailFinalBalance,
}
