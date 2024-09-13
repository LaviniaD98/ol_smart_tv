import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icalendar_parser/icalendar_parser.dart';

import '../../../../../../color_management/color_manager.dart';
import '../../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../../theme/app_theme.dart';
import '../../../list_item/ol_list_tile.dart';
import '../cubit/ol_calendar_dialog_cubit.dart';

class OlCalendarList extends StatefulWidget {
  const OlCalendarList({
    super.key,
    required this.ics,
    required this.calendars,
  });

  final ICalendar ics;
  final List<Calendar> calendars;

  @override
  State<OlCalendarList> createState() => _OlCalendarListState();
}

class _OlCalendarListState extends State<OlCalendarList> {
  int? selected;

  @override
  Widget build(BuildContext context) {
    return Column(key: widget.key, children: [
      Text(
        LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.add_calendar_title),
        textAlign: TextAlign.center,
        style: AppTextTheme.dialogTitle(
            color: ColorManager().getColorTextPrimary()),
      ),
      const SizedBox(height: Dimens.spacingM),
      Expanded(
        child: ListView.separated(
          itemCount: widget.calendars.length,
          itemBuilder: (context, index) {
            final e = widget.calendars[index];
            return OlListTile(
              onTap: () => setState(() {
                selected = index;
              }),
              isSelected: selected == index,
              label: e.name ?? '',
              trailing: Icon(
                Icons.circle,
                color: Color(e.color ?? Colors.transparent.value),
              ),
            );
          },
          separatorBuilder: (context, index) =>
              const SizedBox(height: Dimens.spacingS),
        ),
      ),
      const SizedBox(height: Dimens.spacingXXL),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: AppButtonStyle.outlined,
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.close),
                textAlign: TextAlign.center,
                maxLines: 1,
                style: AppTextTheme.button(
                    color: ColorManager().getColorTextPrimaryCta()),
              )),
          const SizedBox(width: Dimens.spacingS),
          ElevatedButton(
            style: AppButtonStyle.red,
            onPressed: selected != null
                ? () => context
                    .read<OlCalendarDialogCubit>()
                    .addToCalendar(widget.ics, widget.calendars[selected!])
                : null,
            child: Text(
              LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.add_to_calendar),
              textAlign: TextAlign.center,
              maxLines: 1,
              style: AppTextTheme.button(),
            ),
          ),
        ],
      ),
    ]);
  }
}
