import 'package:open_learning_smart_tv/domain/entities/detail/detail_page_model.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/tag/duration_tag.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../color_management/color_manager.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';

class ParentCourseCard extends StatelessWidget {
  final DetailPageModel parentModel;

  const ParentCourseCard({
    super.key,
    required this.parentModel,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - (Dimens.spacingL * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.module_included),
              style: AppTextTheme.subtitle(
                  color: ColorManager().getColorTextPrimary()),
            ),
            const SizedBox(
              height: 16.0,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.radiusImage),
                    child: Image.network(
                      parentModel.coverPublicURL ?? "",
                      width: 90,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.spacingL, bottom: 2.0),
                          child: RichText(
                              text: TextSpan(
                                  text: parentModel.learningObjectTypology.value
                                      .toUpperCase(),
                                  style: AppTextTheme.title(
                                      color: ColorManager()
                                          .getColorTextMandatory(),
                                      size: 12.0),
                                  children: [
                                TextSpan(
                                  text: ' | ',
                                  style: AppTextTheme.title(
                                      color:
                                          ColorManager().getColorTextPrimary(),
                                      size: 12.0),
                                ),
                                TextSpan(
                                  text: parentModel.learningObjectType
                                      .getTranslatedValue()
                                      .toUpperCase(),
                                  style: AppTextTheme.title(
                                      color:
                                          ColorManager().getColorTextPrimary(),
                                      size: 12.0,
                                      weight: FontWeight.w500),
                                ),
                              ])),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.spacingL, bottom: Dimens.spacingXS),
                          child: Text(
                            parentModel.title ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextTheme.title(
                                color: ColorManager().getColorTextPrimary(),
                                size: 16.0),
                          ),
                        ),
                        if ((parentModel.topicTags ?? List.empty()).isNotEmpty)
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: Dimens.spacingL,
                                  bottom: Dimens.spacingXS),
                              child: _buildTopicTags(
                                  parentModel.topicTags ?? List.empty())),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.spacingL - 8,
                              bottom: Dimens.spacingXS),
                          child: Row(
                            children: [
                              DurationTag.fromMinutes(
                                parentModel.duration ?? 0,
                                color: Colors.transparent,
                                textStyle: AppTextTheme.body(
                                    color:
                                        ColorManager().getColorTextPrimary()),
                              ),
                              SvgPicture.asset(
                                  "assets/icons/detail/dettaglio_scadenza.svg"),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                  "${LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.expiring_on)}${parentModel.expirationDate?[2]}/${parentModel.expirationDate?[1]}/${parentModel.expirationDate?[0]}",
                                  style: AppTextTheme.caption(
                                      color:
                                          ColorManager().getColorTextPrimary()))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
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
