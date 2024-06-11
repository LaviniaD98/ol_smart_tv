import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_slot_request.g.dart';

@JsonSerializable(
  createFactory: false,
  ignoreUnannotated: true,
  explicitToJson: true,
)
class CreateSlotRequest extends Equatable {
  const CreateSlotRequest({
    required this.endDate,
    required this.startDate,
  });

  Map<String, dynamic> toJson() => _$CreateSlotRequestToJson(this);

  @JsonKey(name: 'end_date')
  final String endDate;

  @JsonKey(name: 'start_date')
  final String startDate;

  @override
  List<Object?> get props => [
    endDate,
    startDate,
  ];
}
