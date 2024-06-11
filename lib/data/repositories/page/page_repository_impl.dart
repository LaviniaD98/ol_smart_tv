import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_learning_smart_tv/data/models/failure.dart';

import '../../../domain/entities/page/page_model.dart';
import '../../../domain/repositories/page/page_repository.dart';
import '../../data_sources/page/page_data_source.dart';

@LazySingleton(as: PageRepository)
class PageRepositoryImpl implements PageRepository {
  final PageDataSource _pageDataSource;

  PageRepositoryImpl(this._pageDataSource);

  @override
  Future<Either<Failure, PageModel>> getPage(String path) {
    return catchFailure(() async {
      final res = await _pageDataSource.getPage(path);
      return PageModel.fromDto(res);
    });
  }
}
