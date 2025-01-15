import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '../../../../../theme/app_theme.dart';

class TopicFilterItem extends StatefulWidget {
  // static const _iconSize = 24.0;

  final String? label;
  final String? path;
  final VoidCallback onTap;
  final bool isSelected;
  final EdgeInsets? padding;
  final void Function(bool)? onFocusChange;

  const TopicFilterItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    this.label,
    this.path,
    this.padding,
    this.onFocusChange,
  });

  @override
  State<TopicFilterItem> createState() => _TopicFilterItemState();
}

class _TopicFilterItemState extends State<TopicFilterItem> {
  late OlFocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = OlFocusNode(id: '${widget.label} - FILTER ----1');
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusNode: focusNode,
      autofocus: false,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      onFocusChange: (value) {
        widget.onFocusChange?.call(value);
        setState(() {});
      },
      onTap: () {
        widget.onTap();
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: focusNode.hasFocus
                  ? OLColors.accentVariantA
                  : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleShadow(
                color: widget.isSelected
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
                    widget.isSelected
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
                  color: widget.isSelected
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
}

class TopicFilterItemShimmer extends StatelessWidget {
  static const _iconSize = 45.0;

  const TopicFilterItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, right: 48),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: _iconSize,
            height: _iconSize,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .5),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const SizedBox(height: Dimens.spacingXS),
          Container(
            width: 200,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .5),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ],
      ),
    );
  }
}
