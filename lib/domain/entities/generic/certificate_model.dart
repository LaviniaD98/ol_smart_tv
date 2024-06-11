import 'package:open_learning_smart_tv/data/models/responses/generic/certificate_dto.dart';

class CertificateModel {
  CertificateModel({
    this.id,
    this.name,
    this.description,
    this.expiresInMonths,
    this.templatePath,
    this.isEnable,
    this.learningObjectId,
    this.issuedOn,
    this.learningObjectTitle,
    this.type,
    this.iconURL,
  });

  factory CertificateModel.fromDto(CertificateDto? dto) {
    return CertificateModel(
      id: dto?.id,
      name: dto?.name,
      description: dto?.description,
      expiresInMonths: dto?.expiresInMonths,
      templatePath: dto?.templatePath,
      isEnable: dto?.isEnable,
      learningObjectId: dto?.learningObjectId,
      issuedOn: dto?.issuedOn,
      learningObjectTitle: dto?.learningObjectTitle,
      type: dto?.type,
      iconURL: dto?.iconURL,
    );
  }

  final int? id;
  final String? name;
  final String? description;
  final int? expiresInMonths;
  final String? templatePath;
  final bool? isEnable;
  final int? learningObjectId;
  final String? issuedOn;
  final String? learningObjectTitle;
  final String? type;
  final String? iconURL;
}
