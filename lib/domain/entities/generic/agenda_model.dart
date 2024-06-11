import '../../../data/models/responses/generic/agenda_dto.dart';

class AgendaModel {
  bool? isBreak;
  String? item;

  AgendaModel({
    this.isBreak,
    this.item,
  });

  factory AgendaModel.fromDto(AgendaDto dto) {
    return AgendaModel(
      isBreak: dto.isBreak,
      item: dto.item
    );
  }
}