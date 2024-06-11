import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../theme/app_theme.dart';
import 'widgets/multiselect_button.dart';
import 'widgets/multiselect_chip.dart';

class MultiselectDropdown<T> extends StatefulWidget {
  const MultiselectDropdown._({
    super.key,
    this.selectedItems,
    this.pagingController,
    this.items,
    this.enable = true,
    required this.onChanged,
    required this.onLabelBuilder,
    required this.label,
    required this.type,
  });

  final void Function(List<T> e) onChanged;
  final String Function(T e) onLabelBuilder;
  final String label;
  final List<T>? items;
  final List<T>? selectedItems;
  final PagingController<int, T>? pagingController;
  final MultiselectDropdownType type;
  final bool enable;


  factory MultiselectDropdown.paginated({
    Key? key,
    required PagingController<int, T> controller,
    required String label,
    required void Function(List<T> e) onChanged,
    required String Function(T e) onLabelBuilder,
    List<T>? initialItems,
    bool enable = true,
  }) {
    return MultiselectDropdown<T>._(
      key: key,
      pagingController: controller,
      label: label,
      selectedItems: initialItems,
      onChanged: onChanged,
      onLabelBuilder: onLabelBuilder,
      type: MultiselectDropdownType.paginated,
      enable: enable,
    );
  }

  factory MultiselectDropdown.simple({
    Key? key,
    required List<T> items,
    required String label,
    required void Function(List<T> e) onChanged,
    required String Function(T e) onLabelBuilder,
    List<T>? initialItems,
    bool enable = true,
  }) {
    return MultiselectDropdown<T>._(
      key: key,
      items: items,
      label: label,
      selectedItems: initialItems,
      onChanged: onChanged,
      onLabelBuilder: onLabelBuilder,
      type: MultiselectDropdownType.simple,
      enable: enable,
    );
  }

  @override
  State<MultiselectDropdown<T>> createState() => _MultiselectDropdownState<T>();
}

class _MultiselectDropdownState<T> extends State<MultiselectDropdown<T>> {
  late List<T> _items;

  @override
  void initState() {
    _items = [...?widget.selectedItems];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: widget.key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        button,
        const SizedBox(height: Dimens.spacingS),
        Wrap(
          alignment: WrapAlignment.start,
          runSpacing: Dimens.spacingXS,
          spacing: Dimens.spacingXS,
          children: _items.map((e) {
            return MultiselectChip<T>(
              e,
              onCancel: (item) {
                setState(() {
                  _items.remove(item);
                  widget.onChanged.call(_items);
                });
              },
              onLabelBuilder: widget.onLabelBuilder,
            );
          }).toList(),
        ),
      ],
    );
  }

  MultiselectButton get button {
    if(widget.type == MultiselectDropdownType.simple) {
      return MultiselectButton<T>.simple(
        items: widget.items!,
        selectedItems: _items,
        label: widget.label,
        onChanged: _onChanged,
        onClosed: _onClosed,
        onLabelBuilder: widget.onLabelBuilder,
        enable: widget.enable,
      );
    } else {
      return MultiselectButton<T>.paginated(
        controller: widget.pagingController!,
        selectedItems: _items,
        label: widget.label,
        onChanged: _onChanged,
        onClosed: _onClosed,
        onLabelBuilder: widget.onLabelBuilder,
          enable: widget.enable,
      );
    }
  }

  @override
  void didUpdateWidget(covariant MultiselectDropdown<T> oldWidget) {
    if(oldWidget.selectedItems != widget.selectedItems) {
      setState(() {
        _items = [...?widget.selectedItems];
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onClosed() {
    widget.onChanged(_items);
  }

  void _onChanged(List<T> items) {
    setState(() {
      _items = items;
    });
  }
}

enum MultiselectDropdownType {simple, paginated}
