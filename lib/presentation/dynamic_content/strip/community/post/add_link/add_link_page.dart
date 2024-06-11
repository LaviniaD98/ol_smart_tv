import 'package:open_learning_smart_tv/presentation/common/widgets/app_bar/styled_app_bar.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/community/post/add_link/cubit/add_link_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../color_management/color_manager.dart';
import '../../../../../../domain/entities/generic/post_link_model.dart';
import '../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../../theme/app_theme.dart';
import '../../../../../common/widgets/forms/reactive_text_field_input.dart';
import '../post_page.dart';
import '../utils/post_form.dart';
import '../widgets/post_link_item.dart';

class PostLinkPage extends StatelessWidget {
  static String routeName = 'post-link';

  const PostLinkPage({super.key, this.args});
  final PostLinkPageArgs? args;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddLinkCubit, AddLinkState>(
      listener: (context, state) => state.mapOrNull(
        confirm: (value) {
          if (args?.replace == true) {
            context.pushReplacementNamed(
              PostPage.routeName,
              extra: PostPageArgs(
                pageType: PostPageType.create,
                link: value.model,
              ),
            );
          } else {
            context.pop(value.model);
          }
          return null;
        },
      ),
      child: ReactiveFormBuilder(
        form: () => PostLinkForm.build(args?.link?.url, args?.link?.label),
        builder: (context, formGroup, child) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: StyledAppBar(
                title: LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.add_link),
                actions: [
                  ReactiveFormConsumer(builder: (context, formGroup, child) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: formGroup.valid
                          ? context.read<AddLinkCubit>().confirm
                          : null,
                      child: Text(
                        LabelsManager()
                            .getRemoteStringFromLabelKeys(RemoteLabelKeys.end),
                        style: AppTextTheme.caption(
                          color: formGroup.valid
                              ? ColorManager().getColorTextPrimaryCta()
                              : ColorManager().getColorTextDisabled(),
                        ),
                      ),
                    );
                  }),
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.spacingL,
                  vertical: Dimens.spacingM,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ReactiveFormConsumer(
                      builder: (context, formGroup, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              LabelsManager().getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys.link),
                              style: AppTextTheme.caption(
                                color: ColorManager().getColorTextPrimary(),
                              ),
                            ),
                            const SizedBox(height: Dimens.spacingXS),
                            ReactiveTextFieldInput<String>(
                              formControlName: 'url',
                              onChanged: (control) {
                                if (control.value != null &&
                                    control.value!.isEmpty) {
                                  context.read<AddLinkCubit>().reset();
                                } else if (formGroup.valid) {
                                  final url = formGroup
                                      .findControl('url')
                                      ?.value as String;
                                  final label = formGroup
                                      .findControl('label')
                                      ?.value as String;
                                  context
                                      .read<AddLinkCubit>()
                                      .getPreview(url, label);
                                }
                              },
                              showErrors: (_) => false,
                              decoration: InputDecoration(
                                hintText: LabelsManager()
                                    .getRemoteStringFromLabelKeys(
                                        RemoteLabelKeys.insert_url),
                                hintStyle: AppTextTheme.body(
                                  color: ColorManager().getColorTextDisabled(),
                                ),
                              ),
                              style: AppTextTheme.body(
                                color: ColorManager().getColorTextPrimary(),
                              ),
                            ),
                            const SizedBox(height: Dimens.spacingXL),
                            Text(
                              LabelsManager().getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys.title),
                              style: AppTextTheme.caption(
                                color: ColorManager().getColorTextPrimary(),
                              ),
                            ),
                            const SizedBox(height: Dimens.spacingXS),
                            ReactiveTextFieldInput<String>(
                              formControlName: 'label',
                              onChanged: (control) {
                                if (control.value != null &&
                                    control.value!.isEmpty) {
                                  context.read<AddLinkCubit>().reset();
                                } else if (formGroup.valid) {
                                  final url = formGroup
                                      .findControl('url')
                                      ?.value as String;
                                  final label = formGroup
                                      .findControl('label')
                                      ?.value as String;
                                  context
                                      .read<AddLinkCubit>()
                                      .getPreview(url, label);
                                }
                              },
                              showErrors: (_) => false,
                              decoration: InputDecoration(
                                hintText: LabelsManager()
                                    .getRemoteStringFromLabelKeys(
                                        RemoteLabelKeys.insert_link_title),
                                hintStyle: AppTextTheme.body(
                                  color: ColorManager().getColorTextDisabled(),
                                ),
                              ),
                              style: AppTextTheme.body(
                                color: ColorManager().getColorTextPrimary(),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    BlocBuilder<AddLinkCubit, AddLinkState>(
                      builder: (context, state) => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 120),
                        child: state.maybeWhen(
                          initial: (model) {
                            if (model != null) {
                              return Padding(
                                key: const ValueKey('link_state_data'),
                                padding: const EdgeInsets.only(
                                    top: Dimens.spacingXXL),
                                child: PostLinkItem(
                                  model,
                                  onClose: () {
                                    formGroup.reset();
                                    context.read<AddLinkCubit>().reset();
                                  },
                                ),
                              );
                            }
                            return const SizedBox.shrink(
                              key: ValueKey('link_state_error'),
                            );
                          },
                          orElse: () => const SizedBox.shrink(
                            key: ValueKey('link_state_no_data'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PostLinkPageArgs {
  final PostLinkModel? link;
  final bool replace;

  PostLinkPageArgs({
    this.link,
    this.replace = false,
  });
}
