import 'package:open_learning_smart_tv/domain/entities/generic/tool_url_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../../domain/entities/generic/tool_model.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../common/utilities/file_size_formatting.dart';
import 'cubit/tool_item_cubit.dart';

class ToolItem extends StatefulWidget {
  const ToolItem({
    super.key,
    required this.item,
    this.learningObjectId,
  });

  final ToolModel item;
  final int? learningObjectId;

  @override
  State<ToolItem> createState() => _ToolItemState();
}

class _ToolItemState extends State<ToolItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => getIt<ToolItemCubit>()
        ..fetch(widget.item.id, widget.learningObjectId),
      child: BlocBuilder<ToolItemCubit, ToolItemState>(
        builder: (context, state) => state.map(loading: (_) {
          return Padding(
            padding: const EdgeInsets.only(
                bottom: Dimens.spacingXS,
                left: Dimens.spacingM,
                right: Dimens.spacingM,
                top: Dimens.spacingXS),
            child: _shimmerLoader,
          );
        }, loaded: (value) {
          return Card(
            margin: const EdgeInsets.only(
                bottom: Dimens.spacingXS,
                left: Dimens.spacingM,
                right: Dimens.spacingM,
                top: Dimens.spacingXS),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.radius),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: AppTheme.greyGradient,
                borderRadius:
                    const BorderRadius.all(Radius.circular(Dimens.radius)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.spacingM,
                  vertical: Dimens.spacingXS,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.item.shortDescription != null)
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: Dimens.spacingXS),
                        child: Text(
                          widget.item.shortDescription!,
                          style: AppTextTheme.body(
                              color: ColorManager().getColorTextPrimary()),
                        ),
                      ),
                    if (value.data?.publicUrl != null) _getFile(value.data!),
                    if (widget.item.usefulLinks != null &&
                        widget.item.usefulLinks!.isNotEmpty)
                      _getLink
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget get _shimmerLoader {
    return Shimmer.fromColors(
      baseColor: AppColors.white.withOpacity(.09),
      highlightColor: AppColors.primaryFaded,
      period: const Duration(seconds: 2),
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: Dimens.spacingXS),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.5),
            borderRadius: BorderRadius.circular(Dimens.radius),
          ),
        ),
      ),
    );
  }

  Widget _getFile(ToolUrlModel file) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.spacingXS),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => launchUrl(Uri.parse(file.publicUrl!),
                mode: LaunchMode.externalApplication),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    widget.item.name ?? 'No name',
                    style: AppTextTheme.body(
                      color: ColorManager().getColorTextPrimaryCta(),
                    ),
                  ),
                ),
                const SizedBox(width: Dimens.spacingXS),
                SvgPicture.asset(
                  "assets/icons/pdf.svg",
                  colorFilter: ColorFilter.mode(
                    ColorManager().getColorTextPrimaryCta(),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Dimens.spacingXXS),
          if (widget.item.dimension != null) _getDimens,
        ],
      ),
    );
  }

  Widget get _getDimens {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.spacingXS),
      child: Text(
        getFileSizeString(bytes: widget.item.dimension!),
        style: AppTextTheme.body(),
      ),
    );
  }

  Widget get _getLink {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: widget.item.usefulLinks!
          .where((e) => e.url != null && e.url!.isNotEmpty)
          .map((e) {
        return Padding(
          padding: const EdgeInsets.only(top: Dimens.spacingXS),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => launchUrl(Uri.parse(e.url!),
                mode: LaunchMode.externalApplication),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    e.urlLabel ?? '--',
                    style: AppTextTheme.body(
                      color: ColorManager().getColorTextPrimaryCta(),
                    ),
                  ),
                ),
                const SizedBox(width: Dimens.spacingXS),
                SvgPicture.asset(
                  "assets/icons/link.svg",
                  colorFilter: ColorFilter.mode(
                    ColorManager().getColorTextPrimaryCta(),
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
