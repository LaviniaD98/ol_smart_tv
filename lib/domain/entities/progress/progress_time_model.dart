

import '../../../data/models/responses/progress/progress_time_dto.dart';

class ProgressTimeModel {
  ProgressTimeModel({
    this.hours,
    this.completedHours,
  });

  factory ProgressTimeModel.fromResponse(ProgressTimeDto? response) {
    return ProgressTimeModel(
        hours: response?.hours,
        completedHours: response?.completedHours,
    );
  }

  final double? hours;
  final double? completedHours;

  String completedHours2Digits() {
    String twoDigits = completedHours != null ? "${double.parse((completedHours!).toStringAsFixed(2))}" : "0";
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    String hoursString = twoDigits.replaceAll(regex, '');
    return hoursString;
  }

  String hours2Digits() {
    String twoDigits = hours != null ? "${double.parse((hours!).toStringAsFixed(2))}" : "0";
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    String hoursString = twoDigits.replaceAll(regex, '');
    return hoursString;
  }
}