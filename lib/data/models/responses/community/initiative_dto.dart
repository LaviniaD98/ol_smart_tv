import 'package:freezed_annotation/freezed_annotation.dart';

part 'initiative_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class InitiativeDto {
  InitiativeDto({
    this.id,
    this.label,
  });

  factory InitiativeDto.fromJson(Map<String, dynamic> json) => _$InitiativeDtoFromJson(json);

  final double? id;
  final String? label;
}