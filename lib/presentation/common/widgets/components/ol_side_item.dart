import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:open_learning_smart_tv/theme/glow/widget/glow_container.dart';
import 'package:simple_shadow/simple_shadow.dart';

class OLSideItem extends StatefulWidget {
  const OLSideItem({
    required this.title,
    required this.icon,
    required this.id,
    this.isSelected = false,
    this.child,
    super.key,
  });

  final String title;
  final String icon;
  final String id;
  final bool isSelected;
  final Widget Function(bool hasFocus)? child;

  @override
  State<OLSideItem> createState() => _OLSideItemState();
}

class _OLSideItemState extends State<OLSideItem> {
  late OlFocusNode focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = OlFocusNode(id: widget.id);
  }

  @override
  dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      onFocusChange: (value) {
        setState(() {});
      },
      child: Builder(
        builder: (context) {
          if (widget.child != null) {
            return widget.child?.call(focusNode.hasFocus) ??
                const SizedBox.shrink();
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SimpleShadow(
                color: focusNode.hasFocus || widget.isSelected
                    ? OLColors.accentVariantA
                    : OLColors.textPrimary,
                offset: Offset.zero,
                sigma: focusNode.hasFocus ? 10 : 0,
                opacity: 1,
                child: SvgPicture.asset(
                  widget.icon,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    focusNode.hasFocus || widget.isSelected
                        ? OLColors.accentVariantA
                        : OLColors.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.title,
                style: AppTextTheme.body(
                  size: 16,
                  weight: FontWeight.w600,
                  color: focusNode.hasFocus || widget.isSelected
                      ? OLColors.accentVariantA
                      : OLColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              GlowContainer(
                width: 75,
                height: 2.5,
                blurRadius: 8,
                spreadRadius: 1,
                glowColor: focusNode.hasFocus || widget.isSelected
                    ? OLColors.accentVariantA.withOpacity(0.5)
                    : Colors.transparent,
                color: focusNode.hasFocus || widget.isSelected
                    ? OLColors.accentVariantA
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              )
            ],
          );
        },
      ),
    );
  }
}
