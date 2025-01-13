import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/presentation/common/utilities/custom_focus_node.dart';
import 'package:open_learning_smart_tv/presentation/dynamic_content/strip/calendar/widgets/activity_item_alert.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../../../domain/entities/strip/calendar/activity/calendar_activity.dart';
import 'learning_object_activity.dart';
import 'smart_learning_activity.dart';

class GridActivities extends StatefulWidget {
  final DateTime date;
  final List<CalendarActivity> items;
  final bool hasError;
  final OlFocusScopeNode parentFocus;

  const GridActivities({
    super.key,
    required this.date,
    required this.items,
    required this.parentFocus,
    this.hasError = false,
  });

  @override
  State<GridActivities> createState() => _GridActivitiesState();
}

class _GridActivitiesState extends State<GridActivities> {
  final autoScrollController = AutoScrollController(
    viewportBoundaryGetter: () => const Rect.fromLTRB(0, 100, 0, 0),
    axis: Axis.vertical,
  );
  late OlFocusScopeNode _focusNode;
  final OrderedTraversalPolicy _policy = OrderedTraversalPolicy();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _focusNode = OlFocusScopeNode(id: 'GridActivities${widget.date}');
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowUp): () {
          final res = _policy.previous(_focusNode);

          if (res == false) {
            widget.parentFocus.focusInDirection(TraversalDirection.up);
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          final res = _policy.next(_focusNode);
          if (res == false) {
            widget.parentFocus.focusInDirection(TraversalDirection.down);
          }
        },
      },
      child: FocusScope(
        node: _focusNode,
        canRequestFocus: widget.items.isNotEmpty,
        onFocusChange: (value) {
          if (value) {
            if (_focusNode.focusedChild == null) {
              final firstFocus = _policy.findFirstFocus(_focusNode);
              firstFocus?.requestFocus();
            }
          }
        },
        child: FocusTraversalGroup(
          key: LabeledGlobalKey('FocusTraversalGroup - Main'),
          policy: _policy,
          child: Builder(builder: (context) {
            if (widget.hasError) {
              return ActivityItemAlert(
                color: ColorManager().getColorTextError(),
                message: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.error_occurred),
              );
            } else if (widget.items.isEmpty) {
              return ActivityItemAlert(
                color: ColorManager().getColorTextPrimary(),
                message: LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.no_scheduled_event),
              );
            }
            return ListView.builder(
              controller: autoScrollController,
              padding: const EdgeInsets.only(bottom: 100),
              itemCount: widget.items.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return widget.items[index].map(
                  learningObject: (e) => LearningObjectActivity(
                    model: e.model,
                    date: widget.date,
                    index: index,
                    onFocusChanged: (c) {
                      scrollToPosition(index);
                    },
                  ),
                  smartLearningObject: (e) => SmartLearningActivity(
                    model: e.model,
                    date: widget.date,
                    index: index,
                    onFocusChanged: (c) {
                      scrollToPosition(index);
                    },
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }

  Future<void> scrollToPosition(int index) async {
    currentIndex = index;
    await autoScrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
    );
  }
}
