import 'package:freezed_annotation/freezed_annotation.dart';

import 'cms_wrapper_body_dto.dart';

part 'cms_wrapper_dto.g.dart';

@JsonSerializable(createFactory: false, explicitToJson: true)
class CmsWrapperDto {
  const CmsWrapperDto({
    this.body,
    this.method,
    this.endpoint,
    this.initiativeid,
    this.corporateid,
    this.userId,
  });

  Map<String, dynamic> toJson() => _$CmsWrapperDtoToJson(this);

  @JsonKey(name: "body")
  final CmsWrapperBodyDto? body;
  @JsonKey(name: "method")
  final String? method;
  @JsonKey(name: "endpoint")
  final String? endpoint;
  @JsonKey(name: "x-initiative-id")
  final int? initiativeid;
  @JsonKey(name: "corporateid")
  final int? corporateid;
  @JsonKey(name: "x-user-id")
  final int? userId;
}

@JsonSerializable(createFactory: false, explicitToJson: true)
class CmsWrapperAddDto {
  const CmsWrapperAddDto({
    this.body,
    this.method,
    this.endpoint,
    this.initiativeid,
    this.corporateid,
    this.userId,
  });

  Map<String, dynamic> toJson() => _$CmsWrapperAddDtoToJson(this);

  @JsonKey(name: "body")
  final CmsWrapperBodyAddDto? body;
  @JsonKey(name: "method")
  final String? method;
  @JsonKey(name: "endpoint")
  final String? endpoint;
  @JsonKey(name: "x-initiative-id")
  final int? initiativeid;
  @JsonKey(name: "corporateid")
  final int? corporateid;
  @JsonKey(name: "x-user-id")
  final int? userId;
}

@JsonSerializable(createFactory: false, explicitToJson: true)
class CmsWrapperPostDto {
  const CmsWrapperPostDto({
    this.body,
    this.method,
    this.endpoint,
    this.initiativeid
  });

  Map<String, dynamic> toJson() => _$CmsWrapperPostDtoToJson(this);

  @JsonKey(name: "body")
  final CmsWrapperBodyDto? body;
  @JsonKey(name: "method")
  final String? method;
  @JsonKey(name: "endpoint")
  final String? endpoint;
  @JsonKey(name: "x-initiative-id")
  final int? initiativeid;
}