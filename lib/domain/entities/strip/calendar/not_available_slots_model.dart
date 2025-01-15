import 'package:open_learning_smart_tv/data/models/responses/strip/wrapper/calendar_strip_dto.dart';
import 'package:open_learning_smart_tv/domain/entities/smart_learning/slot_model.dart';

import '../learning_object/learning_object_model.dart';

class NotAvailableSlotsModel {
  NotAvailableSlotsModel({
    required this.slots,
  });

  factory NotAvailableSlotsModel.fromDto(CalendarStripDto dto) {
    final notAvailableSlots = dto.learningObjects
            ?.map((e) {
              final model = LearningObjectModel.fromDto(e);
              final startTime = _timeFormat(model.startTime);
              final startDate = model.startDate?.add(Duration(
                  hours: startTime?.$1 ?? 0, minutes: startTime?.$2 ?? 0));
              final startDateUtc = startDate?.toUtc();

              final endTime = _timeFormat(model.endTime);
              final endDate = model.endDate?.add(
                  Duration(hours: endTime?.$1 ?? 0, minutes: endTime?.$2 ?? 0));
              final endDateUtc = endDate?.toUtc();
              if (startDateUtc != null && endDateUtc != null) {
                return SlotModel(
                    id: 0, startDate: startDateUtc, endDate: endDateUtc);
              } else {
                return null;
              }
            })
            .nonNulls
            .toList() ??
        [];
    return NotAvailableSlotsModel(
      slots: notAvailableSlots,
    );
  }

  final List<SlotModel> slots;

  static (int, int)? _timeFormat(String? value) {
    if (value == null) return null;
    final hours = value.split(':').first;
    final minutes = value.split(':').last;
    return (int.parse(hours), int.parse(minutes));
  }
}
