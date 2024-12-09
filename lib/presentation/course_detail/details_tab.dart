import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/extra_details_card.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/parent_course_card.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/teachers_sheet/cubit/teacher_detail_sheet_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/teachers_sheet/teacher_detail_sheet.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/teachers_sheet/teacher_placeholder.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../color_management/color_manager.dart';
import '../../core/dependency_injection/dependency_injection.dart';
import '../../domain/entities/detail/detail_page_model.dart';
import '../../domain/entities/generic/agenda_model.dart';
import '../../domain/entities/generic/teacher_model.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';
import '../common/widgets/tag/duration_tag.dart';

class DetailsTab extends StatelessWidget {
  final DetailPageModel model;
  final DetailPageModel? parentModel;
  final bool showDuration;

  const DetailsTab({
    super.key,
    required this.model,
    required this.showDuration,
    this.parentModel,
  });

  @override
  Widget build(BuildContext context) {
    final agenda = model.agenda ?? List.empty();
    final teachers = model.teachers ?? List.empty();

    final bool showParentCard = ((model.isStandAlone == false &&
            model.learningObjectTypology != LearningObjectTypology.course &&
            model.learningObjectTypology != LearningObjectTypology.path) ||
        (model.learningObjectTypology == LearningObjectTypology.course &&
            model.learningObjectType == LearningObjectType.blended));
    // final bool showExtraDetailsCard =
    //     (model.learningObjectTypology == LearningObjectTypology.course);
    // final bool showAdditionalInfo =
    //     (model.learningObjectType != LearningObjectType.blended &&
    //         model.isStandAlone == false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.hViewPadding),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showDuration) ...[
                  DurationTag.fromMinutes(
                    model.duration ?? 0,
                    color: Colors.transparent,
                    textStyle: AppTextTheme.body(
                      color: ColorManager().getColorTextPrimary(),
                    ),
                  ),
                ],
                Text(
                  LabelsManager().getRemoteStringFromLabelKeys(
                      RemoteLabelKeys.what_to_expect),
                  style: AppTextTheme.title(
                    color: ColorManager().getColorTextPrimaryCta(),
                    size: 24,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  model.longDescription ?? "",
                  style: AppTextTheme.subtitle(
                    color: ColorManager().getColorTextPrimary(),
                    weight: FontWeight.w500,
                    size: 20,
                  ),
                ),
                if (agenda.isNotEmpty) ...[
                  Text(
                    LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.agenda),
                    style: AppTextTheme.title(
                      color: ColorManager().getColorTextPrimaryCta(),
                      size: 24,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _agendaTiles(agenda),
                  ),
                ],
                if (showParentCard && parentModel != null) ...[
                  ParentCourseCard(parentModel: parentModel!),
                ],
                if (teachers.isNotEmpty) ...[
                  Text(
                    LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.teachers),
                    style: AppTextTheme.title(
                      color: ColorManager().getColorTextPrimaryCta(),
                      size: 24,
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: teachers.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: Dimens.spacingXS,
                      ),
                      itemBuilder: (context, index) {
                        TeacherModel item = teachers[index];
                        return _teacherCard(context, item);
                      },
                    ),
                  ),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _agendaTiles(List<AgendaModel> agendas) {
    List<Widget> result = List.empty(growable: true);
    for (final element in agendas) {
      result.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(
            Dimens.spacingL,
            Dimens.spacingXS,
            Dimens.spacingL,
            Dimens.spacingXS,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: SvgPicture.asset(
                  (element.isBreak == true)
                      ? "assets/icons/agenda_break.svg"
                      : "assets/icons/agenda.svg",
                  colorFilter: ColorFilter.mode(
                      ColorManager().getColorSystemPrimary02(),
                      BlendMode.srcIn),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                element.item ?? "",
                style: AppTextTheme.subtitle(
                  color: ColorManager().getColorTextPrimary(),
                ),
              )
            ],
          ),
        ),
      );
    }
    return result;
  }

  Widget _teacherCard(BuildContext context, TeacherModel teacher) {
    return SizedBox(
      height: 90,
      width: 160,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.radius),
        clipBehavior: Clip.antiAlias,
        child: Stack(children: [
          CachedNetworkImage(
            imageUrl: teacher.image ?? '',
            height: 100,
            width: 160,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) =>
                TeacherPlaceholder(teacher.completeName),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  ColorManager().getColorGradient05Start(),
                  ColorManager().getColorGradient05End().withOpacity(0.7),
                ])),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              Dimens.spacingM,
              Dimens.spacingM,
              Dimens.spacingM,
              Dimens.spacingXXS,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  teacher.completeName ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextTheme.body(
                      color: ColorManager().getColorTextPrimary(),
                      weight: FontWeight.w700),
                ),
                Text(
                  teacher.operationalField ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextTheme.caption(
                      color: ColorManager().getColorTextPrimary(),
                      weight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  showDragHandle: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.radius)),
                  barrierColor: ColorManager()
                      .getColorBackgroundDrawerWidget()
                      .withAlpha(127),
                  backgroundColor: AppTheme.greyGradient.colors[0],
                  builder: (context) => BlocProvider<TeacherDetailSheetCubit>(
                        create: (_) =>
                            getIt<TeacherDetailSheetCubit>()..init(teacher.id),
                        child: TeachersSheet(fallbackImage: teacher.image),
                      )),
            ),
          )
        ]),
      ),
    );
  }
}
