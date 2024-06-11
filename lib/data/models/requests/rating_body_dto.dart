import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_body_dto.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  includeIfNull: false,
  explicitToJson: true,
)
class RatingBodyDto extends Equatable {
  const RatingBodyDto(this.rating);

  Map<String, dynamic> toJson() => _$RatingBodyDtoToJson(this);

  @JsonKey(name: 'rating')
  final int rating;

  factory RatingBodyDto.fromPredefinedConfig({
    required int rating,}) {
    return RatingBodyDto(rating);
  }

  @override
  List<Object?> get props => [
    rating,
  ];
}