import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/responses/progress/progress_config_dto.dart';

@JsonSerializable(createToJson: false, checked: true)
class ProgressConfigModel {

  ProgressConfigModel({
    this.enabled,
    this.monitoringStartDate,
  });

  factory ProgressConfigModel.fromDto(ProgressConfigDto? dto) {
    return ProgressConfigModel(
      enabled: dto?.enabled,
      monitoringStartDate: dto?.monitoringStartDate,
    );
  }

  final bool? enabled;
  final String? monitoringStartDate;
}