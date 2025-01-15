import 'dart:async';

import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/learning_object/learning_object_model.dart';
import 'package:open_learning_smart_tv/domain/entities/strip/row/strip_row.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/main/main_state_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../theme/app_theme.dart';
import '../../../common/widgets/cards/learning_card.dart';
import '../../cubit/dynamic_content_cubit.dart' as dc;
import 'cubit/standard_strip_cubit.dart';

class StandardStripRow extends StatelessWidget {
  final StripRow strip;
  final void Function(bool)? onFocusChange;
  final ValueNotifier<LearningObjectModel?>? focusedObjectNotifier;

  const StandardStripRow({
    super.key,
    required this.strip,
    this.onFocusChange,
    this.focusedObjectNotifier,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode)
      print("${DateTime.now()} https:// in StandardStripRow build");
    return BlocProvider(
      create: (context) => getIt<StandardStripCubit>()
        ..fetch(
          strip: strip,
          filters: (context.read<dc.DynamicContentCubit>().state as dc.Success)
              .filters,
        ),
      child: _StandardStripContent(
        key: key,
        strip: strip,
        onFocusChange: onFocusChange,
        focusedObjectNotifier: focusedObjectNotifier,
      ),
    );
  }
}

class _StandardStripContent extends StatefulWidget {
  final StripRow strip;
  final void Function(bool)? onFocusChange;
  final ValueNotifier<LearningObjectModel?>? focusedObjectNotifier;

  const _StandardStripContent({
    super.key,
    required this.strip,
    this.onFocusChange,
    this.focusedObjectNotifier,
  });
  @override
  State<_StandardStripContent> createState() => _StandardStripContentState();
}

class _StandardStripContentState extends State<_StandardStripContent>
    with AutomaticKeepAliveClientMixin {
  late OlFocusScopeNode focusNode;

  Timer? _timer;

  bool expanded = false;

  @override
  void initState() {
    super.initState();

    focusNode = OlFocusScopeNode(
      id: 'Explore-----${widget.strip.labelMapping}',
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocListener<dc.DynamicContentCubit, dc.DynamicContentState>(
      listener: (contexts, state) => state.mapOrNull(
        success: (_) => context
            .read<StandardStripCubit>()
            .fetch(strip: widget.strip, filters: _.filters),
      ),
      child: BlocBuilder<StandardStripCubit, StandardStripState>(
        builder: (context, state) => state.map(
          success: (value) => value.items.isNotEmpty
              ? FocusTraversalGroup(
                  key: ValueKey(widget.strip.labelMapping),
                  child: FocusScope(
                    node: focusNode,
                    onFocusChange: (value) {
                      if (value) {
                        _timer = Timer(
                          const Duration(seconds: 3),
                          () {
                            setState(() => expanded = true);
                          },
                        );
                      } else {
                        if (expanded) {
                          setState(() => expanded = false);
                        }
                        _timer?.cancel();
                      }

                      widget.onFocusChange?.call(value);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimens.hViewPadding,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.strip.label,
                                  style: AppTextTheme.subtitle(
                                    weight: FontWeight.w700,
                                    size: 32,
                                    color: ColorManager().getColorTextPrimary(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 38,
                            bottom: 44,
                          ),
                          child: SizedBox(
                            height: Dimens.learningCardTVHeight,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              clipBehavior: Clip.none,
                              padding: const EdgeInsets.only(
                                left: Dimens.hViewPadding,
                                right: Dimens.hViewPadding,
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: Dimens.spacingXS),
                              itemCount: value.items.length,
                              itemBuilder: (context, index) {
                                final item = value.items[index];
                                final cell = LearningCard(
                                  data: item,
                                  onFocusChange: (hasFocus) {
                                    if (hasFocus) {
                                      widget.focusedObjectNotifier?.value =
                                          item;
                                    }
                                  },
                                );

                                if (index == 0) {
                                  return CallbackShortcuts(
                                    bindings: <ShortcutActivator, VoidCallback>{
                                      const SingleActivator(
                                          LogicalKeyboardKey.arrowLeft): () {
                                        final focus = context
                                            .read<MainStateCubit>()
                                            .state;
                                        focus.requestFocus();
                                      },
                                    },
                                    child: cell,
                                  );
                                }
                                return cell;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : _shimmerLoader, // const SizedBox.shrink(),
          loading: (value) => _shimmerLoader,
          error: (_) => const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget get _shimmerLoader {
    return FocusScope(
      node: focusNode,
      onFocusChange: (value) {
        widget.onFocusChange?.call(value);
      },
      child: FocusTraversalGroup(
        key: ValueKey(widget.strip.labelMapping),
        child: Shimmer.fromColors(
          baseColor: AppColors.white.withValues(alpha: .09),
          highlightColor: AppColors.primaryFaded,
          period: const Duration(seconds: 2),
          enabled: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Container(
                margin: const EdgeInsets.only(
                  left: Dimens.hViewPadding,
                  right: Dimens.hViewPadding,
                ),
                width: (MediaQuery.of(context).size.width /
                        Dimens.learningCardRatio) *
                    .7,
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .3),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  widget.strip.labelMapping ?? '', //'A',
                  style: AppTextTheme.subtitle(
                    weight: FontWeight.w700,
                    size: 32,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 38,
                  bottom: 44,
                ),
                child: SizedBox(
                  height: Dimens.learningCardTVHeight,
                  child: ListView.separated(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(
                      left: Dimens.hViewPadding,
                      right: Dimens.hViewPadding,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: Dimens.spacingXS),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return const LearningCardShimmer();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
