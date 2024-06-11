import 'package:open_learning_smart_tv/data/models/responses/smart_learning/slot/slot_dto.dart';

class SlotModel {
  final int id;
  final DateTime startDate;
  final DateTime endDate;

  SlotModel({
    required this.id,
    required this.startDate,
    required this.endDate,
  });

  factory SlotModel.fromDto(SlotDto dto) {
    return SlotModel(
      id: dto.id,
      startDate: DateTime.parse(dto.startDate),
      endDate: DateTime.parse(dto.endDate),
    );
  }
}
