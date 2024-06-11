import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/smart_learning_bottom_sheet/cubit/smart_learning_bottom_sheet_cubit.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../theme/app_theme.dart';

class TimeSlotDropdown extends StatelessWidget {
  final Initialized data;
  const TimeSlotDropdown(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(builder: (context, formGroup, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.smart_learning_input_slots_title),
                  style: AppTextTheme.caption(
                      color: ColorManager().getColorTextPrimary()),
                ),
              ),
              const SizedBox(width: Dimens.spacingXS),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.smart_learning_input_slots_start),
                      style: AppTextTheme.caption(
                          color: ColorManager().getColorTextPrimary()),
                    ),
                    const SizedBox(height: Dimens.spacingXXS),
                    ReactiveDropdownField<DateTime>(
                      formControlName: 'start',
                      style: AppTextTheme.body(
                          color:
                              ColorManager().getColorTextPrimaryAlternative()),
                      icon: UnconstrainedBox(
                        child: SvgPicture.asset(
                          "assets/icons/dropdown.svg",
                          width: 20,
                          colorFilter: ColorFilter.mode(
                            ColorManager().getColorSystemPrimary02(),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      decoration: InputDecoration(
                        prefixIcon: UnconstrainedBox(
                          child: SvgPicture.asset(
                            "assets/icons/time.svg",
                            width: 20,
                            colorFilter: ColorFilter.mode(
                                ColorManager().getColorSystemSecondary05(),
                                BlendMode.srcIn),
                          ),
                        ),
                        fillColor: ColorManager().getColorBackgroundSecondary(),
                        helperMaxLines: 1,
                        hintMaxLines: 1,
                        border: InputBorder.none,
                        hintStyle: AppTextTheme.body(
                            color: ColorManager().getColorTextDisabled()),
                      ),
                      menuMaxHeight: kMinInteractiveDimension * 4,
                      showErrors: (control) => false,
                      dropdownColor:
                          ColorManager().getColorBackgroundSecondary(),
                      items: _createSlots(
                              formGroup.findControl('date')?.value as DateTime)
                          .map((e) {
                        final enabled = data.availableStartingTimes.contains(e);
                        return DropdownMenuItem<DateTime>(
                          value: e,
                          enabled: enabled,
                          onTap: () {
                            final endTime = formGroup.findControl('end')?.value
                                as DateTime?;
                            final firstEl = data.slots
                                .firstWhereOrNull(
                                    (element) => e.isBefore(element.startDate))
                                ?.startDate;
                            if (endTime != null &&
                                ((e.isAfter(endTime) ||
                                        e.isAtSameMomentAs(endTime)) ||
                                    (firstEl != null &&
                                        endTime.isAfter(firstEl.toLocal())))) {
                              formGroup.findControl('end')?.reset();
                            }
                          },
                          child: Text(
                            TimeOfDay.fromDateTime(e).format(context),
                            style: AppTextTheme.body(
                              color: enabled
                                  ? ColorManager()
                                      .getColorTextPrimaryAlternative()
                                  : ColorManager()
                                      .getColorTextDisabledAlternative(),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Dimens.spacingXS),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.smart_learning_input_slots_end),
                      style: AppTextTheme.caption(
                          color: ColorManager().getColorTextPrimary()),
                    ),
                    const SizedBox(height: Dimens.spacingXXS),
                    IgnorePointer(
                      ignoring: (formGroup.findControl('start')?.value
                              as DateTime?) ==
                          null,
                      child: ReactiveDropdownField<DateTime>(
                        formControlName: 'end',
                        style: AppTextTheme.body(
                            color: ColorManager()
                                .getColorTextPrimaryAlternative()),
                        icon: UnconstrainedBox(
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: (formGroup.findControl('start')?.value
                                        as DateTime?) ==
                                    null
                                ? .3
                                : 1,
                            child: SvgPicture.asset(
                              "assets/icons/dropdown.svg",
                              width: 20,
                              colorFilter: ColorFilter.mode(
                                  ColorManager().getColorSystemPrimary02(),
                                  BlendMode.srcIn),
                            ),
                          ),
                        ),
                        decoration: InputDecoration(
                          prefixIcon: UnconstrainedBox(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: (formGroup.findControl('start')?.value
                                          as DateTime?) ==
                                      null
                                  ? .3
                                  : 1,
                              child: SvgPicture.asset(
                                "assets/icons/time.svg",
                                width: 20,
                                colorFilter: ColorFilter.mode(
                                    ColorManager().getColorSystemSecondary05(),
                                    BlendMode.srcIn),
                              ),
                            ),
                          ),
                          fillColor:
                              ColorManager().getColorBackgroundSecondary(),
                          helperMaxLines: 1,
                          hintMaxLines: 1,
                          border: InputBorder.none,
                          hintStyle: AppTextTheme.body(
                              color: ColorManager().getColorTextDisabled()),
                        ),
                        menuMaxHeight: kMinInteractiveDimension * 4,
                        showErrors: (control) => false,
                        dropdownColor:
                            ColorManager().getColorBackgroundSecondary(),
                        items: _createSlots(
                                formGroup.findControl('date')?.value
                                    as DateTime,
                                true)
                            .map((e) {
                          final startTime = formGroup
                              .findControl('start')
                              ?.value as DateTime?;
                          bool enabled = false;
                          if (startTime != null) {
                            final firstEl = data.slots
                                .firstWhereOrNull((element) =>
                                    startTime.isBefore(element.startDate))
                                ?.startDate;
                            final temp = [...data.endTimesAvailable]
                              ..removeWhere((el) {
                                return ((firstEl != null &&
                                        el.isAfter(firstEl.toLocal())) ||
                                    (el.isBefore(startTime) ||
                                        el.isAtSameMomentAs(startTime)));
                              });
                            enabled = temp.contains(e);
                          }
                          return DropdownMenuItem<DateTime>(
                            value: e,
                            enabled: enabled,
                            child: Text(
                              TimeOfDay.fromDateTime(e).format(context),
                              style: AppTextTheme.body(
                                color: enabled
                                    ? ColorManager()
                                        .getColorTextPrimaryAlternative()
                                    : ColorManager()
                                        .getColorTextDisabledAlternative(),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (data.hoursAvailable != null)
            _hoursAvailable(data.hoursAvailable!),
        ],
      );
    });
  }

  Widget _hoursAvailable(int hoursAvailable) {
    Widget child = Text(
      LabelsManager()
          .getRemoteStringFromLabelKeys(
              RemoteLabelKeys.smart_learning_hours_available)
          .replaceFirst('{{count}}', '$hoursAvailable'),
      style: AppTextTheme.caption(
        color: ColorManager().getColorTextPrimary(),
      ),
    );

    if (hoursAvailable == 0) {
      child = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/icons/mandatory.svg",
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(
                ColorManager().getColorTextWarning(), BlendMode.srcIn),
          ),
          const SizedBox(width: Dimens.spacingS),
          Expanded(
            child: Text(
              LabelsManager()
                  .getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.smart_learning_hours_alert)
                  .replaceFirst('{{count}}', '$hoursAvailable'),
              style: AppTextTheme.caption(
                color: ColorManager().getColorTextWarning(),
              ),
            ),
          ),
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.spacingXS,
        vertical: Dimens.spacingS,
      ),
      child: Row(
        children: [
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 6, child: child),
        ],
      ),
    );
  }

  List<DateTime> _createSlots(DateTime date, [bool endTimes = false]) {
    List<DateTime> res = [];
    final now = DateTime.now();
    DateTime selectedDate;
    DateTime firstTime;

    if (now.isSameDate(date)) {
      //Time of day is lost when switching dates, add it back in.
      final DateTime adjustedDate =
          DateTime(date.year, date.month, date.day, now.hour, now.minute);

      selectedDate =
          Jiffy.parseFromDateTime(adjustedDate).startOf(Unit.hour).dateTime;
      if (adjustedDate.minute >= 30) {
        selectedDate = selectedDate.add(const Duration(minutes: 30));
      }
      firstTime = (adjustedDate.hour == 0 && adjustedDate.minute < 30)
          ? selectedDate
          : selectedDate.add(Duration(minutes: 30 - selectedDate.minute % 30));
    } else {
      selectedDate = Jiffy.parseFromDateTime(date).startOf(Unit.day).dateTime;
      firstTime = selectedDate;
      if (endTimes) {
        firstTime =
            selectedDate.add(Duration(minutes: 30 - selectedDate.minute % 30));
      }
    }

    while (firstTime.day != selectedDate.add(const Duration(days: 1)).day) {
      res.add(firstTime);
      firstTime = firstTime.add(const Duration(minutes: 30));
    }
    if (endTimes) res.add(firstTime.subtract(const Duration(minutes: 1)));
    return res;
  }
}
