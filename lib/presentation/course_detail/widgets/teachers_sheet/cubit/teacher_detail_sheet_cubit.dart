import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/generic/teacher_detail_model.dart';
import '../../../../../domain/use_cases/detail/get_teacher_detail_use_case.dart';

part 'teacher_detail_sheet_state.dart';
part 'teacher_detail_sheet_cubit.freezed.dart';

@injectable
class TeacherDetailSheetCubit extends Cubit<TeacherDetailSheetState> {
  final GetTeacherDetailUseCase _getTeacherDetailUseCase;

  TeacherDetailSheetCubit(
    this._getTeacherDetailUseCase,
  ) : super(const TeacherDetailSheetState.loading());

  void init(int? teacherId) async {
    final res = await _getTeacherDetailUseCase(teacherId);

    res.fold(
      (l) => emit(const TeacherDetailSheetState.error()),
      (r) => emit(TeacherDetailSheetState.success(r)),
    );
  }
}
