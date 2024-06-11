import 'package:open_learning_smart_tv/presentation/notification/cubit/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../color_management/color_manager.dart';
import '../../core/dependency_injection/dependency_injection.dart';
import '../../domain/entities/notification/notification_model.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';
import '../../theme/app_theme.dart';
import '../common/widgets/app_bar/styled_app_bar.dart';
import '../common/widgets/error/error_screen.dart';
import 'widgets/notification_item.dart';

class NotificationPage extends StatefulWidget {
  static const routeName = 'notification';
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    getIt<NotificationCubit>().fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(
          title: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.notify_text)),
      body: DecoratedBox(
        decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) => state.map(
              loading: (_) => _loading,
              done: (value) => _done(value.items),
              empty: (_) => _empty,
              error: (_) => _error(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _done(List<NotificationModel> items) {
    return ListView.separated(
      padding: const EdgeInsets.all(Dimens.spacingL),
      itemCount: items.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: Dimens.spacingXS),
      itemBuilder: (context, index) => NotificationItem(items[index]),
    );
  }

  Widget get _empty {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.spacingXL),
        child: Text(
          LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.no_notifications),
          textAlign: TextAlign.center,
          style: AppTextTheme.body(
            color: ColorManager().getColorTextPrimary(),
          ),
        ),
      ),
    );
  }

  Widget get _loading {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _error(BuildContext context) {
    return Center(
      child: ErrorScreen(
        title:
            LabelsManager().getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
        message: LabelsManager()
            .getRemoteStringFromLabelKeys(RemoteLabelKeys.error_occurred),
        onReload: () => context.read<NotificationCubit>().fetch(),
      ),
    );
  }
}
