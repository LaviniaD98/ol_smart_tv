import 'package:open_learning_smart_tv/domain/entities/generic/teacher_detail_model.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/teachers_sheet/cubit/teacher_detail_sheet_cubit.dart';
import 'package:open_learning_smart_tv/presentation/course_detail/widgets/teachers_sheet/teacher_placeholder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../color_management/color_manager.dart';
import '../../../../theme/app_theme.dart';

class TeachersSheet extends StatelessWidget {
  final String? fallbackImage;

  const TeachersSheet({
    super.key,
    this.fallbackImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(Dimens.spacingM),
        child: BlocBuilder<TeacherDetailSheetCubit, TeacherDetailSheetState>(
          builder: (context, state) => state.maybeWhen(
            success: (teacher) => _content(teacher),
            orElse: () => _loading,
          ),
        ));
  }

  Widget get _loading {
    return const SizedBox(
      height: 450,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _content(TeacherDetailModel teacher) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.radius),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: teacher.image ?? '',
                width: double.infinity,
                height: 250,
                fit: BoxFit.fitWidth,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => CachedNetworkImage(
                  imageUrl: fallbackImage ?? '',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.fitWidth,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      TeacherPlaceholder(teacher.completeName, isBig: true),
                ),
              ),
              Container(
                width: double.infinity,
                height: 250,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorManager().getColorGradient05Start(),
                      ColorManager()
                          .getColorGradient05End()
                          .withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: Dimens.spacingM,
        ),
        Text(
          teacher.completeName ?? '',
          style: AppTextTheme.title(
            color: ColorManager().getColorTextPrimary(),
            size: 14,
          ),
        ),
        const SizedBox(
          height: Dimens.spacingS,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/icons/mail.svg",
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                  ColorManager().getColorTextPrimary(), BlendMode.srcIn),
            ),
            const SizedBox(
              width: Dimens.spacingXS,
            ),
            Text(
              teacher.email ?? '',
              style: AppTextTheme.body(
                  color: ColorManager().getColorTextPrimary()),
            ),
          ],
        ),
        const SizedBox(
          height: Dimens.spacingS,
        ),
        Text(
          teacher.description ?? '',
          style: AppTextTheme.body(color: ColorManager().getColorTextPrimary()),
        ),
        const SizedBox(
          height: Dimens.spacingL,
        ),
      ],
    );
  }
}
