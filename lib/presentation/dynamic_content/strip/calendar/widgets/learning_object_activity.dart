import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_learning_smart_tv/app_manager.dart';
import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/common/course_logic.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/cubit/detail_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';

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
    final color = _getColor(widget.model);
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
              source: DetailsPresentingSource.calendar,
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
          padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingS),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isExpiring(widget.model)) ...[
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/calendar.svg',
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        color,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      LabelsManager().getRemoteStringFromLabelKeys(
                          RemoteLabelKeys.expiring),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.body(
                        weight: FontWeight.w500,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ] else ...[
                Row(
                  children: [
                    SvgPicture.asset(
                      widget.model.iconStatus.svgPath!,
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        widget.model.iconStatus.color,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.model.iconStatus.getLocalizedLabel(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextTheme.body(
                        weight: FontWeight.w500,
                        color: widget.model.iconStatus.color,
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 24),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: 2,
                      decoration: BoxDecoration(
                        color: widget.model.iconStatus.color,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: RichText(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: widget
                                              .model.learningObjectTypology
                                              .getTranslatedValue()
                                              .toUpperCase(),
                                          style: AppTextTheme.caption(
                                            weight: FontWeight.w700,
                                            color:
                                                widget.model.iconStatus.color,
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
                          ),
                          const SizedBox(height: 12),
                          Text(
                            widget.model.title ?? 'No Title',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextTheme.subtitle(
                              color: ColorManager().getColorTextPrimary(),
                              weight: FontWeight.w700,
                            ).copyWith(height: 1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: Dimens.spacingXXS),
                    Column(
                      children: [
                        if (widget.model.startTime != null &&
                            widget.model.endTime != null) ...[
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
                        const Spacer(),
                        Builder(builder: (context) {
                          final loCharacterization =
                              CourseLogic().loCharacterizationNew(
                            status: widget.model.status ?? "",
                            learningObjectType: widget.model.learningObjectType,
                            learningObjectTypology:
                                widget.model.learningObjectTypology,
                            percentageOfCompletion:
                                widget.model.percentageOfCompletion ?? "0",
                            enrollType: widget.model.enrollType ??
                                EnrollType.autoEnroll,
                            ecmSpecialization: false,
                            // widget.model.ecmSpecialization,
                            ecmRegistration: false,
                            //widget.model.ecmRegistration,
                          );

                          return OLButton(
                            width: 340,
                            key: const Key('loginForm_continue_raisedButton'),
                            id: 'BUTTON DETAILS CONTINUE',
                            title: loCharacterization.buttonTitle,
                            onPressed: !loCharacterization.buttonEnabled
                                ? null
                                : () async {
                                    pushDetails(item: widget.model);
                                  },
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void pushDetails({required LearningObjectModel item}) async {
    final args = DetailPageArgs(
      id: item.id.toString(),
      object: item,
      parentId: item.parentId?.toString(),
      grandParentId: item.grandParentId?.toString(),
      typology: item.learningObjectTypology,
      source: DetailsPresentingSource.calendar,
    );

    manager.pushOnStack(
      screen: BlocProvider(
        create: (_) => getIt<DetailPageCubit>()..init(args),
        child: DetailPage(args: args),
      ),
    );
  }

  Color _getColor(LearningObjectModel data) {
    if (data.isMandatory != null &&
        data.isMandatory! &&
        (data.learningObjectType == LearningObjectType.async) &&
        data.expirationDate != null) {
      return ColorManager().getColorTextWarning();
    }
    return ColorManager().getColorSystemSecondary01();
  }

  bool isExpiring(LearningObjectModel data) {
    if (data.isMandatory != null &&
        data.isMandatory! &&
        (data.learningObjectType == LearningObjectType.async) &&
        data.expirationDate != null) {
      return true;
    }
    return false;
  }
}
