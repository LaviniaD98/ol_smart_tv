import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/domain/entities/generic/edition_model.dart';
import 'package:open_learning_smart_tv/domain/use_cases/edition/edition_register_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'edition_state.dart';
part 'edition_cubit.freezed.dart';

@injectable
class EditionCubit extends Cubit<EditionState> {
  final EditionRegisterUseCase _editionRegisterUseCase;

  EditionCubit(
    this._editionRegisterUseCase,
  ) : super(const EditionState.initial());

  Future<void> init(EditionModel editionModel, DetailPageModel model) async {
    emit(const EditionState.register());
  }

  Future<void> register(
      EditionModel editionModel, DetailPageModel model) async {
    emit(const EditionState.registered());
  }
}
