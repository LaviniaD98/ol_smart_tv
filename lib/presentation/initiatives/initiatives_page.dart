import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/color_management/ol_colors.dart';
import 'package:open_learning_smart_tv/core/utils/nav.dart';
import 'package:open_learning_smart_tv/domain/entities/self/id_label_model.dart';
import 'package:open_learning_smart_tv/domain/entities/self/self_model.dart';
import 'package:open_learning_smart_tv/presentation/app_state/cubit/app_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_button.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/components/ol_selection_item.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/initiatives/cubit/initiatives_cubit.dart';
import 'package:open_learning_smart_tv/presentation/login/widgets/logo_banner.dart';
import 'package:open_learning_smart_tv/presentation/ol_home_screen.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/dependency_injection/dependency_injection.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';

class InitiativesPage extends StatefulWidget {
  static String routeName = 'initiatives';
  final InitiativesPageArgs args;

  const InitiativesPage({super.key, required this.args});

  @override
  State<InitiativesPage> createState() => _InitiativesPageState();
}

class _InitiativesPageState extends State<InitiativesPage> {
  final OrderedTraversalPolicy _focusNodeOrder = OrderedTraversalPolicy();
  final FocusNode _focusNode = FocusNode(canRequestFocus: false);

  bool popping = false;

  @override
  void initState() {
    super.initState();

    //final policy = FocusTraversalGroup.of(_focusNode.context ?? context);
    // ignore: invalid_use_of_protected_member

    Future.delayed(const Duration(milliseconds: 300), () {
      final node = _focusNodeOrder
          .sortDescendants(_focusNode.traversalDescendants, _focusNode)
          .firstOrNull;
      node?.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: _focusNodeOrder,
      child: PopScope(
        onPopInvokedWithResult: (bool didPop, _) async {
          if (kDebugMode) print("PopScope onPopInvoked popping: $popping");
          if (widget.args.isFromSettings || popping) {
            Navigator.of(context).pop();
            return;
          }
          popping = true;
          getIt<AppCubit>().logout();
        },
        canPop: false,
        child: Focus(
          focusNode: _focusNode,
          child: pageContent(),
        ),
      ),
    );
  }

  Widget get _loading {
    return const Center(child: CircularProgressIndicator());
  }

  Widget pageContent() {
    return BlocProvider(
      create: (_) => getIt<InitiativesCubit>()
        ..init(
          widget.args.selfModel,
          widget.args.session,
          widget.args.sessionId,
          widget.args.isFromSettings,
        ),
      child: Scaffold(
        backgroundColor: ColorManager().getColorBackgroundPrimaryLighter(),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login_back.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const LogoBanner(),
              const SizedBox(height: 100),
              BlocConsumer<InitiativesCubit, InitiativesState>(
                listener: (context, state) => state.whenOrNull(
                  error: (errorMessage) {
                    return OlAlertDialog.show(
                      context,
                      title: LabelsManager()
                          .getRemoteStringFromLabelKeys(RemoteLabelKeys.error),
                      message: errorMessage,
                      actionLabel: LabelsManager()
                          .getRemoteStringFromLabelKeys(RemoteLabelKeys.close),
                    );
                  },
                  success: (routes, initial) {
                    Nav.pushAndRemoveUntil(
                      context,
                      screen: OLHomeScreen(
                        dynamicRoutes: routes ?? [],
                      ),
                    );
                    return;
                  },
                ),
                listenWhen: (previous, current) => current.maybeMap(
                  error: (_) => true,
                  success: (_) => true,
                  orElse: () => false,
                ),
                buildWhen: (previous, current) => current.maybeMap(
                  error: (_) => false,
                  orElse: () => true,
                ),
                builder: (context, state) => state.maybeWhen(
                  loading: () => _loading,
                  initial: () => InitiativeList(
                    selfModel: widget.args.selfModel,
                    session: widget.args.session,
                    sessionId: widget.args.sessionId,
                    args: widget.args,
                  ),
                  orElse: () => const SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InitiativeList extends StatefulWidget {
  final SelfModel selfModel;
  final CognitoUserSession? session;
  final String? sessionId;
  final InitiativesPageArgs args;

  const InitiativeList({
    super.key,
    required this.selfModel,
    this.session,
    this.sessionId,
    required this.args,
  });

  @override
  InitiativeListState createState() => InitiativeListState();
}

class InitiativeListState extends State<InitiativeList> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 887,
        minWidth: 887,
        maxHeight: 900,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: OLColors.backgroundPrimary.withOpacity(0.8),
      ),
      padding: const EdgeInsets.all(Dimens.hPadding),
      child: content(widget.args),
    );
  }

  Widget _header(InitiativesPageArgs args) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LabelsManager().getRemoteStringFromLabelKeys(
            RemoteLabelKeys.select_initiative,
          ),
          textAlign: TextAlign.start,
          style: AppTextTheme.title(
            color: ColorManager().getColorTextPrimaryCta(),
          ),
        ),
        const SizedBox(height: Dimens.spacingXS),
        Text(
          LabelsManager().getRemoteStringFromLabelKeys(
              RemoteLabelKeys.select_initiative_text),
          textAlign: TextAlign.start,
          style: AppTextTheme.subtitle(
            color: ColorManager().getColorTextPrimary(),
          ),
        ),
      ],
    );
  }

  Widget content(InitiativesPageArgs args) {
    if (widget.selfModel.initiatives != null &&
        widget.selfModel.initiatives!.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _header(args),
          const SizedBox(height: Dimens.spacingXXL2),
          ListView.separated(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            separatorBuilder: (context, index) =>
                const SizedBox(height: Dimens.spacingM),
            itemCount: widget.selfModel.initiatives!.length,
            itemBuilder: (BuildContext context, int index) {
              IdLabelModel itemData =
                  widget.selfModel.initiatives!.elementAt(index);

              return OlSelectionItem(
                title: itemData.label ?? '',
                order: index,
                keepSelection: true,
                isSelected: _selectedIndex == index,
                onSelectionChanged: (p0) {
                  if (index == _selectedIndex) {
                    return;
                  }
                  if (p0) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }
                },
              );
            },
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.center,
            child: OLButton(
              onPressed: _selectedIndex != -1
                  ? () {
                      context.read<InitiativesCubit>().setInitiative(
                            session: widget.session!,
                            sessionId: widget.sessionId!,
                            selfModel: widget.selfModel,
                            initiativeId: widget.selfModel.initiatives!
                                .elementAt(_selectedIndex)
                                .id!,
                          );
                    }
                  : null,
              title: LabelsManager().getRemoteStringFromLabelKeys(
                RemoteLabelKeys.continue_button,
              ),
            ),
          )
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _header(args),
        const SizedBox(height: Dimens.spacingXXL2),
        Center(
          child: Text(
            LabelsManager().getRemoteStringFromLabelKeys(
                RemoteLabelKeys.no_initiatives_available),
            textAlign: TextAlign.center,
            style: AppTextTheme.body(),
          ),
        ),
      ],
    );
  }
}

class InitiativesPageArgs {
  final CognitoUserSession? session;
  final SelfModel selfModel;
  final String? sessionId;
  bool isFromSettings;

  InitiativesPageArgs({
    this.session,
    required this.selfModel,
    this.sessionId,
    this.isFromSettings = false,
  });
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
