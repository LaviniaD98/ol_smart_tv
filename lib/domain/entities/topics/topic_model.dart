import 'package:equatable/equatable.dart';

import '../../../data/models/responses/topics/topic_dto.dart';
import '../../entities/generic/url_model.dart';

class TopicModel extends Equatable {
  final String? name;
  final int? order;
  final int? id;
  final int? learningObjectAssociated;
  final UrlModel?  url;

  const TopicModel({
    this.name,
    this.order,
    this.id,
    this.learningObjectAssociated,
    this.url,
  });

  factory TopicModel.fromResponse(TopicDto? response) {
    return TopicModel(
      name: response?.name,
      order: response?.order,
      id: response?.id,
      learningObjectAssociated: response?.learningObjectAssociated,
      url: UrlModel.fromResponse(response?.url),
    );
  }

  @override
  List<Object?> get props =>
      [
        id,
        name
      ];
}
