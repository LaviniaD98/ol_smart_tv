import 'package:open_learning_smart_tv/data/models/responses/generic/edition_dto.dart';

class EditionModel {
  EditionModel(
      {this.id,
      this.startTime,
      this.endTime,
      this.status,
      this.location,
      this.rooms,
      this.totalPlaces,
      this.occupiedPlaces,
      this.remainingPlaces,
      this.link,
      this.date,
      this.gMapsUrl});

  factory EditionModel.fromDto(EditionDto dto) {
    return EditionModel(
        id: dto.id,
        startTime: dto.startTime,
        endTime: dto.endTime,
        status: dto.status,
        location: dto.location,
        rooms: dto.rooms,
        totalPlaces: dto.totalPlaces,
        occupiedPlaces: dto.occupiedPlaces,
        remainingPlaces: dto.remainingPlaces,
        link: dto.link,
        date: dto.date,
        gMapsUrl: dto.gMapsUrl);
  }

  final int? id;
  final String? startTime;
  final String? endTime;
  final String? status;
  final String? location;
  final List<String>? rooms;
  final int? totalPlaces;
  final int? occupiedPlaces;
  final int? remainingPlaces;
  final String? link;
  final List<int>? date;
  final String? gMapsUrl;
}
