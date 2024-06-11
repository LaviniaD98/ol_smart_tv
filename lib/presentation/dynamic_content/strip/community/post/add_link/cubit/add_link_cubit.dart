import 'package:open_learning_smart_tv/domain/entities/generic/post_link_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../utils/link_data.dart';
import '../add_link_page.dart';

part 'add_link_state.dart';
part 'add_link_cubit.freezed.dart';

@injectable
class AddLinkCubit extends Cubit<AddLinkState> {
  AddLinkCubit() : super(const AddLinkState.initial());

  void init(PostLinkPageArgs? args) async {
    if (args?.link != null && args!.link != null) {
      getPreview(args.link!.url, args.link!.label);
    }
  }

  Future<void> getPreview(String url, String label) async {
    if (state is _Initial) {
      final current = state as _Initial;
      final res = await getPreviewData(url);
      emit(
        current.copyWith(
          model: PostLinkModel(
            url: url,
            label: label,
            imageUrl: res.image?.url,
          ),
        ),
      );
    }
  }

  Future<void> reset() async {
    if (state is _Initial) {
      final current = state as _Initial;
      emit(current.copyWith(model: null));
    }
  }

  void confirm() {
    if (state is _Initial) {
      final current = state as _Initial;
      if (current.model != null) {
        emit(AddLinkState.confirm(current.model!));
      }
    }
  }
}
