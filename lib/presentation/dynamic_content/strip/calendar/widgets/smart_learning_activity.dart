import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/calendar/smart_learning_slots_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../domain/entities/strip/row/strip_row.dart';
import '../../../../../remote_theming/labels/labels_manager.dart';
import '../../../../../remote_theming/labels/remote_labels_keys.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../wall/wall_strip_content_page.dart';
import '../cubit/calendar_strip_cubit.dart';

class SmartLearningActivity extends StatefulWidget {
  static const _iconSize = 20.0;

  final SmartLearningSlotsModel model;
  final DateTime date;
  final int index;
  final void Function(bool)? onFocusChanged;

  const SmartLearningActivity({
    super.key,
    required this.index,
    required this.model,
    required this.date,
    this.onFocusChanged,
  });

  @override
  State<SmartLearningActivity> createState() => _SmartLearningActivityState();
}

class _SmartLearningActivityState extends State<SmartLearningActivity> {
  late OlFocusScopeNode _focusNode;
  @override
  initState() {
    super.initState();
    _focusNode = OlFocusScopeNode(
      id: 'Activity - ${widget.index} - ${widget.model.id}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusNode: _focusNode,
      onFocusChange: (value) {
        widget.onFocusChanged?.call(value);
        setState(() {});
      },
      onTap: () async {
        final res = await Nav.push(context,
            screen: WallStripContentPage(
              WallStripContentPageArgs(
                StripRow.smartLearning(
                  id: widget.model.id,
                  title: LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.smart_learning_wall_title),
                  apiPath:
                      '/learning-catalogue/{corporateId}/{initiativeId}/learnersSmartLearningObjects?startTime={startTime}&endTime={endTime}&pageNumber={pageNumber}&pageSize={pageSize}&topics=',
                  preSelected: false,
                  startTime: widget.model.startTime,
                  endTime: widget.model.endTime,
                ),
              ),
            ));

        if (context.mounted && res != null && res) {
          context.read<CalendarStripCubit>().refresh();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(Dimens.spacingS),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: ColorManager().getColorSystemSecondary04(),
              width: 2,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox.square(
                        dimension: SmartLearningActivity._iconSize,
                        child: SvgPicture.asset(
                          'assets/icons/creative_writing.svg',
                          width: SmartLearningActivity._iconSize,
                          height: SmartLearningActivity._iconSize,
                          colorFilter: ColorFilter.mode(
                              ColorManager().getColorSystemSecondary04(),
                              BlendMode.srcIn),
                        ),
                      ),
                      const SizedBox(width: Dimens.spacingS),
                      Expanded(
                        child: Text(
                          LabelsManager()
                              .getRemoteStringFromLabelKeys(
                                  RemoteLabelKeys.smart_learning_item_title)
                              .toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextTheme.caption(
                            weight: FontWeight.w700,
                            color: ColorManager().getColorSystemSecondary04(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimens.spacingXXS),
                  Text(
                    LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.smart_learning_item_subtitle),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme.caption(
                      color: ColorManager().getColorTextPrimary(),
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            if (widget.model.startTime != null &&
                widget.model.endTime != null) ...[
              const SizedBox(height: Dimens.spacingXXS),
              Text(
                _getTime,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextTheme.subtitle(
                  color: ColorManager().getColorTextPrimary(),
                  weight: FontWeight.w700,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String get _getTime {
    final dateFormat = DateFormat(DateFormat.HOUR24_MINUTE);
    return '${dateFormat.format(widget.model.startTime!)}-${dateFormat.format(widget.model.endTime!)}';
  }
}
