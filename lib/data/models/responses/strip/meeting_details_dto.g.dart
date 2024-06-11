// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetingDetailsDto _$MeetingDetailsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MeetingDetailsDto',
      json,
      ($checkedConvert) {
        final val = MeetingDetailsDto(
          $checkedConvert('meetingNumber', (v) => v as int?),
          $checkedConvert('startDate', (v) => v as String?),
          $checkedConvert('endDate', (v) => v as String?),
        );
        return val;
      },
    );
