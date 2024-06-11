import '../../../data/models/responses/progress/learning_plan_dto.dart';

class LearningPlanModel {

  LearningPlanModel({
    this.hoursPerMonth,
  });

  factory LearningPlanModel.fromDto(LearningPlanDto? dto) {
    return LearningPlanModel(
      hoursPerMonth: dto?.hoursPerMonth,
    );
  }

  final int? hoursPerMonth;
}