import 'package:open_learning_smart_tv/data/models/responses/language/language_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.g.dart';

@JsonSerializable(
  createToJson: true,
)
class LanguageModel extends Equatable {
  const LanguageModel({
    required this.id,
    required this.label,
    this.isPrimary = false,
  });

  final String id;
  final String label;
  final bool isPrimary;

  Map<String, dynamic> toJson() => _$LanguageModelToJson(this);

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);

  factory LanguageModel.fromDto(LanguageDto dto, [bool? isPrimary]) {
    return LanguageModel(
      id: dto.id,
      label: dto.label,
      isPrimary: isPrimary ?? false,
    );
  }

  @override
  List<Object?> get props => [
        id,
        label,
        isPrimary,
      ];
}
