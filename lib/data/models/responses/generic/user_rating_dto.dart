import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_rating_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class UserRatingDto {
  UserRatingDto(
      this.learnerId,
      this.rating,
      this.isFavouriteForLearner,
      this.lastRated
      );

  factory UserRatingDto.fromJson(Map<String, dynamic> json) =>
      _$UserRatingDtoFromJson(json);

  @JsonKey()
  final int? learnerId;
  @JsonKey()
  final int? rating;
  @JsonKey()
  final int? isFavouriteForLearner;
  @JsonKey()
  final String? lastRated;

}