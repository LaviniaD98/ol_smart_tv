import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../../color_management/color_manager.dart';
import '../../../../../../theme/app_theme.dart';
import 'multiselect_bottom_sheet.dart';

class MultiselectButton<T> extends StatelessWidget {
  const MultiselectButton._({
    super.key,
    this.controller,
    this.items,
    this.selectedItems,
    required this.enable,
    required this.label,
    required this.onChanged,
    required this.onClosed,
    required this.onLabelBuilder,
  });

  final PagingController<int, T>? controller;
  final List<T>? items;
  final List<T>? selectedItems;
  final String label;
  final void Function(List<T> e) onChanged;
  final VoidCallback onClosed;
  final String Function(T e) onLabelBuilder;
  final bool enable;

  factory MultiselectButton.paginated({
    Key? key,
    required PagingController<int, T> controller,
    required String label,
    required void Function(List<T> e) onChanged,
    required VoidCallback onClosed,
    required String Function(T e) onLabelBuilder,
    List<T>? selectedItems,
    bool enable = true,
  }) {
    return MultiselectButton._(
      key: key,
      controller: controller,
      label: label,
      selectedItems: selectedItems,
      onChanged: onChanged,
      onClosed: onClosed,
      onLabelBuilder: onLabelBuilder,
      enable: enable,
    );
  }

  factory MultiselectButton.simple({
    Key? key,
    required List<T> items,
    required String label,
    required void Function(List<T> e) onChanged,
    required VoidCallback onClosed,
    required String Function(T e) onLabelBuilder,
    List<T>? selectedItems,
    bool enable = true,
  }) {
    return MultiselectButton._(
      key: key,
      items: items,
      label: label,
      selectedItems: selectedItems,
      onChanged: onChanged,
      onClosed: onClosed,
      onLabelBuilder: onLabelBuilder,
      enable: enable,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      key: key,
      ignoring: !enable,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () async {
          await MultiselectBottomSheet.show<T>(
              context,
              key: key,
              pagingController: controller,
              items: items ?? [],
              selectedItems: selectedItems,
              onLabelBuilder: onLabelBuilder,
              onChanged: onChanged
          );
          onClosed.call();
        },
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingXS, vertical: Dimens.spacingXS),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.radius),
            color: ColorManager().getColorBackgroundSecondary(),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: AppTextTheme.body(
                    color: enable
                        ? ColorManager().getColorTextPrimaryAlternative()
                        : ColorManager().getColorSystemDisabled(),
                    weight: FontWeight.bold,
                  ),
                ),
              ),
              SvgPicture.asset(
                'assets/icons/dropdown.svg',
                width: 20,
                colorFilter: ColorFilter.mode(
                  enable
                    ? ColorManager().getColorSystemPrimary02()
                    : ColorManager().getColorSystemDisabled(),
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
