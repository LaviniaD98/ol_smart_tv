import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/card_modulo.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_image.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/tag/duration_tag.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/tag/status_tag.dart';
import 'package:flutter/material.dart';
import '../../../color_management/color_manager.dart';
import '../../../theme/app_theme.dart';

class CardModuloHorizontal extends StatefulWidget {
  final int index;
  final String tipoText;
  final double progressPercentage;
  final String titolo;
  final String descrizione;
  final String imageUrl;
  final String buttonTitle;
  final Function(int) onButtonPressed;
  final Function(int) onDownloadPressed;
  final int? durataMinuti;
  final int? numAttivita;
  final int? numRisorse;
  final bool isEnabled;
  final bool hasBadge;
  final bool isCompleted;
  final bool showDivider;
  final String? status;
  final void Function(bool)? onFocusChange;
  final FocusScopeNode? parentFocus;
  final LearningObjectTypology type;
  final void Function(ButtonFocusedType?)? onModuleButtonFocused;
  final bool isSubActivities;

  final void Function()? onTap;

  const CardModuloHorizontal({
    super.key,
    required this.index,
    required this.tipoText,
    required this.progressPercentage,
    required this.titolo,
    required this.descrizione,
    required this.imageUrl,
    required this.buttonTitle,
    required this.onButtonPressed,
    required this.onDownloadPressed,
    this.durataMinuti,
    this.numAttivita,
    this.numRisorse,
    this.isEnabled = true,
    this.hasBadge = false,
    this.isCompleted = false,
    this.showDivider = true,
    this.status = "",
    this.onFocusChange,
    this.parentFocus,
    this.type = LearningObjectTypology.path,
    this.onModuleButtonFocused,
    this.isSubActivities = false,
    this.onTap,
  });

  @override
  State<CardModuloHorizontal> createState() => _CardModuloHorizontalState();
}

class _CardModuloHorizontalState extends State<CardModuloHorizontal>
    with AutomaticKeepAliveClientMixin {
  late OlFocusScopeNode _focusNode;

  bool isActivityButtonLastFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = OlFocusScopeNode(
      id: 'CardModulo - ${widget.index} - ${widget.type}',
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Align(
      alignment: Alignment.topCenter,
      child: InkWell(
        onTap: widget.onTap,
        focusNode: _focusNode,
        onFocusChange: (value) {
          widget.onFocusChange?.call(value);
          setState(() {});
        },
        child: Container(
          margin: const EdgeInsets.only(right: 32),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 177,
                width: 315,
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                  color: OLColors.backgroundCard,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _focusNode.hasFocus
                        ? getBorderFocusColor()
                        : OLColors.border,
                    width: _focusNode.hasFocus ? 5 : 1,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: OLImage(
                        imageURL: widget.imageUrl,
                        cacheWidth: 400,
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.status == 'C') ...[
                Positioned(
                  top: 8,
                  left: -4,
                  child: StatusTag.svg(
                    backgroundColor: ColorManager().getColorSystemSecondary02(),
                    svgPath: IconStatus.completed.svgPath ?? '',
                  ),
                ),
              ],
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 24,
                    top: 12,
                    bottom: 22,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          buildDurationTag(),
                        ],
                      ),
                      const Spacer(),
                      RichText(
                        text: TextSpan(
                          children: [
                            /// Type Label
                            TextSpan(
                              text: widget.tipoText.toUpperCase(),
                              style: AppTextTheme.body(
                                color: ColorManager().getColorTextMandatory(),
                                weight: FontWeight.bold,
                                size: 14,
                              ),
                            ),
                            TextSpan(
                              text: ' | ',
                              style: AppTextTheme.body(
                                color: ColorManager().getColorTextPrimary(),
                                weight: FontWeight.bold,
                                size: 14,
                              ),
                            ),
                            TextSpan(
                              text: widget.type
                                  .getTranslatedValue()
                                  .toUpperCase(),
                              style: AppTextTheme.body(
                                color: ColorManager().getColorTextPrimary(),
                                weight: FontWeight.bold,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        widget.titolo.toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.body(
                          color: ColorManager().getColorTextPrimary(),
                          weight: FontWeight.bold,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getBorderFocusColor() {
    // if (widget.data.iconStatus != IconStatus.idle) {
    //   return widget.data.iconStatus.color;
    // }

    return OLColors.textPrimary;
  }

  Widget buildDurationTag() {
    if (widget.durataMinuti == null || widget.durataMinuti == 0) {
      return const SizedBox.shrink();
    }

    return DurationTag.fromMinutes(widget.durataMinuti ?? 0);
  }

  @override
  bool get wantKeepAlive => true;
}
