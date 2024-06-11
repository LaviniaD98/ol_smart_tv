import '../../../data/models/responses/community/community_pager_dto.dart';

class CommunityPagerModel {
  CommunityPagerModel({
    this.totalElements,
    this.totalPages,
    this.currentPage,
    this.pageSize,
  });

  factory CommunityPagerModel.fromDto(CommunityPagerDto? dto) {
    return CommunityPagerModel(
      totalElements: dto?.totalElements,
      totalPages: dto?.totalPages,
      currentPage: dto?.currentPage,
      pageSize: dto?.pageSize,
    );
  }
  
  final double? totalElements;
  final double? totalPages;
  final double? currentPage;
  final double? pageSize;
}