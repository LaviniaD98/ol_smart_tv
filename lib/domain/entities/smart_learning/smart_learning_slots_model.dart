import 'package:open_learning_smart_tv/data/models/responses/smart_learning/smart_learning_slots_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/smart_learning/slot_model.dart';

class SmartLearningSlotsModel {
  final List<SlotModel> slots;
  final int? hoursAvailable;

  SmartLearningSlotsModel({
    required this.slots,
    required this.hoursAvailable,
  });

  factory SmartLearningSlotsModel.fromDto(SmartLearningSlotsDto dto) {
    return SmartLearningSlotsModel(
      slots: dto.slots.map((e) => SlotModel.fromDto(e)).toList(),
      hoursAvailable: dto.hoursAvailable,
    );
  }
}
