// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollment_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollmentResponseDto _$EnrollmentResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'EnrollmentResponseDto',
      json,
      ($checkedConvert) {
        final val = EnrollmentResponseDto(
          $checkedConvert('enrollNotSaved',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert('enrollSaved',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          $checkedConvert('errorMessage', (v) => v as String?),
          $checkedConvert('numberNotSaved', (v) => (v as num?)?.toInt()),
          $checkedConvert('numberSaved', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
    );
