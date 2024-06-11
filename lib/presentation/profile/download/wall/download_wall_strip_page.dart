import 'dart:isolate';
import 'dart:ui';

import 'package:open_learning_smart_tv/core/dependency_injection/dependency_injection.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item_wall.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/app_bar/styled_app_bar.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/cubit/local_card_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/wall/download_card_wall.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_alert_dialog.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_okcancel_dialog.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/dialog/ol_syncing_dialog.dart';
import 'package:open_learning_smart_tv/presentation/corporate_code/corporate_code_page.dart';
import 'package:open_learning_smart_tv/presentation/offline_state/offline_cubit.dart';
import 'package:open_learning_smart_tv/presentation/profile/download/cubit/download_strip_cubit.dart';
import 'package:open_learning_smart_tv/presentation/profile/download/wall/cubit/download_wall_cubit.dart';
import 'package:open_learning_smart_tv/presentation/video_player/offline/video_player_offline_page.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/labels_manager.dart';
import 'package:open_learning_smart_tv/remote_theming/labels/remote_labels_keys.dart';
import 'package:open_learning_smart_tv/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:go_router/go_router.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class DownloadWallStripPage extends StatelessWidget {
  static String routeName = 'downloadWall';
  const DownloadWallStripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DownloadWallCubit>()..fetch(true),
      child: Scaffold(
        appBar: StyledAppBar(
          title: LabelsManager()
              .getRemoteStringFromLabelKeys(RemoteLabelKeys.download),
        ),
        body: SafeArea(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: AppTheme.backgroundGradient,
            ),
            child: BlocConsumer<DownloadWallCubit, DownloadWallState>(
              listener: (context, state) => state.whenOrNull(
                done: () {
                  context.pop();
                  context.read<DownloadWallCubit>().fetch();
                  context.read<DownloadStripCubit>().init();
                  return null;
                },
                syncing: () => OlSyncingDialog.show(context),
                showOfflineDialog: () async {
                  OlAlertDialog.show(
                    context,
                    title: LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.offline_dialog_title),
                    message: LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.offline_dialog_body),
                    actionLabel: LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.ok),
                  );
                  return null;
                },
                showOnlineDialog: (now) async {
                  OlOkCancelDialog.show(
                    context,
                    title: LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.offline_dialog_title),
                    message: LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.offline_turn_online_dialog_body),
                    okActionLabel: LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.ok),
                    cancelActionLabel: LabelsManager()
                        .getRemoteStringFromLabelKeys(RemoteLabelKeys.undo),
                    okCallback: () {
                      context.read<OfflineCubit>().setOfflineMode(false);
                      context
                          .read<OfflineCubit>()
                          .setPersistenofflineMode(false);
                      context.pushReplacementNamed(CorporateCodePage.routeName);
                    },
                    cancelCallback: () {
                      context
                          .read<OfflineCubit>()
                          .setPersistenofflineMode(true);
                    },
                  );
                  return null;
                },
              ),
              listenWhen: (previous, current) => current.maybeMap(
                error: (_) => true,
                done: (_) => true,
                syncing: (_) => true,
                showOfflineDialog: (_) => true,
                showOnlineDialog: (_) => true,
                orElse: () => false,
              ),
              buildWhen: (previous, current) => current.maybeMap(
                error: (_) => false,
                done: (_) => false,
                syncing: (_) => false,
                showOfflineDialog: (_) => false,
                showOnlineDialog: (_) => false,
                orElse: () => true,
              ),
              builder: (context, state) => state.maybeWhen(
                success: (items) {
                  return BlocListener<OfflineCubit, OfflineState>(
                    child: _content(items, context),
                    listener: (BuildContext context, OfflineState state) {
                      state.maybeMap(
                          networkChanged: (value) {
                            context
                                .read<DownloadWallCubit>()
                                .checkIfNeedsToGoOnline();
                            // OlAlertDialog.show(
                            //   context,
                            //   title: "Network",
                            //   message: "Netowrk changed, online: $value",
                            //   actionLabel: "Ok",
                            // );
                          },
                          orElse: () {});
                    },
                  );
                  // _content(items, context);
                },
                loading: () => _loading,
                orElse: () => const SizedBox(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _content(List<DownloadedItemExtended>? items, BuildContext context) {
    // return const SizedBox();
    return Container(
      padding: const EdgeInsets.fromLTRB(
        20.0,
        kToolbarHeight + 32,
        20.0,
        20.0,
      ),
      child: DownloadList(items: items),
    );
  }

  Widget get _loading {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class DownloadList extends StatefulWidget {
  final List<DownloadedItemExtended>? items;
  const DownloadList({super.key, required this.items});
  @override
  DownloadListState createState() => DownloadListState();
}

class DownloadListState extends State<DownloadList> {
  ReceivePort _port = ReceivePort();
  List<DownloadedItemExtended>? items;
  void _onItemTapped(int index) {}

  @override
  void initState() {
    FlutterDownloader.registerCallback(downloadCallback, step: 1);
    _bindBackgroundIsolate();
    items = widget.items;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (kDebugMode) print("didChangeDependencies");
    setState(() {
      items = widget.items;
    });
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant DownloadList oldWidget) {
    if (kDebugMode) print("didUpdateWidget");
    if (oldWidget.items != widget.items) {
      setState(() {
        if (widget.items?.isEmpty == true) {
          items = [];
        }
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Expanded(
            child: items?.isNotEmpty == true
                ? ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: items?.length,
                      itemBuilder: (BuildContext context, int index) {
                        DownloadedItemExtended? itemData;
                        itemData = items?.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            _onItemTapped(index);
                          },
                          child: BlocProvider(
                              create: (_) => getIt<LocalCardCubit>()
                                ..init(itemData!, context),
                              child: DownloadCardWall(() async {
                                DownloadTask? downloadTask = await context
                                    .read<DownloadWallCubit>()
                                    .getDownloadTask(itemData!);
                                if (downloadTask != null && context.mounted) {
                                  itemData.updateTask = downloadTask;
                                  itemData.status ==
                                              DownloadTaskStatus.complete &&
                                          itemData.progress == 100
                                      ? playVideo(context, itemData)
                                      : {
                                          OlAlertDialog.show(
                                            context,
                                            title: LabelsManager()
                                                .getRemoteStringFromLabelKeys(
                                                    RemoteLabelKeys
                                                        .download_dialog_notavailable_title),
                                            message: LabelsManager()
                                                .getRemoteStringFromLabelKeys(
                                                    RemoteLabelKeys
                                                        .download_dialog_notavailable_body),
                                            actionLabel: LabelsManager()
                                                .getRemoteStringFromLabelKeys(
                                                    RemoteLabelKeys
                                                        .download_dialog_notavailable_oklabel),
                                          )
                                        };
                                }
                              }, () {
                                OlOkCancelDialog.show(
                                  context,
                                  title: LabelsManager()
                                      .getRemoteStringFromLabelKeys(
                                          RemoteLabelKeys.download_cancel),
                                  message: LabelsManager()
                                      .getRemoteStringFromLabelKeys(
                                          RemoteLabelKeys
                                              .download_cancel_message),
                                  okActionLabel: LabelsManager()
                                      .getRemoteStringFromLabelKeys(
                                          RemoteLabelKeys
                                              .download_cancel_popup_yes),
                                  cancelActionLabel: LabelsManager()
                                      .getRemoteStringFromLabelKeys(
                                          RemoteLabelKeys
                                              .download_cancel_popup_no),
                                  okCallback: () {
                                    context
                                        .read<DownloadWallCubit>()
                                        .cancelDownload(itemData?.taskId ?? "",
                                            itemData?.downloadedItem);
                                  },
                                  cancelCallback: () {},
                                );
                              })),
                        );
                      },
                    ))
                : Center(
                    child: Text(LabelsManager().getRemoteStringFromLabelKeys(
                        RemoteLabelKeys.download_no_items)))),
        const SizedBox(
          height: 8,
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    if (kDebugMode) print('download_manager wall _unbindBackgroundIsolate');
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
    String id,
    int status,
    int progress,
  ) {
    if (kDebugMode)
      print(
          'download_manager wall downloadCallback Callback on background isolate: task ($id) is in status ($status) and process ($progress)');

    IsolateNameServer.lookupPortByName('downloader_send_port')
        ?.send([id, status, progress]);
  }

  Future<void> _bindBackgroundIsolate() async {
    if (kDebugMode) print('download_manager wall _bindBackgroundIsolate');
    _unbindBackgroundIsolate();
    _port = ReceivePort();
    final isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    if (kDebugMode) print('download_manager wall');
    _port.listen((dynamic data) async {
      final taskId = (data as List<dynamic>)[0] as String;
      final status = DownloadTaskStatus.fromInt(data[1] as int);
      final progress = data[2] as int;
      if (kDebugMode)
        print(
            'download_manager wall Callback on UI isolate: task($taskId) is in status($status) process($progress)');
      if (items != null && items!.isNotEmpty) {
        final downloadedItemWall =
            items!.firstWhere((task) => task.taskId == taskId);
        // updateCard(downloadedItemWall, taskId, status, progress);
        setState(() {
          downloadedItemWall
            ..status = status
            ..progress = progress;
        });
      }
    });
  }

  playVideo(BuildContext context, DownloadedItemExtended itemData) async {
    WakelockPlus.enable();
    await context.pushNamed<bool?>(
      VideoPlayerOfflinePage.routeName,
      extra: VideoPlayerOfflinePageArgs(
        id: itemData.downloadedItem?.id ?? 0,
        title: itemData.downloadedItem?.title ?? 'No title',
        typology: itemData.downloadedItem?.learningObjectTypology ??
            LearningObjectTypology.externalRes,
        type: itemData.downloadedItem?.learningObjectType ??
            LearningObjectType.unknown,
        brightcoveId: itemData.taskId,
        downloadedItemExtended: itemData,
      ),
    );
    WakelockPlus.disable();
    if (context.mounted) {
      await context.read<DownloadWallCubit>().checkOfflineStatements();
    }
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
