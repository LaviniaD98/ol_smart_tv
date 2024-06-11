import '../../../data/models/responses/progress/learning_plans_dto.dart';
import 'learning_plan_model.dart';

class LearningPlansModel {

  LearningPlansModel({
    this.starter,
    this.advanced,
    this.master,
  });

  factory LearningPlansModel.fromDto(LearningPlansDto? dto) {
    return LearningPlansModel(
        starter: LearningPlanModel.fromDto(dto?.starter),
        advanced: LearningPlanModel.fromDto(dto?.advanced),
        master: LearningPlanModel.fromDto(dto?.master),
    );
  }

  final LearningPlanModel? starter;
  final LearningPlanModel? advanced;
  final LearningPlanModel? master;
}