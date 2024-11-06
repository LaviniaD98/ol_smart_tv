import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_learning_smart_tv/domain/entities/progress/learner_goals.dart';
import 'package:open_learning_smart_tv/domain/entities/progress/learner_progress.dart';
import 'package:open_learning_smart_tv/domain/entities/progress/progress_goals_config_model.dart';
import 'package:open_learning_smart_tv/domain/entities/session/user_model.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/main/for_you/widget_focus_card.dart';
import 'package:open_learning_smart_tv/presentation/profile/cubit/profile_page_cubit.dart';
import 'package:open_learning_smart_tv/presentation/profile/widgets/goals_card.dart';
import 'package:open_learning_smart_tv/presentation/profile/widgets/progress_card.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class UserWidgetsList extends StatefulWidget {
  const UserWidgetsList({super.key});

  @override
  State<UserWidgetsList> createState() => _UserWidgetsListState();
}

class _UserWidgetsListState extends State<UserWidgetsList> {
  final widgetsFocusNode = OlFocusScopeNode(id: 'User-Widgets');

  final OrderedTraversalPolicy _policy = OrderedTraversalPolicy();

  final autoScrollController = AutoScrollController(
    viewportBoundaryGetter: () => const Rect.fromLTRB(0, 60, 0, 0),
    axis: Axis.vertical,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 550,
      child: BlocBuilder<ProfilePageCubit, ProfilePageState>(
        buildWhen: (previous, current) => current.maybeMap(
          success: (_) => true,
          orElse: () => true,
        ),
        builder: (context, state) => state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          success:
              (userInfoModel, imageUrl, progressGoalsConfig, goals, progress) {
            return _success(
              context,
              userInfoModel?.user,
              imageUrl,
              progressGoalsConfig,
              goals,
              progress,
            );
          },
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget _success(
    BuildContext context,
    UserModel? user,
    String? imageUrl,
    ProgressGoalsConfigModel? progressGoalsConfig,
    LearnerGoalsModel? goals,
    LearnerProgressModel? progress,
  ) {
    final List<Widget> pagerItems = (progressGoalsConfig?.enabled == true)
        ? [
            if (progressGoalsConfig?.yourGoals?.enabled == true &&
                goals != null)
              GoalsCard(data: goals),
            if (progressGoalsConfig?.yourProgress?.enabled == true &&
                progress != null)
              ProgressCard(data: progress),
          ]
        : [];

    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowUp): () {
          _policy.previous(widgetsFocusNode);
        },
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          _policy.next(widgetsFocusNode);
        },
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          FocusScope.of(context).focusInDirection(TraversalDirection.left);
          //forYouFocusNode.requestFocus();
        },
      },
      child: FocusTraversalGroup(
        key: const ValueKey('Widgets-list'),
        policy: _policy,
        child: FocusScope(
          node: widgetsFocusNode,
          onFocusChange: (value) {
            if (value) {
              if (widgetsFocusNode.focusedChild == null) {
                final firstFocus = _policy.findFirstFocus(widgetsFocusNode);
                firstFocus?.requestFocus();
              }
            }
          },
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 0, bottom: 20),
            itemBuilder: (context, index) {
              return CallbackShortcuts(
                bindings: <ShortcutActivator, VoidCallback>{
                  const SingleActivator(LogicalKeyboardKey.enter): () {},
                  const SingleActivator(LogicalKeyboardKey.select): () {},
                },
                child: AutoScrollTag(
                  key: ValueKey(index),
                  controller: autoScrollController,
                  index: index,
                  child: WidgetFocusCard(
                    margin: const EdgeInsets.only(bottom: Dimens.spacingM),
                    index: index,
                    child: (_) => pagerItems[index],
                  ),
                ),
              );
            },
            itemCount: pagerItems.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
