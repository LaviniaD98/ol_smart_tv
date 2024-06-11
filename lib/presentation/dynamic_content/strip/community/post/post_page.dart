import 'package:open_learning_smart_tv/domain/entities/user/user_info_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/app_bar/styled_app_bar.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/post/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../domain/entities/generic/post_link_model.dart';
import '../../../../../domain/enums/types.dart';
import '../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../common/widgets/dialog/ol_alert_dialog.dart';
import '../../../../common/widgets/forms/reactive_text_field_input.dart';
import '../../../../common/widgets/user_info.dart';
import 'add_link/add_link_page.dart';
import 'utils/post_form.dart';
import 'widgets/post_link_item.dart';

class PostPage extends StatelessWidget {
  static String routeName = 'post';
  final PostPageArgs? args;

  const PostPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => PostForm.build(args?.body),
      builder: (context, formGroup, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: StyledAppBar(
              title: _setTitle(),
              actions: [
                BlocBuilder<PostCubit, PostState>(
                  builder: (context, state) {
                    final enable = state.maybeWhen(
                      loading: () => false,
                      error: (_) => false,
                      orElse: () => true,
                    );
                    return ReactiveFormConsumer(
                        builder: (context, formGroup, child) {
                      final edit =
                          args != null && args!.pageType == PostPageType.edit;
                      return ElevatedButton(
                        onPressed: enable && formGroup.valid
                            ? () {
                                if (edit) {
                                  context.read<PostCubit>().edit(formGroup
                                      .findControl('body')
                                      ?.value as String);
                                } else {
                                  if (args?.pageType == PostPageType.shared) {
                                    context.read<PostCubit>().createSharedPosts(
                                          formGroup.findControl('body')?.value
                                              as String,
                                          args?.loId,
                                          args?.loAuthor,
                                          args?.loType,
                                        );
                                  } else {
                                    context.read<PostCubit>().create(formGroup
                                        .findControl('body')
                                        ?.value as String);
                                  }
                                }
                              }
                            : null,
                        child: Text(
                          edit
                              ? LabelsManager().getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys.save)
                              : LabelsManager().getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys.publish),
                        ),
                      );
                    });
                  },
                )
              ],
            ),
            body: BlocConsumer<PostCubit, PostState>(
              listener: (BuildContext context, PostState state) =>
                  state.whenOrNull(
                error: (error) async {
                  final res = await OlAlertDialog.show(
                    context,
                    title: LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                    message: error.error ??
                        LabelsManager().getRemoteStringFromLabelKeys(
                            RemoteLabelKeys.error_occurred_try_later),
                    actionLabel: LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.close),
                    barrierDismissible: false,
                  );
                  if (context.mounted && res != null && res) {
                    context.pop();
                  }
                  return null;
                },
                success: () => context.pop(true),
              ),
              buildWhen: (previous, current) => current.maybeWhen(
                error: (_) => false,
                success: () => false,
                orElse: () => true,
              ),
              builder: (context, state) => state.maybeMap(
                loading: (value) => const Center(
                  child: CircularProgressIndicator(),
                ),
                initialized: (_) => _done(
                  context,
                  userInfo: _.userInfo,
                  imageUrl: _.imageUrl,
                  link: _.link,
                  pageType: args?.pageType,
                  postType: args?.postType,
                ),
                error: (value) => const SizedBox.shrink(),
                orElse: () => const SizedBox.shrink(),
              ),
            ),
          ),
        );
      },
    );
  }

  String _setTitle() {
    if (args != null) {
      return switch (args!.pageType) {
        PostPageType.create => LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.post_add_title),
        PostPageType.edit => LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.post_edit_title),
        PostPageType.shared =>
          LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.share),
      };
    }
    return "";
  }
}

Widget _done(
  BuildContext context, {
  required UserInfoModel userInfo,
  String? imageUrl,
  PostLinkModel? link,
  PostPageType? pageType,
  PostType? postType,
}) {
  return Stack(
    fit: StackFit.expand,
    children: [
      ListView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(
          Dimens.spacingL,
          Dimens.spacingM,
          Dimens.spacingL,
          MediaQuery.of(context).viewInsets.bottom + 56 + Dimens.spacingL,
        ),
        children: [
          UserInfo(
            imageUrl: imageUrl,
            name: userInfo.user?.name,
            lastName: userInfo.user?.surname,
          ),
          const SizedBox(height: Dimens.spacingM),
          ReactiveTextFieldInput(
            autofocus: true,
            formControlName: 'body',
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 20,
            maxLength: 500,
            decoration: InputDecoration(
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              hintText: LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.post_add_button),
              hintStyle: AppTextTheme.body(
                color: ColorManager().getColorTextDisabled(),
              ),
              counterStyle: AppTextTheme.caption(
                color: ColorManager().getColorTextPrimary(),
              ),
            ),
            style: AppTextTheme.body(
              color: ColorManager().getColorTextPrimary(),
            ),
            showErrors: (_) => false,
          ),
          if (link != null) ...[
            const SizedBox(height: Dimens.spacingL),
            PostLinkItem(link, onClose: context.read<PostCubit>().resetLink),
          ],
        ],
      ),
      if ((pageType != PostPageType.shared && postType == null) ||
          (postType != null && postType == PostType.POST))
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () async {
              final data = await context.pushNamed<PostLinkModel?>(
                PostLinkPage.routeName,
                extra: PostLinkPageArgs(
                  link: link,
                ),
              );
              if (context.mounted && data != null) {
                context.read<PostCubit>().setLink(data);
              }
            },
            child: Container(
              height: 56 + MediaQuery.of(context).viewPadding.bottom,
              padding: EdgeInsets.fromLTRB(
                Dimens.spacingL,
                0,
                Dimens.spacingL,
                MediaQuery.of(context).viewPadding.bottom,
              ),
              alignment: Alignment.centerLeft,
              color: ColorManager().getColorBackgroundPrimaryLighter(),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/link.svg",
                    width: 20,
                    colorFilter: ColorFilter.mode(
                      ColorManager().getColorTextPrimaryCta(),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: Dimens.spacingM),
                  Expanded(
                      child: Text(
                    LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.link),
                    style: AppTextTheme.body(
                      color: ColorManager().getColorTextPrimaryCta(),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
    ],
  );
}

class PostPageArgs {
  final PostPageType pageType;
  final PostType? postType;
  final String? id;
  final String? body;
  final PostLinkModel? link;
  final String? loId;
  final String? loAuthor;
  final LearningObjectTypology? loType;

  PostPageArgs({
    required this.pageType,
    this.postType,
    this.id,
    this.body,
    this.link,
    this.loId,
    this.loAuthor,
    this.loType,
  });
}

enum PostPageType { create, edit, shared }
