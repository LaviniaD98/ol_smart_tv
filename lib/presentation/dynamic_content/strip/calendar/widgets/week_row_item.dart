import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekRowItem extends StatelessWidget {
  final bool selected;
  final DateTime date;
  final DayType type;
  final OnDayTap onTap;

  const WeekRowItem({
    super.key,
    required this.selected,
    required this.date,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(date),
      child: Column(
        children: [
          Text(
            DateFormat(DateFormat.WEEKDAY).format(date)[0].toUpperCase(),
            style: AppTextTheme.caption(
              color: ColorManager().getColorTextMandatory(),
              weight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: Dimens.spacingXS),
          AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(Dimens.spacingXXS),
            decoration: BoxDecoration(
              color: _getBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Text(
              DateFormat(DateFormat.DAY).format(date),
              textAlign: TextAlign.center,
              style: AppTextTheme.caption(
                color: _getTextColor,
                weight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: Dimens.spacingXXS),
          AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: type != DayType.empty ? 1 : 0,
              child: Icon(Icons.circle,
                  color: ColorManager().getColorTextPrimary(), size: 4.0)),
        ],
      ),
    );
  }

  Color get _getBackgroundColor {
    if (selected) {
      switch (type) {
        case DayType.mandatory:
          return ColorManager().getColorBackgroundWarning();
        case DayType.live:
          return ColorManager().getColorTextMandatory();
        case DayType.smart:
          return ColorManager().getColorSystemSecondary04();
        case DayType.empty:
          return ColorManager().getColorTextPrimary();
      }
    }
    return Colors.transparent;
  }

  Color get _getTextColor {
    if (date.isSameDate(DateTime.now()) && !selected) {
      return ColorManager().getColorTextMandatory();
    } else if (type == DayType.mandatory && !selected) {
      return ColorManager().getColorTextWarning();
    } else if (!selected) {
      return ColorManager().getColorTextPrimary();
    }
    return ColorManager().getColorTextPrimaryAlternative();
  }
}

typedef OnDayTap = Function(DateTime);

enum DayType { live, smart, mandatory, empty }
