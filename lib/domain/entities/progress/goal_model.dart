
import '../../../data/models/responses/progress/goal_dto.dart';

class GoalModel {
  GoalModel({
    this.plan,
    this.hoursPerMonth,
    this.durationInDays,
    this.totalHours,
  });

  factory GoalModel.fromResponse(GoalDto? response) {
    return GoalModel(
      plan: response?.plan,
      hoursPerMonth: response?.hoursPerMonth,
      durationInDays: response?.durationInDays,
      totalHours: response?.totalHours,
    );
  }

  final String? plan;
  final int? hoursPerMonth;
  final int? durationInDays;
  final int? totalHours;
}