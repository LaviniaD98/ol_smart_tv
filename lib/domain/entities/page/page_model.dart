import 'package:open_learning_smart_tv/data/models/responses/page/page_dto.dart';

import '../../../data/models/responses/generic/relative_path_dto.dart';
import '../strip/row/strip_row.dart';

class PageModel {
  final String pageName;
  final List<StripRow> strips;

  PageModel({
    required this.pageName,
    required this.strips,
  });

  factory PageModel.fromDto(PageDto dto) {
    return PageModel(
      pageName: dto.pageName,
      strips: dto.relativePaths
              ?.map(_dtoToStripRow)
              .whereType<StripRow>()
              .toList() ??
          [],
    );
  }

  static StripRow? _dtoToStripRow(RelativePathDto relativePath) {
    switch (relativePath.serviceType) {
      case 'widgetCalendar':
        return StripRow.widgetCalendar(
          id: relativePath.id,
          title: relativePath.title,
          apiPath: relativePath.apiPath,
          preSelected: relativePath.preSelected,
          labelMapping: relativePath.labelMapping,
        );
      case 'widgetContinueLearning':
        return StripRow.widgetContinueLearning(
          id: relativePath.id,
          title: relativePath.title,
          apiPath: relativePath.apiPath,
          preSelected: relativePath.preSelected,
          labelMapping: relativePath.labelMapping,
        );
      case 'visForyou':
        return StripRow.visForYou(
          id: relativePath.id,
          title: relativePath.title,
          apiPath: relativePath.apiPath,
          preSelected: relativePath.preSelected,
          labelMapping: relativePath.labelMapping,
        );
      case 'sliderTopContentExplore':
        return StripRow.sliderTopContentExplore(
          id: relativePath.id,
          title: relativePath.title,
          apiPath: relativePath.apiPath,
          preSelected: relativePath.preSelected,
          labelMapping: relativePath.labelMapping,
        );
      case 'trainingMandatory':
        return StripRow.trainingMandatory(
          id: relativePath.id,
          title: relativePath.title,
          apiPath: relativePath.apiPath,
          preSelected: relativePath.preSelected,
          labelMapping: relativePath.labelMapping,
        );
      case 'visCarSuggested':
        return StripRow.visCarSuggested(
          id: relativePath.id,
          title: relativePath.title,
          apiPath: relativePath.apiPath,
          preSelected: relativePath.preSelected,
          labelMapping: relativePath.labelMapping,
        );
      case 'visCarTrainingTransversal':
        return StripRow.visCarTrainingTransversal(
          id: relativePath.id,
          title: relativePath.title,
          apiPath: relativePath.apiPath,
          preSelected: relativePath.preSelected,
          labelMapping: relativePath.labelMapping,
        );
      case 'visCarBestRating':
        return StripRow.visCarBestRating(
          id: relativePath.id,
          title: relativePath.title,
          apiPath: relativePath.apiPath,
          preSelected: relativePath.preSelected,
          labelMapping: relativePath.labelMapping,
        );
      case 'carConteSpeciDurata':
        return StripRow.latestLearning(
          id: relativePath.id,
          title: relativePath.title,
          apiPath: relativePath.apiPath,
          preSelected: relativePath.preSelected,
          labelMapping: relativePath.labelMapping,
        );
      case 'favourites':
        return StripRow.favourites(
          id: relativePath.id,
          title: relativePath.title,
          apiPath: relativePath.apiPath,
          preSelected: relativePath.preSelected,
          labelMapping: relativePath.labelMapping,
        );
      case 'visCarCategory':
        return StripRow.visCarCategory(
          id: relativePath.id,
          title: relativePath.title,
          apiPath: relativePath.apiPath,
          preSelected: relativePath.preSelected,
          labelMapping: relativePath.labelMapping,
        );
      default:
        return null;
    }
  }
}
