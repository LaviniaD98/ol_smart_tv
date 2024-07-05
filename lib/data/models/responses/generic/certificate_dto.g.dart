// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificateDto _$CertificateDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CertificateDto',
      json,
      ($checkedConvert) {
        final val = CertificateDto(
          $checkedConvert('id', (v) => (v as num?)?.toInt()),
          $checkedConvert('name', (v) => v as String?),
          $checkedConvert('description', (v) => v as String?),
          $checkedConvert('expiresInMonths', (v) => (v as num?)?.toInt()),
          $checkedConvert('templatePath', (v) => v as String?),
          $checkedConvert('isEnable', (v) => v as bool?),
          $checkedConvert('learningObjectId', (v) => (v as num?)?.toInt()),
          $checkedConvert('issuedOn', (v) => v as String?),
          $checkedConvert('learningObjectTitle', (v) => v as String?),
          $checkedConvert('type', (v) => v as String?),
          $checkedConvert('iconURL', (v) => v as String?),
        );
        return val;
      },
    );
