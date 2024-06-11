// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linkedin_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkedInResponseModel _$LinkedInResponseModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'LinkedInResponseModel',
      json,
      ($checkedConvert) {
        final val = LinkedInResponseModel(
          $checkedConvert('webURL', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$LinkedInResponseModelToJson(
        LinkedInResponseModel instance) =>
    <String, dynamic>{
      'webURL': instance.webURL,
    };
