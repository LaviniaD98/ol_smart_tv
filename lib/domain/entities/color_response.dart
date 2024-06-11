import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'color_response.g.dart';

@JsonSerializable(
    ignoreUnannotated: true, includeIfNull: true, explicitToJson: true)
class ColorResponse extends Equatable{
  @JsonKey()
  final int? idColor;
  @JsonKey()
  final int? idConfColour;
  @JsonKey()
  final String name;
  @JsonKey()
  final String rgb;

  const ColorResponse(
      {this.idColor, this.idConfColour, required this.name, required this.rgb});


  factory ColorResponse.fromJson(Map<String, dynamic> json) =>
      _$ColorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ColorResponseToJson(this);
  
  @override
  List<Object?> get props => [idColor, idConfColour, name, rgb];
}
