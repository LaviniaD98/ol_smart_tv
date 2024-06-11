import 'dart:io';

import 'package:open_learning_smart_tv/color_management/color_manager.dart';
import 'package:open_learning_smart_tv/domain/entities/self/id_label_model.dart';
import 'package:open_learning_smart_tv/domain/entities/self/self_model.dart';
import 'package:open_learning_smart_tv/presentation/app_state/cubit/app_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/glow.dart';
import 'package:open_learning_smart_tv/presentation/initiatives/cubit/initiatives_cubit.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/dependency_injection/dependency_injection.dart';
import '../../remote_theming/labels/labels_manager.dart';
import '../../remote_theming/labels/remote_labels_keys.dart';

class InitiativesPage extends StatelessWidget {
  static String routeName = 'initiatives';
  final InitiativesPageArgs args;

  const InitiativesPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    bool popping = false;
    return PopScope(
      onPopInvoked: (bool didPop) async {
        if (Platform.isAndroid) {
          if (kDebugMode) print("PopScope onPopInvoked popping: $popping");
          if (args.isFromSettings || popping) {
            return;
          }
          popping = true;
          getIt<AppCubit>().logout();
        }
      },
      canPop: false,
      child: pageContent(),
    );
  }

  Widget get _loading {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget pageContent() {
    return BlocProvider(
      create: (_) => getIt<InitiativesCubit>()
        ..init(
          args.selfModel,
          args.session,
          args.sessionId,
          args.isFromSettings,
        ),
      child: Scaffold(
        backgroundColor: ColorManager().getColorBackgroundPrimaryLighter(),
        body: Container(
          decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
          child: BlocConsumer<InitiativesCubit, InitiativesState>(
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
                context.read<AppCubit>().updateRouter(
                      initialRoute: initial,
                      dynamicRoutes: routes ?? [],
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
                selfModel: args.selfModel,
                session: args.session,
                sessionId: args.sessionId,
                args: args,
              ),
              orElse: () => const SizedBox(),
            ),
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
    return Padding(
      padding: const EdgeInsets.all(Dimens.spacingL),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(Dimens.spacingM),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.radius),
            gradient: AppTheme.greyGradient,
          ),
          child: content(widget.args),
        ),
      ),
    );
  }

  Widget _header(InitiativesPageArgs args) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          "assets/images/app_logo.svg",
          width: 160,
          height: 24,
        ),
        _backButton(args, context),
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

  Widget _backButton(InitiativesPageArgs args, BuildContext context) {
    if (!args.isFromSettings) {
      return Padding(
        padding: const EdgeInsets.only(
            top: Dimens.spacingM, bottom: Dimens.spacingXL),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => getIt<AppCubit>().logout(),
              behavior: HitTestBehavior.translucent,
              child: SvgPicture.asset("assets/icons/back_arrow.svg"),
            ),
            const SizedBox(width: Dimens.spacingXS),
            Expanded(
              child: Text(
                LabelsManager()
                    .getRemoteStringFromLabelKeys(RemoteLabelKeys.back),
                textAlign: TextAlign.start,
                style: AppTextTheme.caption(
                  color: ColorManager().getColorTextPrimary(),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox(height: 64.0);
  }

  Widget content(InitiativesPageArgs args) {
    if (widget.selfModel.initiatives != null &&
        widget.selfModel.initiatives!.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: Dimens.spacingM),
              itemCount: widget.selfModel.initiatives!.length,
              itemBuilder: (BuildContext context, int index) {
                IdLabelModel itemData =
                    widget.selfModel.initiatives!.elementAt(index);
                final child = _itemCard(itemData, index);
                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _header(args),
                      const SizedBox(height: Dimens.spacingXXL2),
                      child,
                    ],
                  );
                }
                return child;
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                Dimens.spacingM,
                Dimens.spacingM,
                Dimens.spacingM,
                0,
              ),
              child: ElevatedButton(
                style: AppButtonStyle.red,
                key: const Key('loginForm_continue_raisedButton'),
                onPressed: _selectedIndex != -1
                    ? () {
                        context.read<InitiativesCubit>().setInitiative(
                            session: widget.session!,
                            sessionId: widget.sessionId!,
                            selfModel: widget.selfModel,
                            initiativeId: widget.selfModel.initiatives!
                                .elementAt(_selectedIndex)
                                .id!);
                      }
                    : null,
                child: Text(
                  LabelsManager().getRemoteStringFromLabelKeys(
                    RemoteLabelKeys.continue_button,
                  ),
                ),
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
        Expanded(
          child: Center(
            child: Text(
              LabelsManager().getRemoteStringFromLabelKeys(
                  RemoteLabelKeys.no_initiatives_available),
              textAlign: TextAlign.center,
              style: AppTextTheme.body(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _itemCard(IdLabelModel itemData, int index) {
    final isSelected = index == _selectedIndex;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        alignment: Alignment.topCenter,
        child: Glow(
          glow: isSelected,
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 56.0,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                width: 1,
                color: isSelected
                    ? ColorManager().getColorBorderAccent()
                    : ColorManager().getColorBorderTag(),
              ),
              borderRadius: BorderRadius.circular(Dimens.radius),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: Dimens.spacingS,
              horizontal: Dimens.spacingL,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    itemData.label ?? "no label",
                    textAlign: TextAlign.start,
                    style: AppTextTheme.subtitle(
                      color: isSelected
                          ? ColorManager().getColorSystemSecondary01()
                          : ColorManager().getColorTextPrimary(),
                    ),
                  ),
                ),
                const SizedBox(width: Dimens.spacingM),
                if (isSelected)
                  SvgPicture.asset(
                    "assets/icons/ic_flagged.svg",
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      ColorManager().getColorSystemSecondary01(),
                      BlendMode.srcIn,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InitiativesPageArgs {
  final CognitoUserSession? session;
  final SelfModel selfModel;
  final String? sessionId;
  bool isFromSettings;

  InitiativesPageArgs(
      {this.session,
      required this.selfModel,
      this.sessionId,
      this.isFromSettings = false});
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
