import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/domain/entities/search/suggestion_model.dart';
import 'package:flutter/material.dart';

import '../../../color_management/color_manager.dart';
import '../../../theme/app_theme.dart';
import '../../common/widgets/rich_text/highlighted_rich_text.dart';
import '../../course_detail/detail_page.dart';

class Suggestions extends StatelessWidget {
  final List<SuggestionModel> suggestions;
  final String search;

  const Suggestions(this.suggestions, {super.key, required this.search});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Nav.push(context,
                screen: DetailPage(
                  args: DetailPageArgs(
                    id: suggestions[index].id.toString(),
                    typology: suggestions[index].learningObjectTypology,
                  ),
                ));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.spacingL,
              vertical: Dimens.spacingM,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.grey.withOpacity(.2),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: suggestions[index]
                            .learningObjectType
                            .getTranslatedValue()
                            .toUpperCase()
                        /*suggestions[index]
                            .learningObjectTypology
                            .value
                            .toUpperCase()*/
                        ,
                        style: AppTextTheme.caption(
                          weight: FontWeight.w700,
                          color: ColorManager().getColorTextMandatory(),
                        ),
                      ),
                      TextSpan(
                        text: ' | ',
                        style: AppTextTheme.caption(
                            weight: FontWeight.w700,
                            color: ColorManager().getColorTextPrimary()),
                      ),
                      TextSpan(
                        text: suggestions[index]
                            .learningObjectTypology
                            .getTranslatedValue()
                            .toUpperCase()
                        /*suggestions[index]
                            .learningObjectType
                            .value
                            .toUpperCase()*/
                        ,
                        style: AppTextTheme.caption(
                            weight: FontWeight.w700,
                            color: ColorManager().getColorTextPrimary()),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Dimens.spacingXXS),
                HighlightedRichText(
                  text: suggestions[index].title ?? '',
                  highlightText: search,
                  style: AppTextTheme.body(
                      color: ColorManager().getColorTextDisabled()),
                  highlightStyle: AppTextTheme.body(
                      weight: FontWeight.bold,
                      color: ColorManager().getColorTextPrimary()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
