import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_pager_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class CommunityPagerDto {
  CommunityPagerDto({
    this.totalElements,
    this.totalPages,
    this.currentPage,
    this.pageSize,
  });

  factory CommunityPagerDto.fromJson(Map<String, dynamic> json) => _$CommunityPagerDtoFromJson(json);

  @JsonKey(name: "total_elements")
  final double? totalElements;
  @JsonKey(name: "total_pages")
  final double? totalPages;
  @JsonKey(name: "current_page")
  final double? currentPage;
  @JsonKey(name: "page_size")
  final double? pageSize;
}