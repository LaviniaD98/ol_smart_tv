import 'package:open_learning_smart_tv/data/models/responses/smart_learning/slot/slot_dto.dart';

import '../../models/requests/create_slot_request.dart';
import '../../models/responses/smart_learning/smart_learning_slots_dto.dart';

abstract class SmartLearningDataSource {
  Future<SmartLearningSlotsDto> getSlots({
    required String startDate,
    required String endDate,
    required int month,
    required int year,
  });
  Future<SlotDto> create(CreateSlotRequest request);
  Future<SlotDto> update(
      {required int slotId, required CreateSlotRequest request});
  Future<void> delete(int slotId);
}
