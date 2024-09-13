import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/learning_card.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/keyboard/onscreen_keyboard.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/list_header_title.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/error/error_screen.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/presentation/search/cubit/search_cubit.dart';
import 'package:open_learning_smart_tv/presentation/search/cubit/suggestions_cubit.dart';
import 'package:open_learning_smart_tv/presentation/search/widgets/local_suggestions.dart';
import 'package:open_learning_smart_tv/presentation/search/widgets/suggestions.dart';
import 'package:open_learning_smart_tv/presentation/wall/widgets/on_scroll_error.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin {
  final OrderedTraversalPolicy _focusNodeOrder = OrderedTraversalPolicy();
  final focusNode = FocusScopeNode(debugLabel: 'Search');
  final textEditingController = TextEditingController();
  ValueNotifier<String> textNotifier = ValueNotifier<String>('');

  final autoScrollController = AutoScrollController(
    viewportBoundaryGetter: () => const Rect.fromLTRB(0, 340, 0, 0),
    axis: Axis.vertical,
  );

  FormGroup form = FormGroup({
    'search': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(3),
      ],
    )
  });

  @override
  void initState() {
    super.initState();
    context.read<MainStateCubit>().searchFocusNode = focusNode;
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => getIt<SuggestionsCubit>()..localSuggestions(),
      child: ReactiveForm(
        formGroup: form,
        child: FocusTraversalGroup(
          policy: _focusNodeOrder,
          child: Focus(
            focusNode: focusNode,
            onFocusChange: (value) {
              setState(() {});
            },
            child: Scaffold(
              body: Row(
                children: [
                  const SizedBox(width: Dimens.hViewPadding),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 50),
                        Row(
                          children: [
                            Expanded(
                              child: ValueListenableBuilder(
                                valueListenable: textNotifier,
                                builder: (context, value, _) {
                                  return Text(
                                    value.isEmpty ? 'Start Searching' : value,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextTheme.body(
                                      color: value.isEmpty
                                          ? ColorManager()
                                              .getColorTextDisabled()
                                          : ColorManager()
                                              .getColorTextPrimary(),
                                      weight: FontWeight.w500,
                                      size: 40,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  OLButton(
                                    title: 'Clear',
                                    width: 120,
                                    outline: true,
                                    onPressed: () async {
                                      form.reset();
                                      form.findControl('search')?.value = '';
                                      textNotifier.value = '';
                                      context
                                          .read<SuggestionsCubit>()
                                          .localSuggestions();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: OLColors.textPrimary,
                          height: 4,
                          thickness: 4,
                        ),
                        const SizedBox(height: 23),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            height: 370,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: OLColors.textPrimary,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: buildKeyboard()),
                                buildSearchButton(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Expanded(
                          child: BlocBuilder<SuggestionsCubit, List<String>>(
                            builder: (context, state) {
                              return LocalSuggestions(
                                state,
                                onDelete: () => context
                                    .read<SuggestionsCubit>()
                                    .localSuggestions(true),
                                onTap: (control) {
                                  form.findControl('search')?.value =
                                      control.trim();

                                  textNotifier.value = control.trim();

                                  context.read<SearchCubit>().onChanged('');

                                  Future.delayed(
                                    const Duration(milliseconds: 600),
                                    () {
                                      if (context.mounted) {
                                        context.read<SearchCubit>()
                                          ..resetPagingController()
                                          ..initPagingController(
                                            control.trim(),
                                          );

                                        context
                                            .read<SuggestionsCubit>()
                                            .setLocalSuggestions(text: control);
                                      }
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: Dimens.hViewPadding),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: AppTheme.backgroundGradient,
                      ),
                      child: BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) => state.maybeWhen(
                          initial: (suggestions) {
                            return const SizedBox.shrink();
                          },
                          suggestions: (items, search) {
                            return Suggestions(items, search: search);
                          },
                          searchPaginated: () {
                            return _searchPaginated(context);
                          },
                          error: _error,
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          empty: _empty,
                          orElse: () => const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildKeyboard() {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 540,
        child: ValueListenableBuilder(
          valueListenable: textNotifier,
          builder: (context, value, _) {
            return OnscreenKeyboard(
              initialCase: InitialCase.LOWER_CASE,
              onFocusOutside: (side) {
                if (side == TraversalDirection.left) {
                  final focus = context.read<MainStateCubit>().state;
                  focus.requestFocus();
                }
              },
              value: value,
              buttonColor: Colors.black,
              focusColor: Colors.grey.shade900,
              onChanged: (txt) {
                final text = (txt ?? '').trim();
                textNotifier.value = text;
                form.findControl('search')?.value = text;
                context.read<SearchCubit>().onChanged(text);
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildSearchButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ValueListenableBuilder(
        valueListenable: textNotifier,
        builder: (context, child, _) {
          return OLButton(
            title: '',
            icon: Icons.search_rounded,
            backgroundColor: OLColors.accentVariantA,
            foregroundColor: OLColors.backgroundPrimary,
            width: 120,
            outline: true,
            onPressed: form.valid
                ? () {
                    final text =
                        (form.findControl('search')?.value as String?) ?? '';

                    context.read<SearchCubit>().initPagingController(text);
                    context
                        .read<SuggestionsCubit>()
                        .setLocalSuggestions(text: text);
                  }
                : null,
          );
        },
      ),
    );
  }

  Widget _searchPaginated(BuildContext context) {
    final cubit = context.read<SearchCubit>();

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 140.0),
          child: PagedGridView<int, LearningObjectModel>(
            scrollController: autoScrollController,
            padding: const EdgeInsets.only(
              left: Dimens.hViewPadding,
              right: Dimens.hViewPadding - 24,
              top: Dimens.spacingM,
              bottom: 200,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
              mainAxisSpacing: 24,
              crossAxisSpacing: 12,
            ),
            builderDelegate: PagedChildBuilderDelegate<LearningObjectModel>(
              itemBuilder: (context, item, index) {
                return AutoScrollTag(
                  key: ValueKey(index),
                  controller: autoScrollController,
                  index: index,
                  child: LearningCard(
                    enable: item.isEnable ?? true,
                    data: item,
                    parentId: item.parentId.toString(),
                    grandParentId: item.grandParentId.toString(),
                    isGridViewItem: true,
                    onFocusChange: (p0) {
                      if (p0) {
                        scrollToPosition(index);
                      }
                    },
                  ),
                );
              },
              firstPageErrorIndicatorBuilder: (_) => ErrorScreen(
                title: LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                message: cubit.controller!.error,
                onReload: () => cubit.controller!.refresh(),
              ),
              noItemsFoundIndicatorBuilder: (context) =>
                  _empty(form.findControl('search')?.value),
              firstPageProgressIndicatorBuilder: (_) {
                return const Center(child: CircularProgressIndicator());
              },
              newPageErrorIndicatorBuilder: (_) =>
                  OnScrollError(cubit.controller!),
              newPageProgressIndicatorBuilder: (_) {
                return const Center(child: CircularProgressIndicator());
              },
            ),
            pagingController: cubit.controller!,
          ),
        ),
        ListHeaderTitle(
          title: 'Risultati per',
          searchTitle: form.findControl('search')?.value,
        ),
      ],
    );
  }

  int? currentIndex;

  Future<void> scrollToPosition(int index) async {
    currentIndex = index;
    await autoScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
    );
  }

  Widget _error(Failure failure) => Center(
        child: ErrorScreen(
          title: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
          message: failure.error ??
              LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.error_occurred),
        ),
      );

  Widget _empty(String? value) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.spacingXL),
        child: Text(
          value != null
              ? LabelsManager()
                  .getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.search_empty_text)
                  .replaceFirst('{{value}}', value)
              : '',
          textAlign: TextAlign.center,
          style: AppTextTheme.body(
            color: ColorManager().getColorTextPrimary(),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
