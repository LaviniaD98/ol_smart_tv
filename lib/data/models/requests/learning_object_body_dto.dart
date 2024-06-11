
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_object_body_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class LearningObjectBodyDto extends Equatable {
  const LearningObjectBodyDto(this.corporateId,this.objectId
      );

  Map<String, dynamic> toJson() => _$LearningObjectBodyDtoToJson(this);

  @JsonKey()
  final int? corporateId;
  @JsonKey()
  final int? objectId;

  factory LearningObjectBodyDto.fromPredefinedConfig({
    int? corporateId,int? objectId}) {
    return LearningObjectBodyDto(corporateId,objectId);
  }

  @override
  List<Object?> get props => [
    corporateId,objectId
  ];
}