import '../../../data/models/responses/generic/url_dto.dart';

class UrlModel {
  final String? privateUrl;
  final String? publicUrl;

  const UrlModel({
    this.privateUrl,
    this.publicUrl,
  });

  factory UrlModel.fromResponse(UrlDto? response) {
    return UrlModel(
        privateUrl: response?.privateUrl,
        publicUrl: response?.publicUrl,
    );
  }
}
