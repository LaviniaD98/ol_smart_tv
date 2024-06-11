import 'package:open_learning_smart_tv/data/models/responses/generic/teacher_dto.dart';

class TeacherModel {
  TeacherModel({this.id, this.completeName, this.operationalField, this.image});

  factory TeacherModel.fromDto(TeacherDto dto) {
    return TeacherModel(
        id: dto.id,
        completeName: dto.completeName,
        operationalField: dto.operationalField,
        image: dto.image);
  }

  final int? id;
  final String? completeName;
  final String? operationalField;
  final String? image;
}
