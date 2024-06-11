import 'package:freezed_annotation/freezed_annotation.dart';

import '../generic/edition_dto.dart';

part 'editions_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class EditionsDto {
  EditionsDto(
    this.editions
  );

  factory EditionsDto.fromJson(Map<String, dynamic> json) =>
      _$EditionsDtoFromJson(json);

  @JsonKey()
  final List<EditionDto>? editions;
}
