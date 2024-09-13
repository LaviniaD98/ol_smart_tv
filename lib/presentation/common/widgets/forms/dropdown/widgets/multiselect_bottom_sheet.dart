import 'dart:async';

import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../../theme/app_theme.dart';
import '../../../../../wall/widgets/on_scroll_error.dart';
import '../../../error/error_screen.dart';
import 'multiselect_list_item.dart';

class MultiselectBottomSheet<T> extends StatefulWidget {
  const MultiselectBottomSheet._({
    super.key,
    required this.items,
    this.selectedItems,
    this.pagingController,
    required this.onLabelBuilder,
    required this.onChanged,
  });

  final PagingController<int, T>? pagingController;
  final List<T> items;
  final List<T>? selectedItems;
  final String Function(T e) onLabelBuilder;
  final void Function(List<T> e) onChanged;

  static FutureOr<T?> show<T>(
    BuildContext context, {
    Key? key,
    PagingController<int, T>? pagingController,
    required List<T> items,
    required String Function(T e) onLabelBuilder,
    required void Function(List<T> e) onChanged,
    List<T>? selectedItems,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(Dimens.radius)),
      ),
      barrierColor:
          ColorManager().getColorBackgroundDrawerWidget().withOpacity(.8),
      backgroundColor: ColorManager().getColorBackgroundSecondary(),
      builder: (context) {
        return MultiselectBottomSheet._(
          items: items,
          selectedItems: selectedItems,
          onLabelBuilder: onLabelBuilder,
          onChanged: onChanged,
          pagingController: pagingController,
        );
      },
    );
  }

  @override
  State<MultiselectBottomSheet<T>> createState() =>
      _MultiselectBottomSheetState<T>();
}

class _MultiselectBottomSheetState<T> extends State<MultiselectBottomSheet<T>> {
  late List<T> _items;

  @override
  void initState() {
    _items = [...?widget.selectedItems];
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MultiselectBottomSheet<T> oldWidget) {
    if (oldWidget.selectedItems != widget.selectedItems) {
      setState(() {
        _items = [...?widget.selectedItems];
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .7,
      padding: const EdgeInsets.only(top: Dimens.spacingL),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * .7,
      ),
      decoration: BoxDecoration(
        color: ColorManager().getColorBackgroundSecondary(),
      ),
      child: widget.pagingController != null ? _paginatedList : _simpleList,
    );
  }

  void _onChanged(T item) {
    setState(() {
      if (_items.contains(item)) {
        _items.remove(item);
      } else {
        _items.add(item);
      }
    });
    widget.onChanged(_items);
  }

  Widget get _simpleList => ListView.separated(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(
          Dimens.spacingM,
          0.0,
          Dimens.spacingM,
          MediaQuery.of(context).viewPadding.bottom + Dimens.spacingM,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => _onChanged(widget.items[index]),
            child: MultiselectListItem<T>(
              widget.items[index],
              isSelected: _items.contains(widget.items[index]),
              onLabelBuilder: widget.onLabelBuilder,
            ),
          );
        },
        itemCount: widget.items.length,
        separatorBuilder: (_, __) => Divider(
            height: Dimens.spacingM,
            color: ColorManager().getColorBackgroundDisabledAlternative()),
      );

  Widget get _paginatedList => PagedListView<int, T>.separated(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(
          Dimens.spacingM,
          0.0,
          Dimens.spacingM,
          MediaQuery.of(context).viewPadding.bottom + Dimens.spacingM,
        ),
        builderDelegate: PagedChildBuilderDelegate<T>(
          itemBuilder: (context, item, index) {
            final isSelected = _items.contains(item);
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => _onChanged(item),
              child: MultiselectListItem<T>(
                item,
                isSelected: isSelected,
                onLabelBuilder: widget.onLabelBuilder,
              ),
            );
          },
          firstPageErrorIndicatorBuilder: (_) => ErrorScreen(
            textColor: ColorManager().getColorTextPrimaryAlternative(),
            title: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
            message: LabelsManager()
                .getRemoteStringFromLabelKeys(RemoteLabelKeys.error_occurred),
            onReload: () => widget.pagingController!.refresh(),
          ),
          noItemsFoundIndicatorBuilder: (context) => Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Text(
                LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.no_elements),
                textAlign: TextAlign.center,
                style: AppTextTheme.subtitle(
                  color: ColorManager().getColorTextPrimaryAlternative(),
                ),
              ),
            ),
          ),
          firstPageProgressIndicatorBuilder: (_) =>
              const Center(child: CircularProgressIndicator()),
          newPageErrorIndicatorBuilder: (_) =>
              OnScrollError(widget.pagingController!),
          newPageProgressIndicatorBuilder: (_) =>
              const Center(child: CircularProgressIndicator()),
        ),
        pagingController: widget.pagingController!,
        separatorBuilder: (_, __) => Divider(
            height: Dimens.spacingM,
            color: ColorManager().getColorBackgroundDisabledAlternative()),
      );
}
