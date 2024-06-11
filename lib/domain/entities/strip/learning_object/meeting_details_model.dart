import '../../../../data/models/responses/strip/meeting_details_dto.dart';

class MeetingDetailsModel {
  MeetingDetailsModel({
    this.meetingNumber,
    this.startDate,
    this.endDate,
  });

  factory MeetingDetailsModel.fromDto(MeetingDetailsDto? dto) {
    return MeetingDetailsModel(
      meetingNumber: dto?.meetingNumber,
      startDate: dto?.startDate,
      endDate: dto?.endDate,
    );
  }

  final int? meetingNumber;
  final String? startDate;
  final String? endDate;
}