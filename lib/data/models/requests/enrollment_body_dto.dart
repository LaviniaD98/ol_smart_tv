import 'package:open_learning_smart_tv/data/models/requests/learning_object_body_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'enrollment_body_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class EnrollmentDto extends Equatable {
  const EnrollmentDto(this.approverEId, this.domainId, this.enrollDate,
      this.enrollType, this.learningObject, this.mandatory, this.userId);

  Map<String, dynamic> toJson() => _$EnrollmentDtoToJson(this);

  @JsonKey()
  final String? approverEId;
  @JsonKey()
  final int? domainId;
  @JsonKey()
  final String? enrollDate;
  @JsonKey()
  final String? enrollType;
  @JsonKey()
  final LearningObjectBodyDto? learningObject;
  @JsonKey()
  final bool? mandatory;
  @JsonKey()
  final int? userId;

  factory EnrollmentDto.fromPredefinedConfig(
      {String? approverEId,
      int? domainId,
      String? enrollDate,
      String? enrollType,
      LearningObjectBodyDto? learningObject,
      bool? mandatory,
      int? userId}) {
    return EnrollmentDto(approverEId, domainId, enrollDate, enrollType,
        learningObject, mandatory, userId);
  }

  @override
  List<Object?> get props => [
        approverEId,
        domainId,
        enrollDate,
        enrollType,
        learningObject,
        mandatory,
        userId
      ];
}
