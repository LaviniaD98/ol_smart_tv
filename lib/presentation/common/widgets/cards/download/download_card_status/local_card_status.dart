import 'package:open_learning_smart_tv/core/utils/extension.dart';
import 'package:open_learning_smart_tv/domain/entities/download/downloaded_item.dart';
import 'package:open_learning_smart_tv/domain/enums/types.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/cards/download/download_card_status/cubit/local_card_status_cubit.dart';
import 'package:open_learning_smart_tv/presentation/common/widgets/tag/status_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalCardStatus extends StatelessWidget {
  const LocalCardStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalCardStatusCubit, LocalCardStatusState>(
      builder: (context, state) => state.when(
        done: (downloadedItem) => _buildCard(downloadedItem),
        loading: () => const SizedBox(),
      ),
    );
  }

  Widget iconByCardStatus(DownloadedItem? downloadedItem) {
    if (downloadedItem == null ||
        downloadedItem.iconStatus == IconStatus.idle) {
      return const SizedBox();
    }
    return StatusTag.svg(
      backgroundColor: downloadedItem.iconStatus.color,
      svgPath: downloadedItem.iconStatus.svgPath ?? '',
    );
  }

  Widget _buildCard(DownloadedItem? downloadedItem) {
    return Positioned(
      top: 8,
      left: 0,
      child: iconByCardStatus(downloadedItem),
    );
  }
}
