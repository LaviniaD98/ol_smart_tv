import 'package:freezed_annotation/freezed_annotation.dart';

part 'ecm_pager_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class EcmPagerDto {
  EcmPagerDto({
    this.totalElements,
    this.totalPages,
    this.page,
    this.pageSize,
  });

  factory EcmPagerDto.fromJson(Map<String, dynamic> json) => _$EcmPagerDtoFromJson(json);

  @JsonKey(name: "total_elements")
  final int? totalElements;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "num_page")
  final int? page;
  @JsonKey(name: "page_size")
  final int? pageSize;
}