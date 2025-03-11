import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:open_learning_smart_tv/app_manager.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/learning_card.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/keyboard/onscreen_keyboard.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/list_header_title.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/error/error_screen.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:open_learning_smart_tv/presentation/search/cubit/best_rating_strip_cubit.dart';
import 'package:open_learning_smart_tv/presentation/search/cubit/search_cubit.dart';
import 'package:open_learning_smart_tv/presentation/search/cubit/search_history_manager.dart';
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

  static const placeholderApiPath =
      "/learning-catalogue/{corporateId}/{initiativeId}/topRatedLearningObjects?pageNumber=0&pageSize=20";
  // "/learning-catalogue/{corporateId}/{initiativeId}/topRatedLearningObjects?pageNumber={pageNumber}&pageSize={pageSize}&topics={topics}";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with AutomaticKeepAliveClientMixin {
  final OrderedTraversalPolicy _focusNodeOrder = OrderedTraversalPolicy();
  final focusNode = OlFocusScopeNode(id: 'Search');
  final textEditingController = TextEditingController();
  ValueNotifier<String> textNotifier = ValueNotifier<String>('');
  ValueNotifier<String> searchTextNotifier = ValueNotifier<String>('');

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

    return MultiBlocProvider(
      providers: [
        BlocProvider<BestRatingStripCubit>(
          create: (_) => getIt<BestRatingStripCubit>()
            ..fetch(
              stripRow: const StripRow.visCarBestRating(
                id: 10000001,
                apiPath: SearchScreen.placeholderApiPath,
              ),
            ),
        ),
      ],
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
                    flex: 8,
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
                                    value.isEmpty
                                        ? LabelsManager()
                                            .getRemoteStringFromLabelKeys(
                                                RemoteLabelKeys.start_search)
                                        : value,
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
                                    title: LabelsManager()
                                        .getRemoteStringFromLabelKeys(
                                            RemoteLabelKeys.clear_search),
                                    width: 120,
                                    outline: true,
                                    onPressed: () async {
                                      form.reset();
                                      form.findControl('search')?.value = '';
                                      textNotifier.value = '';
                                      context.read<SearchCubit>().onChanged('');
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 20,
                            ),
                            height: 380,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.03),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(14),
                                topRight: Radius.circular(14),
                              ),
                              border: Border.all(
                                width: 1,
                                color: OLColors.divider,
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
                          child: ValueListenableBuilder(
                            valueListenable: searchManager.suggestionsNotifier,
                            builder: (context, value, _) {
                              return LocalSuggestions(
                                value,
                                onDelete: () =>
                                    searchManager.cleanHistorySearch(),
                                onTap: (control) {
                                  form.findControl('search')?.value =
                                      control.trim();
                                  textNotifier.value = control.trim();
                                  searchManager
                                      .setSearchHistory(control.trim());

                                  context.read<SearchCubit>().onChanged('');

                                  Future.delayed(
                                    const Duration(milliseconds: 600),
                                    () {
                                      if (context.mounted) {
                                        search();
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
                    flex: 9,
                    child: BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) => state.maybeWhen(
                        initial: (suggestions) {
                          return BlocBuilder<BestRatingStripCubit,
                              BestRatingStripState>(
                            builder: (context, state) => state.map(
                              success: (value) {
                                return GridView.builder(
                                  padding: const EdgeInsets.only(
                                    left: Dimens.hViewPadding,
                                    right: Dimens.hViewPadding - 24,
                                    top: Dimens.spacingM,
                                    bottom: 200,
                                  ),
                                  gridDelegate: getGridDelegate(),
                                  itemCount: value.items.length,
                                  itemBuilder: (context, index) {
                                    final item = value.items[index];
                                    return AutoScrollTag(
                                      key: ValueKey(index),
                                      controller: autoScrollController,
                                      index: index,
                                      child: CallbackShortcuts(
                                        bindings: <ShortcutActivator,
                                            VoidCallback>{
                                          const SingleActivator(
                                                  LogicalKeyboardKey.enter):
                                              () => pushDetails(item: item),
                                          const SingleActivator(
                                                  LogicalKeyboardKey.select):
                                              () => pushDetails(item: item),
                                        },
                                        child: LearningCard(
                                          enable: item.isEnable ?? true,
                                          data: item,
                                          parentId: item.parentId.toString(),
                                          grandParentId:
                                              item.grandParentId.toString(),
                                          isGridViewItem: true,
                                          onFocusChange: (p0) {
                                            if (p0) {
                                              scrollToPosition(index);
                                            }
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              loading: (value) => gridShimmer(),
                              error: (_) => const SizedBox.shrink(),
                            ),
                          );
                        },
                        suggestions: (items, search) {
                          return Suggestions(items, search: search);
                        },
                        searchPaginated: () {
                          return _searchPaginated(context);
                        },
                        error: _error,
                        loading: () => gridShimmer(),
                        empty: _empty,
                        orElse: () => const SizedBox.shrink(),
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

  void pushDetails({required LearningObjectModel item}) async {
    final args = DetailPageArgs(
      id: item.id.toString(),
      object: item,
      parentId: item.parentId?.toString(),
      grandParentId: item.grandParentId?.toString(),
      typology: item.learningObjectTypology,
      source: DetailsPresentingSource.search,
    );

    manager.pushOnStack(
      screen: BlocProvider(
        create: (_) => getIt<DetailPageCubit>()..init(args),
        child: DetailPage(args: args),
      ),
    );
  }

  Widget gridShimmer() {
    return Padding(
      padding: const EdgeInsets.only(top: 140.0),
      child: GridView.builder(
        padding: const EdgeInsets.only(
          left: Dimens.hViewPadding,
          right: Dimens.hViewPadding - 24,
          top: Dimens.spacingM,
          bottom: 200,
        ),
        gridDelegate: getGridDelegate(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const LearningCardShimmer(
            isGridViewItem: true,
          );
        },
      ),
    );
  }

  void search() {
    final text = (form.findControl('search')?.value as String?) ?? '';

    if (text.isEmpty) {
      return;
    }
    searchTextNotifier.value = text;
    context.read<SearchCubit>().search(text);

    searchManager.setSearchHistory(text);
  }

  void clearSearch() {
    searchTextNotifier.value = '';
    textNotifier.value = '';
    context.read<SearchCubit>().onChanged('');
  }

  Widget buildKeyboard() {
    return Align(
      alignment: Alignment.centerLeft,
      child: ValueListenableBuilder(
        valueListenable: textNotifier,
        builder: (context, value, _) {
          return OnscreenKeyboard(
            initialCase: InitialCase.LOWER_CASE,
            isClearHidden: true,
            hLetterSpacing: 4,
            vLetterSpacing: 4,
            onFocusOutside: (side) {
              if (side == TraversalDirection.left) {
                final focus = context.read<MainStateCubit>().state;
                focus.requestFocus();
              } else {
                focusNode.focusInDirection(side);
              }
            },
            value: value,
            isSearch: true,
            buttonColor: Colors.black,
            focusColor: Colors.grey.shade900,
            onChanged: (txt) {
              final text = (txt ?? '').trim();
              textNotifier.value = text;
              form.findControl('search')?.value = text;
              //search(text);
            },
          );
        },
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
            width: 100,
            outline: true,
            onPressed: form.valid ? () => search() : null,
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
            gridDelegate: getGridDelegate(),
            builderDelegate: PagedChildBuilderDelegate<LearningObjectModel>(
              itemBuilder: (context, item, index) {
                return CallbackShortcuts(
                  bindings: <ShortcutActivator, VoidCallback>{
                    const SingleActivator(LogicalKeyboardKey.enter): () =>
                        pushDetails(item: item),
                    const SingleActivator(LogicalKeyboardKey.select): () =>
                        pushDetails(item: item),
                  },
                  child: AutoScrollTag(
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
        ValueListenableBuilder(
          valueListenable: searchTextNotifier,
          builder: (context, value, _) {
            return ListHeaderTitle(
              title: LabelsManager()
                  .getRemoteStringFromLabelKeys(RemoteLabelKeys.results_for),
              searchTitle: value,
              showGradient: false,
            );
          },
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

  SliverGridDelegate getGridDelegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1.8,
      mainAxisSpacing: 32,
      crossAxisSpacing: 24,
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
