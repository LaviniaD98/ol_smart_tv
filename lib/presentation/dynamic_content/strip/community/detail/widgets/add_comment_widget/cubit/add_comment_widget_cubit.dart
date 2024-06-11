import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/detail/cubit/post_detail_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../../../domain/entities/community/comment/comment_model.dart';
import '../../../../../../../../domain/use_cases/community/add_answer_use_case.dart';
import '../../../../../../../../domain/use_cases/community/add_comment_use_case.dart';
import '../../../../../../../../domain/use_cases/community/delete_comment_use_case.dart';
import '../../../../../../../../domain/use_cases/community/edit_comment_use_case.dart';
import '../../../../comments/cubit/comments_cubit.dart';
import '../../../../cubit/community_wall_cubit.dart';

part 'add_comment_widget_cubit.freezed.dart';
part 'add_comment_widget_state.dart';

@injectable
class AddCommentWidgetCubit extends Cubit<AddCommentWidgetState> {
  final AddCommentUseCase _addCommentUseCase;
  final AddAnswerUseCase _addAnswerUseCase;
  final EditCommentUseCase _editCommentUseCase;
  final DeleteCommentUseCase _deleteCommentUseCase;
  final CommunityWallCubit _communityWallCubit;

  AddCommentWidgetCubit(
    this._addCommentUseCase,
    this._addAnswerUseCase,
    this._editCommentUseCase,
    this._deleteCommentUseCase,
    this._communityWallCubit,
  ) : super(const AddCommentWidgetState.initial());

  late PostDetailCubit postDetailController;
  late CommentsCubit commentsController;

  void init(PostDetailCubit detail, CommentsCubit comments) {
    postDetailController = detail;
    commentsController = comments;
  }

  FormGroup form = FormGroup({
    'value': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
  });

  FocusNode get focusNode => _focusNode;

  final _focusNode = FocusNode();

  Future<void> reply(EventData event) async {
    _focusNode.requestFocus();
    emit(state.copyWith(event: event));
  }

  Future<void> edit(EventData event) async {
    _focusNode.requestFocus();
    form.control('value').value = event.data.body;
    emit(state.copyWith(event: event));
  }

  void reset() {
    form.reset();
    emit(const AddCommentWidgetState.initial());
  }

  void confirm({
    required String message,
    required int entityId,
    String? apiPath,
  }) async {
    emit(state.copyWith(loading: true));
    bool error = false;

    error = switch (state.event?.type) {
      EventInputType.editAnswer => await _editAnswer(
          message: message,
          data: state.event?.data,
          apiPath: apiPath,
        ),
      EventInputType.addAnswer => await _addAnswer(message, apiPath),
      EventInputType.editComment => await _editComment(
          message: message,
          data: state.event?.data,
          apiPath: apiPath,
        ),
      _ => await _addComment(
          message: message,
          entityId: entityId,
          apiPath: apiPath,
        ),
    };

    if (error) {
      /// Error
      _emitError();
    } else {
      /// Success
      form.reset();
      emit(state.copyWith(error: error, event: null, loading: false));
    }
  }

  Future<bool> _addAnswer(String message, String? apiPath) async {
    final res = await _addAnswerUseCase(
      commentId: state.event!.data.commentId,
      message: message,
      apiPath: apiPath,
    );
    return res.fold((l) => true, (r) {
      state.event?.onSuccess?.call();
      postDetailController.refresh();
      _communityWallCubit.refresh();
      return false;
    });
  }

  Future<bool> _addComment({
    required String message,
    required int entityId,
    String? apiPath,
  }) async {
    final res = await _addCommentUseCase(
      entityId: entityId,
      message: message,
      apiPath: apiPath,
    );
    return res.fold((l) => true, (r) {
      postDetailController.refresh();
      commentsController.pagedController.refresh();
      _communityWallCubit.refresh();
      return false;
    });
  }

  Future<bool> _editComment({
    required CommentModel? data,
    required String message,
    String? apiPath,
  }) async {
    if (data == null || data.ownerId == null) return true;
    final res = await _editCommentUseCase(
      commentId: data.commentId,
      message: message,
      apiPath: apiPath,
    );
    return res.fold((l) => true, (r) {
      commentsController.pagedController.refresh();
      return false;
    });
  }

  Future<bool> _editAnswer({
    required CommentModel? data,
    required String message,
    String? apiPath,
  }) async {
    if (data == null || data.ownerId == null) return true;
    final res = await _editCommentUseCase(
      commentId: data.commentId,
      message: message,
      apiPath: apiPath,
    );
    return res.fold((l) => true, (r) {
      state.event?.onSuccess?.call();
      _communityWallCubit.refresh();
      return false;
    });
  }

  Future<void> deleteComment({
    int? id,
    String? apiPath,
  }) async {
    if (id == null) {
      /// error state
      emit(state.copyWith(error: true, loading: false));
    } else {
      final res = await _deleteCommentUseCase(
        id,
        apiPath: apiPath,
      );

      final error = res.fold((l) => true, (r) {
        _communityWallCubit.refresh();
        postDetailController.refresh();
        commentsController.pagedController.refresh();
        return false;
      });

      if (error) {
        /// Error
        _emitError();
      } else {
        /// Success
        emit(state.copyWith(error: error, loading: false));
      }
    }
  }

  Future<void> deleteAnswer({
    int? id,
    required VoidCallback onSuccess,
    String? apiPath,
  }) async {
    if (id == null) {
      /// error state
      emit(state.copyWith(error: true, loading: false));
    } else {
      final res = await _deleteCommentUseCase(
        id,
        apiPath: apiPath,
      );

      final error = res.fold((l) => true, (r) {
        _communityWallCubit.refresh();
        postDetailController.refresh();
        onSuccess();
        return false;
      });

      if (error) {
        /// Error
        _emitError();
      } else {
        /// Success
        emit(state.copyWith(error: error, loading: false));
      }
    }
  }

  void _emitError() {
    emit(const AddCommentWidgetState.initial(error: true));
    emit(state.copyWith(error: false));
  }

  @override
  Future<void> close() {
    form.dispose();
    return super.close();
  }
}

class EventData {
  final EventInputType type;
  final CommentModel data;
  final VoidCallback? onSuccess;

  EventData({
    required this.data,
    this.onSuccess,
    required this.type,
  });
}

enum EventInputType {
  editComment,
  addAnswer,
  editAnswer,
}
