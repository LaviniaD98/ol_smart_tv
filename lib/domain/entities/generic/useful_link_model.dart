import 'package:open_learning_smart_tv/data/models/responses/generic/useful_link_dto.dart';

class UsefulLinkModel {
  UsefulLinkModel({this.url, this.urlLabel, this.description});

  factory UsefulLinkModel.fromDto(UsefulLinkDto dto) {
    return UsefulLinkModel(
      url: dto.url,
      urlLabel: dto.urlLabel,
      description: dto.description,
    );
  }

  final String? url;
  final String? urlLabel;
  final String? description;
}
