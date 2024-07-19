import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:onscreen_keyboard/onscreen_keyboard.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../color_management/color_manager.dart';
import '../../data/models/failure.dart';
import '../../domain/entities/search/suggestion_model.dart';
import '../../domain/entities/strip/learning_object/learning_object_model.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';
import '../../theme/app_theme.dart';
import '../common/widgets/cards/wall/learning_card_wall.dart';
import '../common/widgets/error/error_screen.dart';
import '../wall/widgets/on_scroll_error.dart';
import 'cubit/search_cubit.dart';
import 'widgets/local_suggestions.dart';
import 'widgets/reactive_search_input.dart';
import 'widgets/suggestions.dart';

class SearchPage extends StatefulWidget {
  static String routeName = 'search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  FormGroup form = FormGroup({
    'search': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(3),
      ],
    )
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager().getColorBackgroundPrimaryLighter(),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Hero(
                    tag: 'search-input',
                    child: ReactiveForm(
                      formGroup: form,
                      child: ReactiveValueListenableBuilder(
                          formControlName: 'search',
                          builder: (_, current, ___) {
                            return ReactiveSearchInput(
                              formControlName: 'search',
                              autoFocus: true,
                              showReset: form.findControl('search')?.value !=
                                      null &&
                                  (form.findControl('search')?.value as String)
                                      .isNotEmpty,
                              onReset: () {
                                form.reset();
                                //  context.read<SearchCubit>().localSuggestions();
                              },
                              // onChanged: context.read<SearchCubit>().onChanged,
                              onSubmitted: current.valid
                                  ? (control) {
                                      context
                                          .read<SearchCubit>()
                                          .initPagingController(
                                              control.value as String);
                                      FocusScope.of(context).unfocus();
                                    }
                                  : null,
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: Dimens.spacingM),
            GestureDetector(
              onTap: context.pop,
              behavior: HitTestBehavior.opaque,
              child: Text(
                LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.undo),
                style: AppTextTheme.caption(
                  color: ColorManager().getColorTextPrimaryCta(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) => state.maybeWhen(
              initial: (suggestions) => LocalSuggestions(
                suggestions,
                onDelete: () {},
                // => context.read<SearchCubit>().localSuggestions(true),
                onTap: (control) {
                  form.findControl('search')?.value = control;
                  context.read<SearchCubit>().initPagingController(control);
                  FocusScope.of(context).unfocus();
                },
              ),
              suggestions: _suggestions,
              searchPaginated: () => _searchPaginated(context),
              error: _error,
              loading: _loading,
              empty: _empty,
              orElse: () => const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _suggestions(List<SuggestionModel> items, String search) =>
      Suggestions(items, search: search);

  Widget _searchPaginated(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return PagedListView<int, LearningObjectModel>.separated(
      padding: const EdgeInsets.fromLTRB(12.0, 16.0, 20.0, 16.0),
      builderDelegate: PagedChildBuilderDelegate<LearningObjectModel>(
        itemBuilder: (context, item, index) =>
            _pagedListItem(item, index, cubit.totalElements),
        firstPageErrorIndicatorBuilder: (_) => ErrorScreen(
          title: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
          message: cubit.controller!.error,
          onReload: () => cubit.controller!.refresh(),
        ),
        noItemsFoundIndicatorBuilder: (context) =>
            _empty(form.findControl('search')?.value),
        firstPageProgressIndicatorBuilder: (_) => _loading(),
        newPageErrorIndicatorBuilder: (_) => OnScrollError(cubit.controller!),
        newPageProgressIndicatorBuilder: (_) => _loading(),
      ),
      separatorBuilder: (_, __) => const SizedBox(height: Dimens.spacingM),
      pagingController: cubit.controller!,
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

  Widget _loading() => const Center(child: CircularProgressIndicator());

  Widget _empty(String? value) => Center(
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

  Widget _pagedListItem(
      LearningObjectModel item, int index, int? totalElements) {
    final card = LearningCardWall(item);
    if (index == 0 && totalElements != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              Dimens.spacingXS,
              0.0,
              Dimens.spacingL,
              Dimens.spacingL,
            ),
            child: Text(
              LabelsManager()
                  .getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.search_count_result)
                  .replaceFirst('{{count}}', '$totalElements'),
              textAlign: TextAlign.center,
              style: AppTextTheme.body(
                color: ColorManager().getColorTextPrimary(),
              ),
            ),
          ),
          card,
        ],
      );
    }
    return card;
  }
}
