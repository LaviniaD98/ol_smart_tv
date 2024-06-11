import '../../../data/models/responses/community/los_dto.dart';

class LosModel {
  LosModel({
    this.loId,
    this.coverId,
    required this.topics,
    this.description,
    this.title,
    this.publicCoverUrl,
  });

  factory LosModel.fromDto(LosDto dto) {
    return LosModel(
        loId: dto.loId,
        coverId: dto.coverId,
        topics: dto.topics ?? [],
        description: dto.description,
        title: dto.title,
        publicCoverUrl: dto.publicCoverUrl,
    );
  }

  final String? loId;
  final double? coverId;
  final List<String> topics;
  final String? description;
  final String? title;
  final String? publicCoverUrl;
}