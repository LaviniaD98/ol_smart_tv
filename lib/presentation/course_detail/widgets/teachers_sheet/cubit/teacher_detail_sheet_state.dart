part of 'teacher_detail_sheet_cubit.dart';

@freezed
class TeacherDetailSheetState with _$TeacherDetailSheetState {
  const factory TeacherDetailSheetState.loading() = _Loading;
  const factory TeacherDetailSheetState.error() = _Error;
  const factory TeacherDetailSheetState.success(TeacherDetailModel teacher) = _Done;
}
