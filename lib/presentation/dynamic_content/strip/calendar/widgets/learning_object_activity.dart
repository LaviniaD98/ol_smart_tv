import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:flutter/material.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../theme/app_theme.dart';

class LearningObjectActivity extends StatefulWidget {
  final LearningObjectModel model;
  final DateTime date;
  final int index;
  final void Function(bool)? onFocusChanged;

  const LearningObjectActivity({
    super.key,
    required this.index,
    required this.model,
    required this.date,
    this.onFocusChanged,
  });

  @override
  State<LearningObjectActivity> createState() => _LearningObjectActivityState();
}

class _LearningObjectActivityState extends State<LearningObjectActivity> {
  late OlFocusScopeNode _focusNode;

  @override
  void initState() {
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
        onTap: () {
          Nav.push(
            context,
            screen: DetailPage(
              args: DetailPageArgs(
                id: widget.model.id.toString(),
                object: widget.model,
                typology: widget.model.learningObjectTypology,
                parentId: widget.model.parentId?.toString(),
                grandParentId: widget.model.grandParentId?.toString(),
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
            gradient: AppTheme.greyGradient,
            border: Border.all(
              width: 2,
              color: _focusNode.hasFocus ? Colors.white : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            padding: const EdgeInsets.all(Dimens.spacingS),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: _getColor(widget.model, widget.date),
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 3),
                        decoration: BoxDecoration(
                          color: widget.model.iconStatus.color,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                widget.model.iconStatus.svgPath!,
                                height: 18,
                                width: 18,
                                colorFilter: ColorFilter.mode(
                                  ColorManager().getColorBackgroundPrimary(),
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                widget.model.iconStatus.getLocalizedLabel(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextTheme.caption(
                                  weight: FontWeight.w500,
                                  color: ColorManager()
                                      .getColorBackgroundPrimary(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: widget.model.learningObjectTypology
                                        .getTranslatedValue()
                                        .toUpperCase(),
                                    style: AppTextTheme.caption(
                                      weight: FontWeight.w700,
                                      color:
                                          _getColor(widget.model, widget.date),
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' | ',
                                    style: AppTextTheme.caption(
                                        weight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                    text: widget.model.learningObjectType
                                        .getTranslatedValue()
                                        .toUpperCase(),
                                    style: AppTextTheme.caption(
                                        weight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Dimens.spacingXXS),
                      Text(
                        widget.model.title ?? 'No Title',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.subtitle(
                          color: ColorManager().getColorTextPrimary(),
                          weight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.model.startTime != null &&
                    widget.model.endTime != null) ...[
                  const SizedBox(height: Dimens.spacingXXS),
                  Text(
                    '${widget.model.startTime!} - ${widget.model.endTime!}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme.caption(
                      color: ColorManager().getColorTextPrimary(),
                      weight: FontWeight.w400,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ));
  }

  Color _getColor(LearningObjectModel data, DateTime date) {
    if (data.isMandatory != null &&
        data.isMandatory! &&
        (data.learningObjectType == LearningObjectType.async ||
            data.learningObjectType == LearningObjectType.async) &&
        data.expirationDate != null &&
        data.expirationDate!.isSameDate(date)) {
      return ColorManager().getColorTextWarning();
    }
    return ColorManager().getColorSystemSecondary01();
  }

  //bool isExpiring() {}
}
