import 'package:open_learning_smart_tv/presentation/common/widgets/user_avatar/user_avatar.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/detail/cubit/post_detail_cubit.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/detail/widgets/add_comment_widget/cubit/add_comment_widget_cubit.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../../color_management/color_manager.dart';
import '../../../../../../../theme/app_theme.dart';
import '../../../../../../common/widgets/dialog/ol_alert_dialog.dart';
import '../../../../../../common/widgets/forms/reactive_text_field_input.dart';
import '../../../../../../common/widgets/styled_icon_button.dart';
import '../../../comments/cubit/comments_cubit.dart';
import 'widgets/event_tag.dart';

class AddCommentWidget extends StatefulWidget {
  const AddCommentWidget({
    super.key,
    required this.entityId,
    this.id,
    this.name,
    this.surname,
    this.apiPath,
  });

  final int? id;
  final String? name;
  final String? surname;
  final String? apiPath;
  final int entityId;

  @override
  State<AddCommentWidget> createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends State<AddCommentWidget> {
  @override
  void initState() {
    final commentsController = context.read<CommentsCubit>();
    final postDetailController = context.read<PostDetailCubit>();
    context
        .read<AddCommentWidgetCubit>()
        .init(postDetailController, commentsController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCommentWidgetCubit, AddCommentWidgetState>(
      listener: (context, state) {
        if (state.error) {
          OlAlertDialog.show(
            context,
            title: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
            message: LabelsManager().getRemoteStringFromLabelKeys(
                RemoteLabelKeys.error_occurred_try_later),
            actionLabel: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.close),
          );
        }
      },
      buildWhen: (previous, current) => !current.close,
      builder: (context, state) {
        return ReactiveForm(
          formGroup: context.read<AddCommentWidgetCubit>().form,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: Dimens.addCommentInput +
                MediaQuery.of(context).viewInsets.bottom,
            padding: const EdgeInsets.only(
              left: Dimens.spacingS,
              right: Dimens.spacingS,
            ),
            color: ColorManager().getColorBackgroundPrimary(),
            child: ReactiveFormConsumer(
              builder: (context, form, child) {
                return Row(
                  children: [
                    UserAvatar(
                      size: 40,
                      id: widget.id,
                      name: widget.name,
                      surname: widget.surname,
                    ),
                    const SizedBox(width: Dimens.spacingS),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          if (state.event != null) EventTag(state.event!),
                          SizedBox(
                            height: 40,
                            child: _ReactiveCommentInput(
                              formControlName: 'value',
                              hintText: _getHintByEvent(state.event),
                              focusNode: context
                                  .read<AddCommentWidgetCubit>()
                                  .focusNode,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: Dimens.spacingS),
                    StyledIconButton(
                      onTap: () async {
                        if (form.valid && !state.loading) {
                          final message =
                              form.findControl('value')?.value as String;
                          context.read<AddCommentWidgetCubit>().confirm(
                                message: message,
                                entityId: widget.entityId,
                                apiPath: widget.apiPath,
                              );
                        }
                      },
                      radius: Dimens.radiusXXS,
                      size: 40.0,
                      svgPath: 'assets/icons/right_arrow.svg',
                      backgroundColor: form.valid
                          ? ColorManager().getColorBackgroundPrimaryCta()
                          : ColorManager().getColorBackgroundDisabled(),
                      iconColor:
                          ColorManager().getColorTextPrimaryAlternative(),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  String _getHintByEvent(EventData? event) => switch (event?.type) {
        EventInputType.addAnswer => LabelsManager()
            .getRemoteStringFromLabelKeys(
                RemoteLabelKeys.community_insert_answer),
        EventInputType.editAnswer => LabelsManager()
            .getRemoteStringFromLabelKeys(
                RemoteLabelKeys.community_modify_answer),
        EventInputType.editComment => LabelsManager()
            .getRemoteStringFromLabelKeys(
                RemoteLabelKeys.community_modify_comment),
        _ => LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.insert_comment),
      };
}

class _ReactiveCommentInput<T> extends StatelessWidget {
  static const _height = 40.0;
  final String formControlName;
  final FocusNode focusNode;
  final String? hintText;
  final ReactiveFormFieldCallback<T>? onChanged;
  final ReactiveFormFieldCallback<T>? onEditingComplete;
  final ReactiveFormFieldCallback<T>? onSubmitted;

  const _ReactiveCommentInput({
    super.key,
    required this.focusNode,
    required this.formControlName,
    this.hintText,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radiusXXS),
        color: ColorManager().getColorBackgroundSecondary(),
      ),
      alignment: Alignment.center,
      child: ReactiveTextFieldInput(
        focusNode: focusNode,
        formControlName: formControlName,
        keyboardType: TextInputType.multiline,
        cursorColor: ColorManager().getColorTextPrimaryAlternative(),
        style: AppTextTheme.body(
            color: ColorManager().getColorTextPrimaryAlternative()),
        textAlignVertical: TextAlignVertical.center,
        minLines: 1,
        maxLines: 2,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: Dimens.spacingXS,
            right: Dimens.spacingXS,
            // bottom: _height / 2,
          ),
          hintMaxLines: 1,
          hintText: hintText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintStyle: AppTextTheme.caption(
              color: ColorManager().getColorTextDisabled()),
        ),
        showErrors: (_) => false,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
