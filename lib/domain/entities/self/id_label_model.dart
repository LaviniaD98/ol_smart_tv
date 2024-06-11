import 'package:equatable/equatable.dart';
import 'package:open_learning_smart_tv/data/models/responses/self/id_label_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'id_label_model.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class IdLabelModel extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'label')
  final String? label;

  const IdLabelModel({this.id, this.label});

  factory IdLabelModel.fromJson(Map<String, dynamic> json) =>
      _$IdLabelModelFromJson(json);
  Map<String, dynamic> toJson() => _$IdLabelModelToJson(this);

  factory IdLabelModel.fromResponse(IdLabelDto? response) {
    return IdLabelModel(id: response?.id, label: response?.label);
  }

  IdLabelModel copyWith({int? id, String? label}) {
    return IdLabelModel(id: id ?? this.id, label: label ?? this.label);
  }

  @override
  List<Object?> get props => [id, label];
}
