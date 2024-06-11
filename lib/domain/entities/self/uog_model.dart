import 'package:equatable/equatable.dart';
import 'package:open_learning_smart_tv/data/models/responses/self/uog_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'uog_model.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class UogModel extends Equatable {
  @JsonKey(name: 'uog')
  final String? uog;
  @JsonKey(name: 'uog_description')
  final String? uogDescription;

  const UogModel({this.uog, this.uogDescription});

  factory UogModel.fromJson(Map<String, dynamic> json) =>
      _$UogModelFromJson(json);
  Map<String, dynamic> toJson() => _$UogModelToJson(this);

  factory UogModel.fromResponse(UogDto response) {
    return UogModel(uog: response.uog, uogDescription: response.uogDescription);
  }

  UogModel copyWith({String? uog, String? uogDescription}) {
    return UogModel(
        uog: uog ?? this.uog,
        uogDescription: uogDescription ?? this.uogDescription);
  }

  @override
  List<Object?> get props => [uog, uogDescription];
}
