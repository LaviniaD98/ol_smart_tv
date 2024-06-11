import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../color_management/color_manager.dart';
import '../../domain/entities/generic/teacher_model.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';
import '../../theme/app_theme.dart';
import '../common/widgets/tag/duration_tag.dart';

class ExtraDetailsCard extends StatelessWidget {
  final DetailPageModel model;
  final bool showAdditionalInfo;

  const ExtraDetailsCard(
      {super.key, required this.model, this.showAdditionalInfo = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.radius),
          gradient: AppTheme.greyGradient),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    text: model.learningObjectTypology
                        .getTranslatedValue()
                        .toUpperCase(),
                    style: AppTextTheme.title(
                        color: ColorManager().getColorTextMandatory(),
                        size: 12.0),
                    children: [
                  TextSpan(
                    text: ' | ',
                    style: AppTextTheme.title(
                        color: ColorManager().getColorTextPrimary(),
                        size: 12.0),
                  ),
                  TextSpan(
                    text: model.learningObjectType
                        .getTranslatedValue()
                        .toUpperCase(),
                    style: AppTextTheme.title(
                        color: ColorManager().getColorTextPrimary(),
                        size: 12.0,
                        weight: FontWeight.w500),
                  ),
                ])),
            Padding(
              padding: const EdgeInsets.only(bottom: Dimens.spacingXS),
              child: Text(
                model.title ?? "",
                style: AppTextTheme.title(
                    color: ColorManager().getColorTextPrimary(), size: 20.0),
              ),
            ),
            if (model.teachers?.isNotEmpty == true)
              Padding(
                padding: const EdgeInsets.only(bottom: Dimens.spacingXS),
                child: Text(
                  _formatTeachersList(model.teachers ?? List.empty()),
                  style: AppTextTheme.caption(
                    color: ColorManager().getColorTextPrimary(),
                  ),
                ),
              ),
            if (showAdditionalInfo &&
                (model.topicTags ?? List.empty()).isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: Dimens.spacingXS),
                child: _buildTopicTags(model.topicTags ?? List.empty()),
              ),
            if (showAdditionalInfo)
              Row(
                children: [
                  DurationTag.fromMinutes(
                    model.duration ?? 0,
                    color: Colors.transparent,
                    textStyle: AppTextTheme.body(
                        color: ColorManager().getColorTextPrimary()),
                  ),
                  SvgPicture.asset(
                      "assets/icons/detail/dettaglio_scadenza.svg"),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                      "${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.expiring_on)}${model.expirationDate?[2]}/${model.expirationDate?[1]}/${model.expirationDate?[0]}",
                      style: AppTextTheme.caption(
                          color: ColorManager().getColorTextPrimary()))
                ],
              ),
            Text(
              model.longDescription ?? "",
              style: AppTextTheme.body(
                color: ColorManager().getColorTextPrimary(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTeachersList(List<TeacherModel> teachers) {
    if (teachers.length == 2) {
      return "${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.care_of)} ${teachers[0].completeName} e ${teachers[1].completeName}";
    } else {
      var result =
          "${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.care_of)} ";
      for (final teacher in teachers) {
        result += "${teacher.completeName}, ";
      }
      return result.substring(0, result.length - 2);
    }
  }

  Widget _buildTopicTags(List<String> tags) {
    return SizedBox(
        height: 22,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
                  width: 8.0,
                ),
            itemCount: tags.length,
            itemBuilder: (context, index) => Container(
                  height: 22,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.radiusImage),
                      border: Border.all(
                          color: ColorManager().getColorSystemPrimary01())),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    child: Center(
                      child: Text(
                        tags[index].toUpperCase(),
                        style: AppTextTheme.title(
                            size: 12.0,
                            color: ColorManager().getColorTextPrimary()),
                      ),
                    ),
                  ),
                )));
  }
}
