import 'package:flutter/material.dart';
// import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../../color_management/color_manager.dart';
import '../../../../../theme/app_theme.dart';
import '../../../../common/widgets/glow.dart';

class TopicFilterItem extends StatefulWidget {
  static const _iconSize = 24.0;

  final String? label;
  final String? path;
  final VoidCallback onTap;
  final bool isSelected;
  final EdgeInsets? padding;

  const TopicFilterItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    this.label,
    this.path,
    this.padding,
  });

  @override
  State<TopicFilterItem> createState() => _TopicFilterItemState();
}

class _TopicFilterItemState extends State<TopicFilterItem> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode(debugLabel: '${widget.label} - FILTER ----1');
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      autofocus: false,
      onFocusChange: (value) => setState(() {}),
      child: GestureDetector(
        onTap: widget.onTap,
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleShadow(
                color: focusNode.hasFocus || widget.isSelected
                    ? OLColors.accentVariantA
                    : OLColors.textPrimary,
                offset: Offset.zero,
                sigma: focusNode.hasFocus ? 10 : 0,
                opacity: 1,
                child: SvgPicture.network(
                  widget.path!,
                  height: 45,
                  width: 45,
                  colorFilter: ColorFilter.mode(
                    focusNode.hasFocus || widget.isSelected
                        ? OLColors.accentVariantA
                        : OLColors.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(height: Dimens.spacingXS),
              Text(
                widget.label ?? 'Unknown',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: AppTextTheme.body(
                  size: 22,
                  weight: FontWeight.w600,
                  color: focusNode.hasFocus || widget.isSelected
                      ? OLColors.accentVariantA
                      : OLColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _color(bool isSelected) => isSelected
      ? ColorManager().getColorSystemSecondary01()
      : ColorManager().getColorTextPrimary();
}

class TopicFilterItemShimmer extends StatelessWidget {
  static const _iconSize = 24.0;

  const TopicFilterItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: _iconSize,
          height: _iconSize,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        const SizedBox(height: Dimens.spacingXS),
        Container(
          width:
              (MediaQuery.of(context).size.width / Dimens.learningCardRatio) *
                  .3,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ],
    );
  }
}
