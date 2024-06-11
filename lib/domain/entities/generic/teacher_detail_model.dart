import '../../../data/models/responses/generic/teacher_detail_dto.dart';

class TeacherDetailModel {
  TeacherDetailModel({
    this.completeName,
    this.description,
    this.image,
    this.email
  });

  factory TeacherDetailModel.fromDto(TeacherDetailDto dto) {
    return TeacherDetailModel(
      completeName: dto.completeName,
      description: dto.description,
      image: dto.image,
      email: dto.email,
    );
  }

  final String? completeName;
  final String? description;
  final String? image;
  final String? email;
}
