import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekRowItem extends StatefulWidget {
  final bool selected;
  final DateTime date;
  final DayType type;
  final OnDayTap onTap;
  final bool isSmall;

  const WeekRowItem({
    super.key,
    required this.selected,
    required this.date,
    required this.type,
    required this.onTap,
    this.isSmall = false,
  });

  @override
  State<WeekRowItem> createState() => _WeekRowItemState();
}

class _WeekRowItemState extends State<WeekRowItem> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode(debugLabel: 'WeekRowItem - ${widget.date}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          focusNode: focusNode,
          onFocusChange: (hasFocus) {
            if (hasFocus) {
              print('HAS FOCUS -- - - - - ${focusNode.debugLabel}');
            }
            setState(() {});
          },
          onTap: () {
            widget.onTap(widget.date);
          },
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            height: widget.isSmall ? 46 : 80,
            width: widget.isSmall ? 46 : 80,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(Dimens.spacingXXS),
            decoration: BoxDecoration(
              color:
                  widget.selected ? _selectedAccentColor : Colors.transparent,
              border: Border.all(
                color: focusNode.hasFocus ? OLColors.textPrimary : Colors.red,
                width: 2.0,
              ),
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat(DateFormat.DAY).format(widget.date),
                  textAlign: TextAlign.center,
                  style: _textStyle,
                ),
                SizedBox(
                  height: _dotSize,
                  width: _dotSize,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: widget.type != DayType.empty ? 1 : 0,
                    child: Icon(
                      Icons.circle,
                      color: _getTextColor,
                      size: _dotSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (widget.isSmall == false) ...[
          const SizedBox(height: Dimens.spacingXXS),
        ],
      ],
    );
  }

  double get _dotSize {
    if (widget.isSmall) {
      return 4.0;
    } else {
      return 8.0;
    }
  }

  Color get _selectedAccentColor {
    if (widget.isSmall) {
      return OLColors.accentVariantA;
    } else {
      return const Color(0xFFFF6B00);
    }
  }

  TextStyle get _textStyle {
    if (widget.isSmall) {
      return AppTextTheme.caption(
        color: _getTextColor,
        weight: FontWeight.w700,
        size: 18,
      ).copyWith(height: 1.3);
    } else {
      return AppTextTheme.caption(
        color: _getTextColor,
        weight: FontWeight.w700,
        size: 32,
      ).copyWith(height: 1.3);
    }
  }

  Color get _getBackgroundColor {
    if (widget.selected) {
      switch (widget.type) {
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
    if (widget.date.isSameDate(DateTime.now()) && !widget.selected) {
      return ColorManager().getColorTextMandatory();
    } else if (widget.type == DayType.mandatory && !widget.selected) {
      return ColorManager().getColorTextWarning();
    } else if (!widget.selected) {
      return ColorManager().getColorTextPrimary();
    }
    return ColorManager().getColorTextPrimaryAlternative();
  }
}

typedef OnDayTap = Function(DateTime);

enum DayType { live, smart, mandatory, empty }
