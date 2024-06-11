import 'package:open_learning_smart_tv/domain/entities/ecm/ecm_discipline_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';

import '../../../../../../../domain/entities/ecm/ecm_profession_model.dart';
import '../../../../../../../domain/use_cases/ecm/get_ecm_disciplines_use_case.dart';
import '../../../../../../../domain/use_cases/ecm/get_ecm_professions_use_case.dart';
import '../../../../../../../remote_theming/config/config_manager.dart';
import '../../../../../../../remote_theming/config/remote_config_keys.dart';
import '../ecm_first_step.dart';

part 'ecm_first_step_state.dart';
part 'ecm_first_step_cubit.freezed.dart';

@injectable
class EcmFirstStepCubit extends Cubit<EcmFirstStepState> {
  final GetEcmProfessionsUseCase _ecmProfessionsUseCase;
  final GetEcmDisciplinesUseCase _ecmDisciplinesUseCase;

  EcmFirstStepCubit(
    this._ecmProfessionsUseCase,
    this._ecmDisciplinesUseCase,
  ) : super(const EcmFirstStepState.initial());

  PagingController<int, EcmProfessionModel> professionsController =
      PagingController(firstPageKey: 0);
  PagingController<int, EcmDisciplineModel> disciplinesController =
      PagingController(firstPageKey: 0);
  get _listenerProfession => (pageKey) => _fetchProfession(pageKey);
  get _listenerDiscipline => (pageKey) => _fetchDisciplines(pageKey);

  int pageSize = ConfigManager()
      .getRemoteInt(RemoteConfigKeys.ecm_registration_dropdown, 2);

  void init(EcmFirstStepArgs? args) {
    professionsController.addPageRequestListener(_listenerProfession);
    if (args != null) {
      _initDisciplinesController();
      emit(state.copyWith(
        professions: [...args.professions],
        disciplines: [...args.disciplines],
      ));
    }
  }

  void _initDisciplinesController() {
    disciplinesController.addPageRequestListener(_listenerDiscipline);
  }

  void _fetchProfession(int page) async {
    final res = await _ecmProfessionsUseCase(
      page: page,
      pageSize: pageSize,
    );
    res.fold((l) {
      professionsController.error = l.error;
    }, (r) {
      if (r.metadata != null && r.metadata!.totalPages != null) {
        final isLast = page == r.metadata!.totalPages! - 1;
        _updateProfessionPagingController(
          items: r.items,
          page: page,
          isLast: isLast,
        );
      } else {
        final isLast = r.items.length < pageSize;
        _updateProfessionPagingController(
          items: r.items,
          page: page,
          isLast: isLast,
        );
      }
    });
  }

  void _fetchDisciplines(int page) async {
    final res = await _ecmDisciplinesUseCase(
      page: page,
      pageSize: pageSize,
      professionIds: state.professions?.map((e) => e.id).toList(),
    );

    res.fold((l) {
      disciplinesController.error = l.error;
    }, (r) {
      if (r.metadata != null && r.metadata!.totalPages != null) {
        final isLast = page == r.metadata!.totalPages! - 1;
        _updateDisciplinePagingController(
          items: r.items,
          page: page,
          isLast: isLast,
        );
      } else {
        final isLast = r.items.length < pageSize;
        _updateDisciplinePagingController(
          items: r.items,
          page: page,
          isLast: isLast,
        );
      }
    });
  }

  void _updateProfessionPagingController(
      {required bool isLast,
      required List<EcmProfessionModel> items,
      required int page}) {
    if (isLast) {
      professionsController.appendLastPage(items);
    } else {
      final nextPageKey = page += 1;
      professionsController.appendPage(items, nextPageKey);
    }
  }

  void _updateDisciplinePagingController(
      {required bool isLast,
      required List<EcmDisciplineModel> items,
      required int page}) {
    if (isLast) {
      disciplinesController.appendLastPage(items);
    } else {
      final nextPageKey = page += 1;
      disciplinesController.appendPage(items, nextPageKey);
    }
  }

  void onProfessionsChanged(List<EcmProfessionModel> items) async {
    List<EcmDisciplineModel>? disciplines;
    if (state.disciplines != null && state.disciplines!.isNotEmpty) {
      disciplines = state.disciplines!
          .where((element) => (items.firstWhereOrNull(
                  (EcmProfessionModel e) => e.id == element.profession.id) !=
              null))
          .toList();
    }
    if (state.professions == null && items.isNotEmpty) {
      _initDisciplinesController();
      emit(state
          .copyWith(professions: [...items], disciplines: [...?disciplines]));
    } else {
      emit(state
          .copyWith(professions: [...items], disciplines: [...?disciplines]));
      disciplinesController.refresh();
    }
  }

  void onDisciplinesChanged(List<EcmDisciplineModel> items) async {
    emit(state.copyWith(disciplines: [...items]));
  }

  void onConfirm(
      EcmFirstStepArgs args, void Function(EcmFirstStepArgs) nextStep) {
    if (_formValidation(args)) {
      nextStep.call(args);
    } else {
      emit(state.copyWith(error: true));
    }
  }

  bool _formValidation(EcmFirstStepArgs args) {
    for (var profession in args.professions) {
      if (args.disciplines.firstWhereOrNull(
              (element) => profession.id == element.profession.id) ==
          null) {
        return false;
      }
    }
    return true;
  }

  @override
  Future<void> close() {
    professionsController.removePageRequestListener(_listenerProfession);
    professionsController.dispose();
    disciplinesController.removePageRequestListener(_listenerDiscipline);
    disciplinesController.dispose();
    return super.close();
  }
}
